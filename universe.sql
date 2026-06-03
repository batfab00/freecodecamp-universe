--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km numeric,
    hazardous boolean NOT NULL
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroids.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    number_of_planets integer,
    is_sperical boolean,
    description text NOT NULL
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
    moon_type character varying(30),
    moon_age integer,
    planet_id integer NOT NULL,
    description text NOT NULL
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
    planet_type character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    star_id integer NOT NULL,
    description text NOT NULL
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
    star_type character varying(30),
    star_age numeric,
    galaxy_id integer NOT NULL,
    description text NOT NULL
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
-- Name: asteroids asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 'Ceres', 946, false);
INSERT INTO public.asteroids VALUES (2, 'Vesta', 525, false);
INSERT INTO public.asteroids VALUES (3, 'Eros', 17, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 8, true, 'Home galaxy of the Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 14, true, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10, true, 'Third-largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 9, false, 'Bright central bulge');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 12, true, 'Interacting spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 6, false, 'Satellite galaxy of the Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 'Rocky', 4500, 3, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (3, 'Phobos', 'Rocky', 4500, 4, 'Inner moon of Mars with a decaying orbit');
INSERT INTO public.moon VALUES (4, 'Deimos', 'Rocky', 4500, 4, 'Outer moon of Mars, small and irregular');
INSERT INTO public.moon VALUES (5, 'Io', 'Volcanic', 4500, 5, 'Most volcanically active body in the solar system');
INSERT INTO public.moon VALUES (6, 'Europa', 'Icy', 4500, 5, 'Icy moon with a subsurface ocean');
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Rocky-Icy', 4500, 5, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (8, 'Callisto', 'Rocky-Icy', 4500, 5, 'Heavily cratered ancient surface');
INSERT INTO public.moon VALUES (9, 'Amalthea', 'Rocky', 4500, 5, 'Irregular inner moon of Jupiter');
INSERT INTO public.moon VALUES (10, 'Himalia', 'Rocky', 4500, 5, 'Large outer irregular satellite');
INSERT INTO public.moon VALUES (11, 'Elara', 'Rocky', 4500, 5, 'Small irregular moon of Jupiter');
INSERT INTO public.moon VALUES (12, 'Titan', 'Atmospheric', 4500, 6, 'Thick atmosphere with methane lakes');
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Icy', 4500, 6, 'Ice geysers and subsurface ocean');
INSERT INTO public.moon VALUES (14, 'Mimas', 'Icy', 4500, 6, 'Small moon with a large impact crater');
INSERT INTO public.moon VALUES (15, 'Rhea', 'Icy', 4500, 6, 'Icy cratered surface moon of Saturn');
INSERT INTO public.moon VALUES (16, 'Dione', 'Icy', 4500, 6, 'Bright icy surface with cliffs');
INSERT INTO public.moon VALUES (17, 'Tethys', 'Icy', 4500, 6, 'Large impact crater Odysseus');
INSERT INTO public.moon VALUES (18, 'Iapetus', 'Rocky-Icy', 4500, 6, 'Two-toned surface mystery moon');
INSERT INTO public.moon VALUES (19, 'Miranda', 'Rocky-Icy', 4500, 7, 'Chaotic surface with cliffs and canyons');
INSERT INTO public.moon VALUES (20, 'Ariel', 'Rocky-Icy', 4500, 7, 'Brightest and geologically active Uranian moon');
INSERT INTO public.moon VALUES (21, 'Triton', 'Icy', 4500, 8, 'Retrograde orbit with geysers of nitrogen');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Rocky', 4500, 77, false, 1, 'No atmosphere and extreme temperature changes');
INSERT INTO public.planet VALUES (2, 'Venus', 'Rocky', 4500, 41, false, 1, 'Thick toxic atmosphere with runaway greenhouse effect');
INSERT INTO public.planet VALUES (3, 'Earth', 'Rocky', 4500, 0, true, 1, 'Only known planet with confirmed life');
INSERT INTO public.planet VALUES (4, 'Mars', 'Rocky', 4500, 225, false, 1, 'Cold desert planet with evidence of past water');
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 4500, 588, false, 1, 'Largest planet with a massive storm system');
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 4500, 1200, false, 1, 'Known for its prominent ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 4500, 2600, false, 1, 'Rotates on its side with a cold atmosphere');
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 4500, 4300, false, 1, 'Strong winds and deep blue atmosphere');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Rocky', 4800, 4, false, 2, 'Exoplanet in habitable zone of Proxima Centauri');
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 'Rocky', 4800, 4, false, 2, 'Small exoplanet with uncertain surface conditions');
INSERT INTO public.planet VALUES (11, 'Sirius Ab', 'White Dwarf Companion', 250, 9, false, 3, 'Hypothetical companion in the Sirius star system');
INSERT INTO public.planet VALUES (12, 'Andromeda Exo-1', 'Rocky', 3000, 2500000, false, 4, 'Distant exoplanet in the Andromeda galaxy');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type Main Sequence', 4.6, 1, 'Star at the center of the Solar System');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 4.8, 1, 'Closest known star to the Sun');
INSERT INTO public.star VALUES (3, 'Sirius', 'A-Type Main Sequence', 0.24, 1, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (4, 'Alpheratz', 'Blue-White Giant', 0.06, 2, 'Bright star associated with Andromeda');
INSERT INTO public.star VALUES (5, 'Mirach', 'Red Giant', 2.0, 2, 'Red giant in Andromeda');
INSERT INTO public.star VALUES (6, 'M33 Variable 1', 'Hypergiant', 4.0, 3, 'Hypergiant star in Triangulum Galaxy');


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

