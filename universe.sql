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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_in_millions_of_lightyears numeric(10,2)
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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean,
    planet_id integer
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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean,
    has_rings boolean,
    no_moons integer,
    star_id integer
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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_id integer,
    distance_from_earth_in_millions_of_lightyears numeric(10,2)
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A', 'Supermassive black hole at the Milky Ways center', 13000);
INSERT INTO public.blackhole VALUES (2, 'M87', 'Giant supermassive black hole with visible jet', 13000);
INSERT INTO public.blackhole VALUES (3, 'Cygnus X-1', 'Stellar-mass black hole in binary system', 5);
INSERT INTO public.blackhole VALUES (4, 'V404 Cygni', 'Variable stellar-mass black hole with X-ray source', 20);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy containing our solar system', 13600, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way', 13000, 2.54);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy in Local Group', 12000, 2.73);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral galaxy with prominent dust lane', 13000, 29.30);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting grand-design spiral galaxy', 12500, 23.00);
INSERT INTO public.galaxy VALUES (6, 'L. Magellanic Cloud', 'Irregular satellite galaxy of the Milky Way', 13000, 0.16);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Large rocky moon stabilizing Earths axial tilt', 4500, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Small irregular inner moon with rapid orbit', 4500, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Small outer Martian moon with smooth surface', 4500, false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Icy moon with subsurface ocean beneath crust', 4500, false, 5);
INSERT INTO public.moon VALUES (5, 'Io', 'Volcanically active moon with extreme tidal heating', 4500, false, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Heavily cratered moon with ancient surface', 4500, false, 5);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Largest moon with intrinsic magnetic field', 4500, false, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Icy moon with active subsurface ocean jets', 4500, false, 6);
INSERT INTO public.moon VALUES (9, 'Titan', 'Thick atmosphere and methane lakes on surface', 4500, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Two-toned moon with equitorial ridge', 4500, false, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Saturns second-largest icy moon', 4500, false, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 'Bright icy moon with large impact basin', 4500, false, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 'Icy moon with bright fracture features', 4500, false, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Icy moon with smooth plains and faults', 4500, false, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Small moon with extreme geological terrains', 4500, false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Dark heavily cratered Uranian moon', 4500, false, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 'Largest Uranian moon with faulted surface', 4500, false, 7);
INSERT INTO public.moon VALUES (18, 'Nix', 'Small irregular moon orbiting Pluto-Charon system', 4500, false, 9);
INSERT INTO public.moon VALUES (19, 'Charon', 'Large companion moon forming binary system', 4500, false, 9);
INSERT INTO public.moon VALUES (20, 'Triton', 'Retrograde icy moon with nitrogen geysers', 4500, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Small airless rocky planet closest to the Sun', 4600, false, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hot terrestrial planet with dense atmosphere', 4600, false, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Water-covered terrestrial planet with known life', 4540, true, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Cold desert world with polar ice caps', 4600, false, false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Massive gas giant with strong magnetic field', 4600, false, true, 95, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant with prominent ring system', 4500, false, true, 146, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with tilted rotational axis', 4500, false, true, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant with extreme winds', 4500, false, true, 14, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Icy Kuiper belt world with thin atmosphere', 4500, false, false, 5, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 'Small close-orbiting rocky exoplanet', 4800, false, false, 0, 2);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', 'Candidate cold super-Earth on wide orbit', 4800, false, false, 0, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Temperate terrestrial exoplanet in habitable zone', 4800, false, false, 0, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type main-sequence star with planetary system', 4600, 1, 0.00);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest red dwarf star to the Sun', 4800, 1, 0.00);
INSERT INTO public.star VALUES (5, 'R136a1', 'Extremely massive, luminous blue supergiant star', 2, 6, 0.16);
INSERT INTO public.star VALUES (3, 'M31-V1', 'Classical Cepheid variable used for distance scale', 200, 2, 2.54);
INSERT INTO public.star VALUES (4, 'B416', 'Luminous blue variable massive unstable star', 5, 3, 2.73);
INSERT INTO public.star VALUES (6, 'Sk-69 202', 'Blue supergiant progenitor of Supernova 1987A', 10, 6, 0.17);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
