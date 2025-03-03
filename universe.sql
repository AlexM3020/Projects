--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric NOT NULL,
    discovery_year integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    n_of_stars integer NOT NULL,
    description text,
    diameter integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text DEFAULT ''::text NOT NULL,
    diameter numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    n_of_smoons integer,
    radius numeric,
    habitability boolean,
    star_id integer,
    description text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_in_milky_way boolean,
    galaxy_id integer,
    description text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 1801);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 1807);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 1802);
INSERT INTO public.asteroid VALUES (4, 'Eros', 16.84, 1898);
INSERT INTO public.asteroid VALUES (5, 'Ida', 31.4, 1884);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, '', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Nearest major galaxy', 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000, 'Third-largest in Local Group', 60000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 20000, 'Famous spiral galaxy', 76000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 8000, 'Bright nucleus and large bulge', 50000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 100000, 'Supermassive black hole', 120000);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 3000, 'Satellite galaxy of Milky Way', 14000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, '', NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 'One of Mars’ small moons', 22.4);
INSERT INTO public.moon VALUES (3, 'Deimos', 3, 'Smaller moon of Mars', 12.4);
INSERT INTO public.moon VALUES (4, 'Io', 4, 'Volcanically active moon of Jupiter', 3643.2);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 'Icy moon with a subsurface ocean', 3121.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 'Largest moon in the Solar System', 5268.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 'Heavily cratered moon of Jupiter', 4820.6);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 'Largest moon of Saturn, has a thick atmosphere', 5150);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 'Saturn’s moon with geysers', 504.2);
INSERT INTO public.moon VALUES (10, 'Triton', 6, 'Neptune’s largest moon, retrograde orbit', 2706.8);
INSERT INTO public.moon VALUES (11, 'Nereid', 6, 'Distant, irregular moon of Neptune', 340);
INSERT INTO public.moon VALUES (12, 'Charon', 7, 'Pluto’s largest moon', 1212);
INSERT INTO public.moon VALUES (13, 'Proxima b-I', 8, 'Potential exomoon orbiting Proxima b', 1600);
INSERT INTO public.moon VALUES (14, 'Proxima b-II', 8, 'Hypothetical moon of Proxima b', 1200);
INSERT INTO public.moon VALUES (15, 'Alpha Andromedae I', 9, 'First detected moon in Andromeda', 3000);
INSERT INTO public.moon VALUES (16, 'Alpha Andromedae II', 9, 'Another large exomoon in Andromeda', 2500);
INSERT INTO public.moon VALUES (17, 'M33-1b-I', 10, 'First known moon in the Triangulum Galaxy', 2800);
INSERT INTO public.moon VALUES (18, 'M33-1b-II', 10, 'Companion moon to M33-1b', 2100);
INSERT INTO public.moon VALUES (19, 'M87* b-I', 11, 'Hypothetical moon near M87*', 5000);
INSERT INTO public.moon VALUES (20, 'M87* b-II', 11, 'Another moon in the M87 system', 4500);
INSERT INTO public.moon VALUES (21, 'M87* c-I', 12, 'Likely exomoon orbiting M87* c', 4300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1757, true, 1, '');
INSERT INTO public.planet VALUES (2, 'Mercury', 0, 2440, false, 1, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (3, 'Venus', 0, 6052, false, 1, 'Hottest planet in the Solar System');
INSERT INTO public.planet VALUES (4, 'Mars', 2, 3389, false, 1, 'Known as the Red Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 69911, false, 1, 'Largest planet in the Solar System');
INSERT INTO public.planet VALUES (6, 'Neptune', 14, 24622, false, 1, 'Furthest planet from the Sun');
INSERT INTO public.planet VALUES (7, 'Proxima b', 0, 7000, true, 3, 'Potentially habitable exoplanet around Proxima Centauri');
INSERT INTO public.planet VALUES (8, 'Proxima c', 0, 13000, false, 3, 'Super-Earth or mini-Neptune around Proxima Centauri');
INSERT INTO public.planet VALUES (9, 'Alpha Andromedae b', 2, 15000, false, 4, 'Giant exoplanet in Andromeda');
INSERT INTO public.planet VALUES (10, 'M33-1b', 3, 20000, false, 5, 'First detected planet in the Triangulum Galaxy');
INSERT INTO public.planet VALUES (11, 'M33-1c', 1, 18000, false, 5, 'Another exoplanet in Triangulum');
INSERT INTO public.planet VALUES (12, 'M87* b', 0, 50000, false, 6, 'Possible rogue planet near M87*');
INSERT INTO public.planet VALUES (13, 'M87* c', 0, 60000, false, 6, 'Another hypothetical planet near the black hole M87*');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 1, '');
INSERT INTO public.star VALUES (2, 'Sirius', true, 1, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Betelgeuse', true, 1, 'Red supergiant in Orion');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', true, 1, 'Closest star to the Sun');
INSERT INTO public.star VALUES (5, 'Alpha Andromedae', false, 2, 'Brightest star in Andromeda');
INSERT INTO public.star VALUES (6, 'M33-1', false, 3, 'First recorded star in Triangulum');
INSERT INTO public.star VALUES (7, 'M87*', false, 6, 'Black hole host star in Messier 87');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_desc; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_desc UNIQUE (description);


--
-- Name: planet unique_descr; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_descr UNIQUE (description);


--
-- Name: moon unique_descri; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_descri UNIQUE (description);


--
-- Name: galaxy unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_description UNIQUE (description);


--
-- Name: asteroid unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_stars; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_stars FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_stars_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_stars_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

