--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    biggest_planet character varying NOT NULL,
    num_solar_systems character varying NOT NULL
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
    name character varying NOT NULL,
    description text NOT NULL,
    distance_from_earth integer NOT NULL,
    radius_km numeric NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    num_planets integer,
    name character varying NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    description text NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy we currently reside in', 'MOA-2011-BLG-322', '3916');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Another universe', 'PA-99-N2', '0');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Another Universe', 'M51-ULS-1B', '0');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Another Universe', 'Unknown', '0');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Another Universe', 'Unknown', '3');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Another Universe', 'Unknown', '0');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon of the Earth', 'The only natural satellite for Earth', 382500, 1737, 1, 1);
INSERT INTO public.moon VALUES (3, 'Europa', 'A Jupiter Moon', 628287897, 1560, 1, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'A Jupiter Moon', 628287897, 2634, 1, 2);
INSERT INTO public.moon VALUES (5, 'Io', 'A Jupiter Moon', 628287897, 1821, 1, 2);
INSERT INTO public.moon VALUES (6, 'Callisto', 'A Jupiter Moon', 628287897, 2410, 1, 2);
INSERT INTO public.moon VALUES (7, 'Mneme', 'A Jupiter Moon', 628287897, 1, 1, 2);
INSERT INTO public.moon VALUES (8, 'Carpo', 'A Jupiter Moon', 628287897, 1, 2, 2);
INSERT INTO public.moon VALUES (9, 'Thebe', 'A Jupiter Moon', 628287897, 49.3, 1, 2);
INSERT INTO public.moon VALUES (12, 'Amalthea', 'A Jupiter Moon', 628287897, 83.5, 1, 2);
INSERT INTO public.moon VALUES (13, 'Eirene', 'A Jupiter Moon', 628287897, 2, 1, 2);
INSERT INTO public.moon VALUES (14, 'Adrastea', 'A Jupiter Moon', 628287897, 8.19, 1, 2);
INSERT INTO public.moon VALUES (15, 'Callirrhoe', 'A Jupiter Moon', 628287897, 4.3, 1, 2);
INSERT INTO public.moon VALUES (16, 'Ananke', 'A Jupiter Moon', 628287897, 14, 1, 2);
INSERT INTO public.moon VALUES (17, 'Carme', 'A Jupiter Moon', 628287897, 23, 1, 2);
INSERT INTO public.moon VALUES (18, 'Himalia', 'A Jupiter Moon', 628287897, 85, 1, 2);
INSERT INTO public.moon VALUES (19, 'Elara', 'A Jupiter Moon', 628287897, 43, 1, 2);
INSERT INTO public.moon VALUES (20, 'Hermippe', 'A Jupiter Moon', 628287897, 2, 1, 2);
INSERT INTO public.moon VALUES (21, 'Aitne', 'A Jupiter Moon', 628287897, 1.5, 1, 2);
INSERT INTO public.moon VALUES (22, 'Arche', 'A Jupiter Moon', 628287897, 1.5, 1, 2);
INSERT INTO public.moon VALUES (23, 'Erinome', 'A Jupiter Moon', 628287897, 1.6, 1, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Where we are currently.', 1, 2);
INSERT INTO public.planet VALUES (2, 'Jupiter', false, 'Another Planet', 1, 2);
INSERT INTO public.planet VALUES (3, 'Saturn', false, 'Another Planet', 1, 2);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Another Planet', 1, 2);
INSERT INTO public.planet VALUES (5, 'Venus', false, 'Another Planet', 1, 2);
INSERT INTO public.planet VALUES (6, 'Mercury', false, 'Another Planet', 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Another Planet', 1, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Another Planet', 1, 2);
INSERT INTO public.planet VALUES (9, 'Kepler-90b', false, 'Another Planet within Kepler-90', 1, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-90c', false, 'Another Planet within Kepler-90', 1, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-90d', false, 'Another Planet within Kepler-90', 1, 3);
INSERT INTO public.planet VALUES (12, 'Kepler-90e', false, 'Another Planet within Kepler-90', 1, 3);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, NULL, 'Sol');
INSERT INTO public.solar_system VALUES (2, NULL, '47 Ursae Majoris');
INSERT INTO public.solar_system VALUES (3, NULL, 'Gliese 876');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', true, 9459, 'Biggest star in the Milky Way', 1);
INSERT INTO public.star VALUES (2, 'The Sun', true, 150000000, 'The star Earth orbits.', 1);
INSERT INTO public.star VALUES (3, 'Kepler-90', true, 2544, 'Another Star', 1);
INSERT INTO public.star VALUES (4, 'Trappist-1', true, 40, 'Another Star', 1);
INSERT INTO public.star VALUES (5, 'Tau Ceti', true, 12, 'Another Star', 1);
INSERT INTO public.star VALUES (6, 'Gliese 1061', true, 12, 'Another Star', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


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
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
