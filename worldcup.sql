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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (42, 2018, 'Final', 105, 106, 4, 2);
INSERT INTO public.games VALUES (43, 2018, 'Third Place', 107, 108, 2, 0);
INSERT INTO public.games VALUES (44, 2018, 'Semi-Final', 106, 108, 2, 1);
INSERT INTO public.games VALUES (45, 2018, 'Semi-Final', 105, 107, 1, 0);
INSERT INTO public.games VALUES (46, 2018, 'Quarter-Final', 106, 109, 3, 2);
INSERT INTO public.games VALUES (47, 2018, 'Quarter-Final', 108, 110, 2, 0);
INSERT INTO public.games VALUES (48, 2018, 'Quarter-Final', 107, 111, 2, 1);
INSERT INTO public.games VALUES (49, 2018, 'Quarter-Final', 105, 112, 2, 0);
INSERT INTO public.games VALUES (50, 2018, 'Eighth-Final', 108, 113, 2, 1);
INSERT INTO public.games VALUES (51, 2018, 'Eighth-Final', 110, 114, 1, 0);
INSERT INTO public.games VALUES (52, 2018, 'Eighth-Final', 107, 115, 3, 2);
INSERT INTO public.games VALUES (53, 2018, 'Eighth-Final', 111, 116, 2, 0);
INSERT INTO public.games VALUES (54, 2018, 'Eighth-Final', 106, 117, 2, 1);
INSERT INTO public.games VALUES (55, 2018, 'Eighth-Final', 109, 118, 2, 1);
INSERT INTO public.games VALUES (56, 2018, 'Eighth-Final', 112, 119, 2, 1);
INSERT INTO public.games VALUES (57, 2018, 'Eighth-Final', 105, 120, 4, 3);
INSERT INTO public.games VALUES (58, 2014, 'Final', 121, 120, 1, 0);
INSERT INTO public.games VALUES (59, 2014, 'Third Place', 122, 111, 3, 0);
INSERT INTO public.games VALUES (60, 2014, 'Semi-Final', 120, 122, 1, 0);
INSERT INTO public.games VALUES (61, 2014, 'Semi-Final', 121, 111, 7, 1);
INSERT INTO public.games VALUES (62, 2014, 'Quarter-Final', 122, 123, 1, 0);
INSERT INTO public.games VALUES (63, 2014, 'Quarter-Final', 120, 107, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Quarter-Final', 111, 113, 2, 1);
INSERT INTO public.games VALUES (65, 2014, 'Quarter-Final', 121, 105, 1, 0);
INSERT INTO public.games VALUES (66, 2014, 'Eighth-Final', 111, 124, 2, 1);
INSERT INTO public.games VALUES (67, 2014, 'Eighth-Final', 113, 112, 2, 0);
INSERT INTO public.games VALUES (68, 2014, 'Eighth-Final', 105, 125, 2, 0);
INSERT INTO public.games VALUES (69, 2014, 'Eighth-Final', 121, 126, 2, 1);
INSERT INTO public.games VALUES (70, 2014, 'Eighth-Final', 122, 116, 2, 1);
INSERT INTO public.games VALUES (71, 2014, 'Eighth-Final', 123, 127, 2, 1);
INSERT INTO public.games VALUES (72, 2014, 'Eighth-Final', 120, 114, 1, 0);
INSERT INTO public.games VALUES (73, 2014, 'Eighth-Final', 107, 128, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (105, 'France');
INSERT INTO public.teams VALUES (106, 'Croatia');
INSERT INTO public.teams VALUES (107, 'Belgium');
INSERT INTO public.teams VALUES (108, 'England');
INSERT INTO public.teams VALUES (109, 'Russia');
INSERT INTO public.teams VALUES (110, 'Sweden');
INSERT INTO public.teams VALUES (111, 'Brazil');
INSERT INTO public.teams VALUES (112, 'Uruguay');
INSERT INTO public.teams VALUES (113, 'Colombia');
INSERT INTO public.teams VALUES (114, 'Switzerland');
INSERT INTO public.teams VALUES (115, 'Japan');
INSERT INTO public.teams VALUES (116, 'Mexico');
INSERT INTO public.teams VALUES (117, 'Denmark');
INSERT INTO public.teams VALUES (118, 'Spain');
INSERT INTO public.teams VALUES (119, 'Portugal');
INSERT INTO public.teams VALUES (120, 'Argentina');
INSERT INTO public.teams VALUES (121, 'Germany');
INSERT INTO public.teams VALUES (122, 'Netherlands');
INSERT INTO public.teams VALUES (123, 'Costa Rica');
INSERT INTO public.teams VALUES (124, 'Chile');
INSERT INTO public.teams VALUES (125, 'Nigeria');
INSERT INTO public.teams VALUES (126, 'Algeria');
INSERT INTO public.teams VALUES (127, 'Greece');
INSERT INTO public.teams VALUES (128, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 73, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 128, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

