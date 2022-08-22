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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer,
    num_guess integer
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 7);
INSERT INTO public.games VALUES (2, 2, 10);
INSERT INTO public.games VALUES (3, 3, 9);
INSERT INTO public.games VALUES (4, 4, 929);
INSERT INTO public.games VALUES (5, 4, 500);
INSERT INTO public.games VALUES (6, 5, 188);
INSERT INTO public.games VALUES (7, 5, 195);
INSERT INTO public.games VALUES (8, 4, 698);
INSERT INTO public.games VALUES (9, 4, 441);
INSERT INTO public.games VALUES (10, 4, 191);
INSERT INTO public.games VALUES (11, 6, 147);
INSERT INTO public.games VALUES (12, 6, 730);
INSERT INTO public.games VALUES (13, 7, 604);
INSERT INTO public.games VALUES (14, 7, 811);
INSERT INTO public.games VALUES (15, 6, 82);
INSERT INTO public.games VALUES (16, 6, 360);
INSERT INTO public.games VALUES (17, 6, 987);
INSERT INTO public.games VALUES (18, 8, 799);
INSERT INTO public.games VALUES (19, 8, 927);
INSERT INTO public.games VALUES (20, 9, 145);
INSERT INTO public.games VALUES (21, 9, 573);
INSERT INTO public.games VALUES (22, 8, 934);
INSERT INTO public.games VALUES (23, 8, 62);
INSERT INTO public.games VALUES (24, 8, 420);
INSERT INTO public.games VALUES (25, 10, 330);
INSERT INTO public.games VALUES (26, 10, 99);
INSERT INTO public.games VALUES (27, 11, 723);
INSERT INTO public.games VALUES (28, 11, 332);
INSERT INTO public.games VALUES (29, 10, 800);
INSERT INTO public.games VALUES (30, 10, 374);
INSERT INTO public.games VALUES (31, 10, 743);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'John');
INSERT INTO public.users VALUES (2, 'Jane');
INSERT INTO public.users VALUES (3, 'Fio');
INSERT INTO public.users VALUES (4, 'user_1661194795308');
INSERT INTO public.users VALUES (5, 'user_1661194795307');
INSERT INTO public.users VALUES (6, 'user_1661194886734');
INSERT INTO public.users VALUES (7, 'user_1661194886733');
INSERT INTO public.users VALUES (8, 'user_1661194956557');
INSERT INTO public.users VALUES (9, 'user_1661194956556');
INSERT INTO public.users VALUES (10, 'user_1661194979915');
INSERT INTO public.users VALUES (11, 'user_1661194979914');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 31, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

