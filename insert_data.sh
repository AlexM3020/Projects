#!/bin/bash

# Database connection setup
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Path to the CSV file
CSV_FILE="games.csv"

# Step 1: Insert unique teams into the teams table
echo "Inserting teams..."

# Extract unique teams from the CSV file (skip the header line)
TEAMS=$(tail -n +2 "$CSV_FILE" | cut -d ',' -f 3,4 | tr ',' '\n' | sort | uniq)

# Loop through each team and insert into the teams table
while IFS= read -r TEAM; do
  if [[ -n "$TEAM" ]]; then
    # Insert the team if it doesn't already exist
    INSERT_RESULT=$($PSQL "INSERT INTO teams (name) SELECT '$TEAM' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name = '$TEAM')")
    if [[ $INSERT_RESULT == "INSERT 0 1" ]]; then
      echo "Inserted team: $TEAM"
    fi
  fi
done <<< "$TEAMS"

# Step 2: Insert game data into the games table
echo "Inserting games..."

# Read the CSV file line by line (skip the header line)
tail -n +2 "$CSV_FILE" | while IFS=, read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
  # Get the team_id for the winner and opponent
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

  # Insert the game data into the games table
  INSERT_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  
  if [[ $INSERT_RESULT == "INSERT 0 1" ]]; then
    echo "Inserted game: $YEAR, $ROUND, $WINNER vs $OPPONENT"
  fi
done

echo "Data insertion complete."
