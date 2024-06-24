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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_in_mpc numeric(9,3),
    diameter_in_kpc numeric(6,2),
    year_discovered integer
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
    planet_id integer NOT NULL,
    gravity_in_gs numeric(5,4),
    orbiting_planetoid boolean
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
    star_id integer NOT NULL,
    gravity numeric(6,3),
    notes text
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
-- Name: planetoid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetoid (
    planetoid_id integer NOT NULL,
    name character varying(20) NOT NULL,
    orbit_diameter_au numeric(5,3)
);


ALTER TABLE public.planetoid OWNER TO freecodecamp;

--
-- Name: planetoid_planetoid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetoid_planetoid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetoid_planetoid_id_seq OWNER TO freecodecamp;

--
-- Name: planetoid_planetoid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetoid_planetoid_id_seq OWNED BY public.planetoid.planetoid_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_in_ly integer,
    collapsed boolean DEFAULT false
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
-- Name: planetoid planetoid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetoid ALTER COLUMN planetoid_id SET DEFAULT nextval('public.planetoid_planetoid_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky_Way', NULL, 26.80, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 0.765, 46.56, -964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 0.970, 18.74, 1654);
INSERT INTO public.galaxy VALUES (4, 'Hoags Object', 187.900, 45.41, 1950);
INSERT INTO public.galaxy VALUES (5, 'Eye of God Galaxy', 18.700, 30.66, 1784);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 9.550, 29.09, 1781);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.1654, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, 0.1831, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0.1340, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 0.1456, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 0.1259, NULL);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 0.0065, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 0.0113, NULL);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 0.0148, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 0.0236, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 0.0269, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 0.1380, NULL);
INSERT INTO public.moon VALUES (14, 'lapetus', 6, 0.0220, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 0.0080, NULL);
INSERT INTO public.moon VALUES (16, 'Arial', 7, 0.0280, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 0.0230, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 0.0400, NULL);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 0.0360, NULL);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 0.0800, NULL);
INSERT INTO public.moon VALUES (21, 'Charon', 13, 0.0290, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.377, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.904, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.000, 'Home');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.378, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2.528, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1.065, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 0.904, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 1.137, NULL);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri b', 2, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri d', 2, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'GJ 273b', 3, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'GJ 273c', 3, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Pluto', 1, NULL, NULL);


--
-- Data for Name: planetoid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetoid VALUES (1, 'Ceres', 2.766);
INSERT INTO public.planetoid VALUES (2, 'Pluto', 39.482);
INSERT INTO public.planetoid VALUES (3, 'Eris', 67.668);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, false);
INSERT INTO public.star VALUES (2, 'Proxima Cenauri', 1, 4, false);
INSERT INTO public.star VALUES (3, 'Luytens Star', 1, 12, false);
INSERT INTO public.star VALUES (4, 'Alchiba', 1, 49, false);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 500, false);
INSERT INTO public.star VALUES (6, 'Black Widow Pulsar', 1, 6500, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planetoid_planetoid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetoid_planetoid_id_seq', 3, true);


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
-- Name: planetoid planetoid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetoid
    ADD CONSTRAINT planetoid_name_key UNIQUE (name);


--
-- Name: planetoid planetoid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetoid
    ADD CONSTRAINT planetoid_pkey PRIMARY KEY (planetoid_id);


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
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

