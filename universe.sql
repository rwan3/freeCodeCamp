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
    name character varying(30) NOT NULL,
    description text,
    angle numeric(4,1),
    brightness numeric(4,1)
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
-- Name: hurz; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.hurz (
    hurz_id integer NOT NULL,
    is_hurz boolean NOT NULL,
    name character varying(30)
);


ALTER TABLE public.hurz OWNER TO freecodecamp;

--
-- Name: hurz_hurz_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.hurz_hurz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hurz_hurz_id_seq OWNER TO freecodecamp;

--
-- Name: hurz_hurz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.hurz_hurz_id_seq OWNED BY public.hurz.hurz_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    diameter integer,
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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_occupied boolean,
    description text,
    age_in_million_of_years integer,
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
    name character varying(30) NOT NULL,
    description text,
    age_in_million_of_years integer,
    distance_from_earth integer,
    galaxy_id integer
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
-- Name: hurz hurz_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hurz ALTER COLUMN hurz_id SET DEFAULT nextval('public.hurz_hurz_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milchstraße', 'Unsere Heimatgalaxie', 120.5, 8.2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda-Galaxie', 'Die nächstgelegene Spiralgalaxie zur Milchstraße', 157.2, 7.9);
INSERT INTO public.galaxy VALUES (3, 'Dreiecksnebel', 'Eine Galaxie in der Nähe der Milchstraße', 95.8, 7.1);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool-Galaxie', 'Eine Spiralgalaxie mit auffälligen Spiralarmen', 82.4, 7.6);
INSERT INTO public.galaxy VALUES (5, 'Sombrero-Galaxie', 'Eine Galaxie mit einer charakteristischen scheibenförmigen Struktur', 105.3, 7.3);
INSERT INTO public.galaxy VALUES (6, 'Schwarzes Auge-Galaxie', 'Eine elliptische Galaxie mit einem markanten schwarzen Fleck', 68.9, 6.8);


--
-- Data for Name: hurz; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.hurz VALUES (1, true, NULL);
INSERT INTO public.hurz VALUES (2, false, NULL);
INSERT INTO public.hurz VALUES (3, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (42, 'Deimos', 'Der zweitgrößte Mond des Planeten Mars. Er hat einen Durchmesser von etwa 15 Kilometern und ist ebenfalls unregelmäßig geformt.', false, 15, 1);
INSERT INTO public.moon VALUES (43, 'Titan', 'Der größte Mond des Planeten Saturn und der zweitgrößte Mond im Sonnensystem. Er hat einen Durchmesser von etwa 5.150 Kilometern und ist der einzige Mond mit einer dichten Atmosphäre.', true, 5150, 1);
INSERT INTO public.moon VALUES (44, 'Ganymed', 'Der größte Mond des Planeten Jupiter und der größte Mond im Sonnensystem. Er hat einen Durchmesser von etwa 5.268 Kilometern und ist größer als der Planet Merkur.', true, 5268, 1);
INSERT INTO public.moon VALUES (41, 'Phobos', 'Der größte Mond des Planeten Mars. Er hat einen Durchmesser von etwa 27 Kilometern und ist unregelmäßig geformt.', false, 27, 1);
INSERT INTO public.moon VALUES (45, 'Kallisto', 'Ein Mond des Planeten Jupiter. Er hat einen Durchmesser von etwa 4.820 Kilometern und ist der zweitgrößte Mond des Jupiters.', true, 4820, 1);
INSERT INTO public.moon VALUES (46, 'Io', 'Ein Mond des Planeten Jupiter. Er hat einen Durchmesser von etwa 3.642 Kilometern und ist bekannt für seine vulkanische Aktivität.', true, 3642, 1);
INSERT INTO public.moon VALUES (47, 'Europa', 'Ein Mond des Planeten Jupiter. Er hat einen Durchmesser von etwa 3.122 Kilometern und ist für seine mögliche Unterwasserwelt bekannt.', true, 3122, 1);
INSERT INTO public.moon VALUES (48, 'Enceladus', 'Ein Mond des Planeten Saturn. Er hat einen Durchmesser von etwa 504 Kilometern und ist für seine eisigen Fontänen bekannt.', true, 504, 1);
INSERT INTO public.moon VALUES (49, 'Triton', 'Ein Mond des Planeten Neptun. Er hat einen Durchmesser von etwa 2.706 Kilometern und ist der größte Mond im Neptunsystem.', true, 2706, 1);
INSERT INTO public.moon VALUES (50, 'Charon', 'Ein Mond des Zwergplaneten Pluto. Er hat einen Durchmesser von etwa 1.212 Kilometern und ist fast halb so groß wie Pluto selbst.', true, 1212, 1);
INSERT INTO public.moon VALUES (51, 'Luna', 'Der Mond der Erde. Er hat einen Durchmesser von etwa 3.474 Kilometern und ist der einzige natürliche Satellit der Erde.', true, 3474, 1);
INSERT INTO public.moon VALUES (52, 'Phoebe', 'Ein Mond des Planeten Saturn. Er hat einen Durchmesser von etwa 220 Kilometern und ist für seine retrograde Umlaufbahn bekannt.', true, 220, 1);
INSERT INTO public.moon VALUES (53, 'Rhea', 'Ein Mond des Planeten Saturn. Er hat einen Durchmesser von etwa 1.528 Kilometern und ist der zweitgrößte Mond des Saturns.', true, 1528, 1);
INSERT INTO public.moon VALUES (54, 'Iapetus', 'Ein Mond des Planeten Saturn. Er hat einen Durchmesser von etwa 1.470 Kilometern und ist für seine ungewöhnliche zweifarbige Oberfläche bekannt.', true, 1470, 1);
INSERT INTO public.moon VALUES (55, 'Miranda', 'Ein Mond des Planeten Uranus. Er hat einen Durchmesser von etwa 471 Kilometern und ist für seine zerklüftete Oberfläche bekannt.', true, 471, 1);
INSERT INTO public.moon VALUES (56, 'Ariel', 'Ein Mond des Planeten Uranus. Er hat einen Durchmesser von etwa 1.157 Kilometern und ist der viertgrößte Mond des Uranus.', true, 1157, 1);
INSERT INTO public.moon VALUES (57, 'Umbriel', 'Ein Mond des Planeten Uranus. Er hat einen Durchmesser von etwa 1.169 Kilometern und ist der drittgrößte Mond des Uranus.', true, 1169, 1);
INSERT INTO public.moon VALUES (58, 'Titania', 'Ein Mond des Planeten Uranus. Er hat einen Durchmesser von etwa 1.578 Kilometern und ist der größte Mond des Uranus.', true, 1578, 1);
INSERT INTO public.moon VALUES (59, 'Oberon', 'Ein Mond des Planeten Uranus. Er hat einen Durchmesser von etwa 1.523 Kilometern und ist der zweitgrößte Mond des Uranus.', true, 1523, 1);
INSERT INTO public.moon VALUES (60, 'Pups', NULL, NULL, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Erde', true, false, 'Die Erde ist der dritte Planet im Sonnensystem und der einzige bekannte Planet, auf dem Leben existiert.', 4500, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, false, 'Der Mars ist der vierte Planet im Sonnensystem und wird oft als der erdähnlichste Planet betrachtet.', 4500, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, false, 'Die Venus ist der zweite Planet im Sonnensystem und bekannt für ihre extreme Hitze und dichte Atmosphäre.', 4500, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, false, 'Jupiter ist der größte Planet im Sonnensystem und bekannt für seinen Großen Roten Fleck.', 4500, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, false, 'Saturn ist der sechste Planet im Sonnensystem und bekannt für seine auffälligen Ringe.', 4500, 1);
INSERT INTO public.planet VALUES (6, 'Neptun', false, false, 'Neptun ist der achte und äußerste bekannte Planet im Sonnensystem.', 4500, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, false, 'Uranus ist der siebte Planet im Sonnensystem und bekannt für seine seitliche Rotation.', 4500, 1);
INSERT INTO public.planet VALUES (8, 'Merkur', false, false, 'Merkur ist der innerste Planet im Sonnensystem und der kleinste Planet.', 4500, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, false, 'Pluto war früher als der neunte Planet im Sonnensystem anerkannt, wurde jedoch später als Zwergplanet klassifiziert.', 4500, 1);
INSERT INTO public.planet VALUES (10, 'Mond', false, false, 'Der Mond ist der einzige natürliche Satellit der Erde.', 4500, 1);
INSERT INTO public.planet VALUES (11, 'Phobos', false, false, 'Phobos ist der größere der beiden Monde des Planeten Mars.', 4500, 1);
INSERT INTO public.planet VALUES (12, 'Titan', false, false, 'Titan ist der größte Mond des Planeten Saturn und der zweitgrößte Mond im Sonnensystem.', 4500, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sonne', 'Unser Heimatstern', 4600, 149600000, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Der hellste Stern am Nachthimmel', 250, 9, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Das nächstgelegene Sternsystem zur Erde', 6000, 4, 3);
INSERT INTO public.star VALUES (4, 'Vega', 'Ein blauer Hauptreihenstern im Sternbild Leier', 455, 25, 4);
INSERT INTO public.star VALUES (5, 'Arktur', 'Ein orangefarbener Riesenstern im Sternbild Bootes', 1700, 37, 5);
INSERT INTO public.star VALUES (6, 'Rigel', 'Ein blauer Überriese im Orionnebel', 10, 860, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: hurz_hurz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.hurz_hurz_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: hurz hurz_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hurz
    ADD CONSTRAINT hurz_name_key UNIQUE (name);


--
-- Name: hurz hurz_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.hurz
    ADD CONSTRAINT hurz_pkey PRIMARY KEY (hurz_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

