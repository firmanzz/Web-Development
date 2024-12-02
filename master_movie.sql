--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: enum_Users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Users_role" AS ENUM (
    'admin',
    'user'
);


ALTER TYPE public."enum_Users_role" OWNER TO postgres;

--
-- Name: enum_comments_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_comments_status AS ENUM (
    'Approved',
    'Unapproved'
);


ALTER TYPE public.enum_comments_status OWNER TO postgres;

--
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'admin',
    'editor'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'user'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "verificationCode" character varying(255),
    "isVerified" boolean DEFAULT false
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    birthdate timestamp with time zone,
    urlphoto character varying(255),
    countryid integer NOT NULL
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actors_id_seq OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_id_seq OWNED BY public.actors.id;


--
-- Name: availabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.availabilities (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.availabilities OWNER TO postgres;

--
-- Name: availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.availabilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.availabilities_id_seq OWNER TO postgres;

--
-- Name: availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.availabilities_id_seq OWNED BY public.availabilities.id;


--
-- Name: awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.awards (
    id integer NOT NULL,
    award character varying(255) NOT NULL,
    year integer,
    countryid integer NOT NULL
);


ALTER TABLE public.awards OWNER TO postgres;

--
-- Name: awards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.awards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.awards_id_seq OWNER TO postgres;

--
-- Name: awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.awards_id_seq OWNED BY public.awards.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    rate double precision,
    comment character varying(1000),
    movieid integer NOT NULL,
    userid integer NOT NULL,
    status public.enum_comments_status DEFAULT 'Unapproved'::public.enum_comments_status,
    "time" timestamp with time zone
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    birthdate timestamp with time zone,
    urlphoto character varying(255),
    countryid integer NOT NULL
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directors_id_seq OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_id_seq OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: movie_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_actor (
    id integer NOT NULL,
    movieid integer,
    actorid integer
);


ALTER TABLE public.movie_actor OWNER TO postgres;

--
-- Name: movie_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_actor_id_seq OWNER TO postgres;

--
-- Name: movie_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_actor_id_seq OWNED BY public.movie_actor.id;


--
-- Name: movie_availabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_availabilities (
    id integer NOT NULL,
    movieid integer,
    availid integer
);


ALTER TABLE public.movie_availabilities OWNER TO postgres;

--
-- Name: movie_availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_availabilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_availabilities_id_seq OWNER TO postgres;

--
-- Name: movie_availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_availabilities_id_seq OWNED BY public.movie_availabilities.id;


--
-- Name: movie_award; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_award (
    id integer NOT NULL,
    movieid integer,
    awardid integer
);


ALTER TABLE public.movie_award OWNER TO postgres;

--
-- Name: movie_award_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_award_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_award_id_seq OWNER TO postgres;

--
-- Name: movie_award_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_award_id_seq OWNED BY public.movie_award.id;


--
-- Name: movie_director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_director (
    id integer NOT NULL,
    movieid integer,
    directorid integer
);


ALTER TABLE public.movie_director OWNER TO postgres;

--
-- Name: movie_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_director_id_seq OWNER TO postgres;

--
-- Name: movie_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_director_id_seq OWNED BY public.movie_director.id;


--
-- Name: movie_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_genre (
    id integer NOT NULL,
    movieid integer,
    genreid integer
);


ALTER TABLE public.movie_genre OWNER TO postgres;

--
-- Name: movie_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_genre_id_seq OWNER TO postgres;

--
-- Name: movie_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_genre_id_seq OWNED BY public.movie_genre.id;


--
-- Name: movie_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_user (
    id integer NOT NULL,
    movieid integer,
    userid integer
);


ALTER TABLE public.movie_user OWNER TO postgres;

--
-- Name: movie_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_user_id_seq OWNER TO postgres;

--
-- Name: movie_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_user_id_seq OWNED BY public.movie_user.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    alternativetitle character varying(100),
    synopsis text,
    urlphoto character varying(255),
    releasedate timestamp with time zone,
    linktrailer character varying(255),
    rating double precision,
    duration double precision,
    status character varying(25),
    approvalstatus boolean DEFAULT false,
    countryid integer NOT NULL
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movies_id_seq OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255),
    role public.enum_users_role DEFAULT 'editor'::public.enum_users_role NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "verificationCode" character varying(255),
    "isVerified" boolean DEFAULT false NOT NULL,
    "googleId" character varying(255),
    suspend boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: actors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN id SET DEFAULT nextval('public.actors_id_seq'::regclass);


--
-- Name: availabilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availabilities ALTER COLUMN id SET DEFAULT nextval('public.availabilities_id_seq'::regclass);


--
-- Name: awards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards ALTER COLUMN id SET DEFAULT nextval('public.awards_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: movie_actor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor ALTER COLUMN id SET DEFAULT nextval('public.movie_actor_id_seq'::regclass);


--
-- Name: movie_availabilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities ALTER COLUMN id SET DEFAULT nextval('public.movie_availabilities_id_seq'::regclass);


--
-- Name: movie_award id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award ALTER COLUMN id SET DEFAULT nextval('public.movie_award_id_seq'::regclass);


--
-- Name: movie_director id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director ALTER COLUMN id SET DEFAULT nextval('public.movie_director_id_seq'::regclass);


--
-- Name: movie_genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre ALTER COLUMN id SET DEFAULT nextval('public.movie_genre_id_seq'::regclass);


--
-- Name: movie_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_user ALTER COLUMN id SET DEFAULT nextval('public.movie_user_id_seq'::regclass);


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, name, email, password, role, "createdAt", "updatedAt", "verificationCode", "isVerified") FROM stdin;
1	cobain2	cobain2@gmail.com	$2a$10$Zo4/0h.em6ZzUXevNWEZdecJI83exRWsbKfZoRVqnHUCyjptLLTqS	editor	2024-10-14 01:25:22.499+07	2024-10-14 01:25:22.499+07	\N	f
\.


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (id, name, birthdate, urlphoto, countryid) FROM stdin;
1	Johnny Depp	1963-06-09 00:00:00+07	https://m.media-amazon.com/images/M/MV5BZjA3NzZiZDktZjc2My00MzY2LThhOWMtZGFjYzg4ZDI2ZWVmXkEyXkFqcGc@._V1_.jpg	1
2	Orlando Bloom	1977-01-13 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjE1MDkxMjQ3NV5BMl5BanBnXkFtZTcwMzQ3Mjc4MQ@@._V1_FMjpg_UX1000_.jpg	2
3	Keira Knightley	1985-03-26 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTYwNDM0NDA3M15BMl5BanBnXkFtZTcwNTkzMjQ3OA@@._V1_FMjpg_UX1000_.jpg	2
4	Ryan Gosling	1980-11-12 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQzMjkwNTQ2OF5BMl5BanBnXkFtZTgwNTQ4MTQ4MTE@._V1_FMjpg_UX1000_.jpg	3
5	Margot Robbie	1990-07-02 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTgxNDcwMzU2Nl5BMl5BanBnXkFtZTcwNDc4NzkzOQ@@._V1_FMjpg_UX1000_.jpg	4
7	Rachel McAdams	1978-11-17 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTY5ODcxMDU4NV5BMl5BanBnXkFtZTcwMjAzNjQyNQ@@._V1_FMjpg_UX1000_.jpg	3
8	Harrison Ford	1942-07-13 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTY4Mjg0NjIxOV5BMl5BanBnXkFtZTcwMTM2NTI3MQ@@._V1_FMjpg_UX1000_.jpg	1
9	Emma Stone	1988-11-06 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjI4NjM1NDkyN15BMl5BanBnXkFtZTgwODgyNTY1MjE@._V1_FMjpg_UX1000_.jpg	1
11	Steve Carell	1962-08-16 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjMyOTM2OTk1Ml5BMl5BanBnXkFtZTgwMTI3MzkyNjM@._V1_FMjpg_UX1000_.jpg	1
12	Tom Hanks	1956-07-09 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQ2MjMwNDA3Nl5BMl5BanBnXkFtZTcwMTA2NDY3NQ@@._V1_.jpg	1
13	Tim Allen	1953-06-13 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTI5ODY0NTAwOF5BMl5BanBnXkFtZTcwOTI3NjQxMw@@._V1_FMjpg_UX1000_.jpg	1
14	Edward Asner	1929-11-15 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTk0MDI4ODk5NF5BMl5BanBnXkFtZTcwMzg3ODQ3MQ@@._V1_FMjpg_UX1000_.jpg	1
15	Leonardo DiCaprio	1974-11-11 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjI0MTg3MzI0M15BMl5BanBnXkFtZTcwMzQyODU2Mw@@._V1_.jpg	1
16	Christian Bale	1974-01-30 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg	2
17	Heath Ledger	1979-04-04 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTI2NTY0NzA4MF5BMl5BanBnXkFtZTYwMjE1MDE0._V1_FMjpg_UX1000_.jpg	4
18	Anne Hathaway	1982-11-12 00:00:00+07	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLoG1gBPLv_0Y5cR69tnKAGD4YjA2l4hv6AA&s	1
19	Matthew McConaughey	1969-11-04 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTg0MDc3ODUwOV5BMl5BanBnXkFtZTcwMTk2NjY4Nw@@._V1_FMjpg_UX1000_.jpg	1
20	Tom Hardy	1977-09-15 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQ3ODEyNjA4Nl5BMl5BanBnXkFtZTgwMTE4ODMyMjE@._V1_.jpg	2
21	Joseph Gordon-Levitt	1981-02-17 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTY3NTk0NDI3Ml5BMl5BanBnXkFtZTgwNDA3NjY0MjE@._V1_.jpg	1
22	Michael Caine	1933-03-14 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjAwNzIwNTQ4Ml5BMl5BanBnXkFtZTYwMzE1MTUz._V1_FMjpg_UX1000_.jpg	2
23	Morgan Freeman	1937-06-01 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTc0MDMyMzI2OF5BMl5BanBnXkFtZTcwMzM2OTk1MQ@@._V1_FMjpg_UX1000_.jpg	1
24	Brad Pitt	1963-12-18 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjA1MjE2MTQ2MV5BMl5BanBnXkFtZTcwMjE5MDY0Nw@@._V1_FMjpg_UX1000_.jpg	1
25	Edward Norton	1969-08-18 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTYwNjQ5MTI1NF5BMl5BanBnXkFtZTcwMzU5MTI2Mw@@._V1_FMjpg_UX1000_.jpg	1
26	Russell Crowe	1964-04-07 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQyMTExNTMxOF5BMl5BanBnXkFtZTcwNDg1NzkzNw@@._V1_.jpg	4
27	Joaquin Phoenix	1974-10-28 00:00:00+07	https://m.media-amazon.com/images/M/MV5BYjFjNGYzYjEtNGE0Ny00M2IyLTk5ZmYtODE3ZGFkMzVjYmNmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg	1
29	Marlon Brando	1924-04-03 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTg3MDYyMDE5OF5BMl5BanBnXkFtZTcwNjgyNTEzNA@@._V1_FMjpg_UX1000_.jpg	1
30	Robert De Niro	1943-08-17 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjAwNDU3MzcyOV5BMl5BanBnXkFtZTcwMjc0MTIxMw@@._V1_FMjpg_UX1000_.jpg	1
31	Joe Pesci	1943-02-09 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMzc3MTcxNDYxNV5BMl5BanBnXkFtZTcwOTI3NjE1Mw@@._V1_.jpg	1
32	Christopher Walken	1943-03-31 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjA4ODUyNDQ2NV5BMl5BanBnXkFtZTYwODk2MTYz._V1_.jpg	1
33	Uma Thurman	1970-04-29 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjMxNzk1MTQyMl5BMl5BanBnXkFtZTgwMDIzMDEyMTE@._V1_.jpg	1
34	Samuel L. Jackson	1948-12-21 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQ1NTQwMTYxNl5BMl5BanBnXkFtZTYwMjA1MzY1._V1_FMjpg_UX1000_.jpg	1
35	John Travolta	1954-02-18 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNWUyNDZiMjItMjQzMy00YmQyLTliOTYtOGRkYzNhZTk5NDBiXkEyXkFqcGc@._V1_.jpg	1
36	Robin Wright	1966-04-08 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTU0NTc4MzEyOV5BMl5BanBnXkFtZTcwODY0ODkzMQ@@._V1_FMjpg_UX1000_.jpg	1
37	Sally Field	1946-11-06 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQwOTMyMDI4MV5BMl5BanBnXkFtZTcwMDYzMTM5OA@@._V1_FMjpg_UX1000_.jpg	1
38	Sean Astin	1971-02-25 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjEzMjczOTQ1NF5BMl5BanBnXkFtZTcwMzI2NzYyMQ@@._V1_FMjpg_UX1000_.jpg	1
39	Elijah Wood	1981-01-28 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTM0NDIxMzQ5OF5BMl5BanBnXkFtZTcwNzAyNTA4Nw@@._V1_FMjpg_UX1000_.jpg	1
40	Viggo Mortensen	1958-10-20 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNDQzOTg4NzA2Nl5BMl5BanBnXkFtZTcwMzkwNjkxMg@@._V1_FMjpg_UX1000_.jpg	1
41	Ian McKellen	1939-05-25 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQ2MjgyNjk3MV5BMl5BanBnXkFtZTcwNTA3NTY5Mg@@._V1_FMjpg_UX1000_.jpg	2
42	Liv Tyler	1977-07-01 00:00:00+07	https://m.media-amazon.com/images/M/MV5BZmU1YzllYzQtYTM5Zi00ODRkLWE0NzItM2UzNTM2YmY4ZjY0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg	1
43	Liam Neeson	1952-06-07 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjA1MTQ3NzU1MV5BMl5BanBnXkFtZTgwMDE3Mjg0MzE@._V1_.jpg	2
44	Ben Kingsley	1943-12-31 00:00:00+07	https://m.media-amazon.com/images/M/MV5BOTU2Njg2NzM4M15BMl5BanBnXkFtZTgwNjYwNjQwMTI@._V1_.jpg	2
45	Ralph Fiennes	1962-12-22 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMzc5MjE1NDgyN15BMl5BanBnXkFtZTcwNzg2ODgwNA@@._V1_FMjpg_UX1000_.jpg	2
46	Keanu Reeves	1964-09-02 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNDEzOTdhNDUtY2EyMy00YTNmLWE5MjItZmRjMmQzYTRlMGRkXkEyXkFqcGc@._V1_.jpg	1
47	Cillian Murphy	1976-05-25 00:00:00+07	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyUB0NhvWx6tnPahAEZZSiiB53AJimydLueA&s	2
48	Emma Watson	1990-04-15 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQ3ODE2NTMxMV5BMl5BanBnXkFtZTgwOTIzOTQzMjE@._V1_FMjpg_UX1000_.jpg	1
49	Mel Gibson	1956-01-03 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNTUzOTMwNTM0OV5BMl5BanBnXkFtZTcwNDQwMTUxMw@@._V1_FMjpg_UX1000_.jpg	1
50	Will Smith	1968-09-25 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNTczMzk1MjU1MV5BMl5BanBnXkFtZTcwNDk2MzAyMg@@._V1_FMjpg_UX1000_.jpg	1
51	Ben Affleck	1972-08-15 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNTFjZDU5NmYtYzZlMy00YThmLTg5ZjUtYjkyZWI2OTk2Mjc1XkEyXkFqcGc@._V1_.jpg	1
52	Jim Carrey	1962-01-17 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQwMjAwNzI0M15BMl5BanBnXkFtZTcwOTY1MTMyOQ@@._V1_.jpg	1
53	Emma Stone	1988-11-06 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjI4NjM1NDkyN15BMl5BanBnXkFtZTgwODgyNTY1MjE@._V1_FMjpg_UX1000_.jpg	1
28	Al Pacino	1940-04-24 07:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQzMzg1ODAyNl5BMl5BanBnXkFtZTYwMjAxODQ1._V1_.jpg	1
56	windah	2024-10-29 07:00:00+07	https://upload.wikimedia.org/wikipedia/id/3/3c/Windah_Basudara_Personal.jpg	1
\.


--
-- Data for Name: availabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.availabilities (id, name) FROM stdin;
1	HBO Max
2	Amazon Prime Video
3	FuboTV
4	Vidio
5	Google Play Film
6	Apple TV
7	Disney+ Hotstar
\.


--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.awards (id, award, year, countryid) FROM stdin;
1	Academy Award for Best Picture	2023	1
2	BAFTA Award for Best Film	2023	2
3	Golden Globe Award for Best Motion Picture	2023	1
4	Academy Award for Best Director	2023	1
5	Cannes Palme d'Or	2023	5
6	Venice Golden Lion	2023	10
7	Toronto International Film Festival People's Choice Award	2023	3
8	Berlin Golden Bear	2023	6
9	Oscar for Best International Feature Film	2023	7
10	BAFTA Award for Best Actor	2022	2
11	Academy Award for Best Actor	2022	1
12	Academy Award for Best Cinematography	2022	1
13	BAFTA Award for Best Cinematography	2022	2
14	Academy Award for Best Original Score	2022	1
15	Golden Globe Award for Best Director	2022	1
16	Oscar for Best Animated Feature Film	2022	1
17	Berlin Silver Bear	2023	6
18	Oscar for Best Supporting Actor	2022	1
19	Cannes Jury Prize	2023	5
20	Tokyo International Film Festival Grand Prix	2023	8
21	Academy Award for Best Visual Effects	2022	1
22	Academy Award for Best Picture	2024	1
23	BAFTA Award for Best Film	2024	2
24	Golden Globe Award for Best Picture	2024	1
25	Berlin Golden Bear	2024	6
26	Cannes Palme d'Or	2024	5
27	Venice Golden Lion	2024	10
28	Oscar for Best International Feature Film	2024	7
29	Academy Award for Best Actor	2024	1
30	BAFTA Award for Best Actor	2024	2
31	Academy Award for Best Director	2024	1
32	Academy Award for Best Cinematography	2018	1
33	Academy Award for Best Visual Effects	2018	1
34	Academy Award for Best Original Score	2017	1
35	BAFTA Award for Best Cinematography	2018	2
36	Golden Globe Award for Best Director	2017	1
37	Academy Award for Best Picture	1973	1
38	Academy Award for Best Director	1973	1
39	Academy Award for Best Actor	1995	1
40	Academy Award for Best Supporting Actor	2009	1
41	Cannes Palme d'Or	1994	5
42	Golden Globe Award for Best Motion Picture	2017	1
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, rate, comment, movieid, userid, status, "time") FROM stdin;
3	1.3	testse	15	22	Unapproved	2024-11-02 20:11:04.879+07
4	1.1	hehee	15	16	Approved	2024-11-02 20:12:48.852+07
2	9.6	test bagus g	15	22	Unapproved	2024-11-02 20:10:45.14+07
1	9	bagus	15	22	Unapproved	2024-11-02 20:10:01.742+07
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name) FROM stdin;
1	United States
2	United Kingdom
4	Australia
5	France
6	Germany
7	India
8	Japan
9	South Korea
10	Italy
3	Canada
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (id, name, birthdate, urlphoto, countryid) FROM stdin;
1	Denis Villeneuve	1967-10-03 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMzU2MDk5MDI2MF5BMl5BanBnXkFtZTcwNDkwMjMzNA@@._V1_.jpg	1
2	Gore Verbinski	1964-03-16 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNTA4YTFhZTktMmRkMi00NDJlLThlZDMtYmZhYTc2YTE4OGQ5XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg	1
3	Nicolas Winding Refn	1970-09-29 00:00:00+07	https://m.media-amazon.com/images/M/MV5BOTI3NzAzMTAwMl5BMl5BanBnXkFtZTcwNzM5MjQxNw@@._V1_.jpg	5
4	Greta Gerwig	1983-08-04 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNDE5MTIxMTMzMV5BMl5BanBnXkFtZTcwMjMxMDYxOQ@@._V1_.jpg	1
5	Nick Cassavetes	1959-05-21 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTcxNjA2MjI3Nl5BMl5BanBnXkFtZTYwMjkyNjMz._V1_.jpg	1
6	Damien Chazelle	1985-01-19 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjE2MzcyODA3MV5BMl5BanBnXkFtZTgwNTA3NTU2MjE@._V1_.jpg	1
7	Joachim R├╕nning	1972-05-30 00:00:00+07	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9w1s09AgRQ5Ws9Yl-e7GpwtIZ-flX2kFh9Q&s	1
8	Pierre Coffin	1967-11-01 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTUzOTQ3OTA3OF5BMl5BanBnXkFtZTcwNzEzNTMyOA@@._V1_.jpg	5
9	John Lasseter	1957-01-12 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTQ5NTczNjE5MV5BMl5BanBnXkFtZTcwMTA1MTQ3Mg@@._V1_FMjpg_UX1000_.jpg	1
10	Lee Unkrich	1967-08-08 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjA1ODE2NTEzN15BMl5BanBnXkFtZTYwNzUzODY2._V1_.jpg	1
11	Josh Cooley	1975-05-03 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTcwMjI1OTcyNF5BMl5BanBnXkFtZTgwODM3MzY1NjE@._V1_.jpg	1
12	Pete Docter	1968-10-09 00:00:00+07	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvFkY0HQBVavx7ajhw1oGRPbojd6fzJxURGw&s	1
13	Christopher Nolan	1970-07-30 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNjE3NDQyOTYyMV5BMl5BanBnXkFtZTcwODcyODU2Mw@@._V1_FMjpg_UX1000_.jpg	2
14	Frank Darabont	1959-01-28 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNjk0MTkxNzQwOF5BMl5BanBnXkFtZTcwODM5OTMwNA@@._V1_.jpg	1
15	Francis Ford Coppola	1939-04-07 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTM5NDU3OTgyNV5BMl5BanBnXkFtZTcwMzQxODA0NA@@._V1_.jpg	1
16	Steven Spielberg	1946-12-18 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTY1NjAzNzE1MV5BMl5BanBnXkFtZTYwNTk0ODc0._V1_.jpg	1
17	Sidney Lumet	1924-06-25 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTY4Mzk5Mzk4Ml5BMl5BanBnXkFtZTYwMTE2NDg0._V1_.jpg	1
18	Peter Jackson	1961-10-31 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNTk2MzA0ZDAtMTI0Yy00NzU2LTgyYmUtMDRlOGFmYjM3NzJhXkEyXkFqcGc@._V1_.jpg	4
19	Quentin Tarantino	1963-03-27 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTgyMjI3ODA3Nl5BMl5BanBnXkFtZTcwNzY2MDYxOQ@@._V1_.jpg	1
20	David Fincher	1962-08-28 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTc1NDkwMTQ2MF5BMl5BanBnXkFtZTcwMzY0ODkyMg@@._V1_.jpg	1
21	Robert Zemeckis	1951-05-14 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTgyMTMzMDUyNl5BMl5BanBnXkFtZTcwODA0ODMyMw@@._V1_.jpg	1
22	Martin Scorsese	1942-11-17 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTcyNDA4Nzk3N15BMl5BanBnXkFtZTcwNDYzMjMxMw@@._V1_.jpg	1
23	Lana Wachowski	1965-06-21 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMjEzMTc2MDQ5OV5BMl5BanBnXkFtZTcwNjkzNDY0OA@@._V1_.jpg	1
24	Lilly Wachowski	1967-12-29 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTU1Mjc1MjkzNV5BMl5BanBnXkFtZTgwOTc1NDQ1ODE@._V1_.jpg	1
25	Ridley Scott	1937-11-30 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNDM1OWUyZDktZGJmYS00MjQxLWI1OTItY2M4MWViM2NmOWM0XkEyXkFqcGc@._V1_.jpg	2
26	Alejandro Gonz├ílez I├▒├írritu	1963-08-15 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTcwNDMyOTMzMl5BMl5BanBnXkFtZTcwODQ0OTE0Ng@@._V1_FMjpg_UX1000_.jpg	1
27	Ron Howard	1954-03-01 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTkzMDczMjUxNF5BMl5BanBnXkFtZTcwODY1Njk5Mg@@._V1_.jpg	1
28	Adam McKay	1968-04-17 00:00:00+07	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIeYSqZ7FQwSQglVYSRzwRwWOOjh2e-XQz9A&s	1
29	Tom Hooper	1972-10-05 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTMyOTQ5MTE5OV5BMl5BanBnXkFtZTcwNjMxNjA0NA@@._V1_.jpg	2
30	Darren Aronofsky	1969-02-12 00:00:00+07	https://m.media-amazon.com/images/M/MV5BMTI1NTQ0NjU3MF5BMl5BanBnXkFtZTcwOTQ0MTUyMg@@._V1_.jpg	1
31	Mel Gibson	1956-01-03 00:00:00+07	https://m.media-amazon.com/images/M/MV5BNTUzOTMwNTM0OV5BMl5BanBnXkFtZTcwNDQwMTUxMw@@._V1_FMjpg_UX1000_.jpg	1
33	fufufafadasd	2024-09-11 07:00:00+07	https://upload.wikimedia.org/wikipedia/id/3/3c/Windah_Basudara_Personal.jpg	5
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id, name) FROM stdin;
1	Action
2	Adventure
3	Animation
4	Biography
5	Comedy
6	Crime
7	Documentary
8	Drama
9	Family
10	Fantasy
11	History
12	Horror
13	Music
14	Musical
15	Mystery
16	Romance
17	Sci-Fi
18	Sport
19	Thriller
20	War
21	Western
22	Film-Noir
23	Epic
24	Heist
25	Superhero
26	Apocalypse
\.


--
-- Data for Name: movie_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_actor (id, movieid, actorid) FROM stdin;
1	2	1
2	2	2
3	2	3
4	3	1
5	3	2
6	3	3
7	4	4
8	5	4
9	5	5
10	6	7
11	6	4
14	7	4
15	7	9
16	8	1
17	8	2
18	8	3
19	9	1
20	10	1
21	11	11
22	12	11
23	13	11
24	14	11
25	15	11
26	16	12
27	16	13
28	17	12
29	17	13
30	18	12
31	18	13
32	19	12
33	19	13
34	20	14
35	22	28
36	22	29
37	23	16
38	23	17
39	23	22
40	23	23
41	28	15
42	28	20
43	28	21
44	28	22
45	34	19
46	34	18
47	34	22
48	29	24
49	29	25
50	36	26
51	36	27
52	21	23
53	24	43
54	24	44
55	24	45
56	26	38
57	26	39
58	26	40
59	26	41
60	26	42
61	27	32
62	27	33
63	27	34
64	27	35
65	30	12
66	30	36
67	30	37
68	31	30
69	31	31
70	32	46
71	33	47
72	28	47
73	35	16
74	37	15
75	38	15
76	38	20
77	39	15
78	39	12
79	40	15
80	41	18
81	41	26
82	42	26
83	42	48
84	43	49
85	44	26
86	45	16
87	45	24
88	46	50
89	47	51
90	48	52
91	49	8
92	50	12
93	51	4
94	51	18
95	51	28
96	52	50
\.


--
-- Data for Name: movie_availabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_availabilities (id, movieid, availid) FROM stdin;
4	2	2
5	2	5
6	2	6
7	3	2
8	3	3
9	4	4
10	4	1
11	5	7
12	5	6
13	6	6
14	6	1
15	7	2
16	7	3
17	8	3
18	8	5
19	9	1
20	9	7
21	10	4
22	10	1
23	11	7
24	11	5
25	12	7
26	12	5
27	13	7
28	13	1
29	14	7
30	14	2
31	15	7
32	15	1
33	16	6
34	16	5
35	17	6
36	17	5
37	18	6
38	18	1
39	19	6
40	19	7
41	20	5
42	20	7
43	21	1
44	21	2
45	22	1
46	22	2
47	23	1
48	23	2
49	24	1
50	24	2
51	25	2
52	25	5
53	26	1
54	26	7
55	27	1
56	27	2
57	28	1
58	28	2
59	29	1
60	29	2
61	30	1
62	30	7
63	31	1
64	31	2
65	32	1
66	32	7
67	33	5
68	33	6
69	34	1
70	34	7
71	35	2
72	35	6
73	36	1
74	36	7
75	51	1
76	52	5
\.


--
-- Data for Name: movie_award; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_award (id, movieid, awardid) FROM stdin;
4	2	2
5	2	24
6	3	3
7	3	16
8	4	18
9	5	5
10	5	7
11	5	19
12	6	11
13	7	17
14	7	15
15	8	6
16	8	27
17	9	8
18	9	25
19	10	10
20	11	14
21	12	20
22	13	28
23	14	30
24	15	22
25	16	29
26	17	31
27	18	9
28	19	12
29	20	13
30	21	11
31	21	39
32	22	37
33	22	38
34	23	40
35	24	16
36	24	11
37	25	2
38	25	37
39	26	1
40	26	4
41	27	41
42	28	36
43	28	33
44	29	15
45	29	3
46	30	39
47	31	22
48	32	33
49	33	1
50	34	34
51	35	32
52	36	38
53	37	12
54	37	4
55	37	1
56	38	29
57	38	4
58	38	21
59	39	11
60	40	15
61	40	29
62	41	18
63	41	24
64	42	\N
65	43	1
66	43	4
67	44	1
68	44	4
69	45	32
70	46	39
71	47	\N
72	48	42
73	49	21
74	50	39
75	51	28
\.


--
-- Data for Name: movie_director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_director (id, movieid, directorid) FROM stdin;
2	2	2
3	3	2
4	4	3
5	5	4
6	6	5
7	7	6
8	8	7
9	9	7
10	10	7
11	11	8
12	12	8
13	13	8
14	14	8
15	15	9
16	16	10
17	17	10
18	18	8
19	19	11
20	20	12
21	21	14
22	22	15
23	23	13
24	24	16
25	25	17
26	26	18
27	27	19
28	28	13
29	29	20
30	30	21
31	31	22
32	32	23
33	32	24
34	33	13
35	34	13
36	35	13
37	36	25
38	37	22
39	38	26
40	39	16
41	40	22
42	41	29
43	42	30
44	43	31
45	44	27
46	45	28
47	46	27
48	47	20
49	48	21
50	49	16
51	50	21
52	51	26
53	52	13
\.


--
-- Data for Name: movie_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_genre (id, movieid, genreid) FROM stdin;
3	2	1
4	2	2
5	2	10
6	3	1
7	3	2
8	3	10
9	4	6
10	4	8
11	4	17
12	5	9
13	5	8
14	6	8
15	6	16
16	7	8
17	7	13
18	7	16
19	8	1
20	8	2
21	8	10
22	9	1
23	9	2
24	9	10
25	10	1
26	10	2
27	10	10
28	11	3
29	11	5
30	12	3
31	12	5
32	13	3
33	13	5
34	14	3
35	14	5
36	15	3
37	15	5
38	16	3
39	16	9
40	17	3
41	17	9
42	18	3
43	18	9
44	19	3
45	19	9
46	20	9
47	20	3
48	21	8
49	21	11
50	22	6
51	22	8
52	22	22
53	23	1
54	23	19
55	23	25
56	24	4
57	24	8
58	24	11
59	25	8
60	25	22
61	26	2
62	26	10
63	26	23
64	27	6
65	27	19
66	28	1
67	28	17
68	28	24
69	29	19
70	29	26
71	30	4
72	30	8
73	30	16
74	31	6
75	31	8
76	32	1
77	32	17
78	33	4
79	33	11
80	33	8
81	34	17
82	34	8
83	35	19
84	35	8
85	35	15
86	36	2
87	36	23
88	36	8
89	37	4
90	37	8
91	38	4
92	38	8
93	38	1
94	39	4
95	39	5
96	39	6
97	40	4
98	40	5
99	40	6
100	41	8
101	41	14
102	41	11
103	42	4
104	42	8
105	42	20
106	43	2
107	43	8
108	43	20
109	44	4
110	44	8
111	45	4
112	45	5
113	45	6
114	46	4
115	46	8
116	47	8
117	47	19
118	47	15
119	48	5
120	48	8
121	49	1
122	49	2
123	50	8
124	50	9
125	51	3
126	51	7
127	51	22
128	52	12
\.


--
-- Data for Name: movie_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_user (id, movieid, userid) FROM stdin;
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, title, alternativetitle, synopsis, urlphoto, releasedate, linktrailer, rating, duration, status, approvalstatus, countryid) FROM stdin;
2	Pirates of the Caribbean: The Curse of the Black Pearl	\N	This swash-buckling tale follows the quest of Captain Jack Sparrow, a savvy pirate, and Will Turner, a resourceful blacksmith, as they search for Elizabeth Swann.	https://m.media-amazon.com/images/M/MV5BNGYyZGM5MGMtYTY2Ni00M2Y1LWIzNjQtYWUzM2VlNGVhMDNhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg	2003-07-09 00:00:00+07	https://www.youtube.com/watch?v=naQr0uTrH_s	8.1	143	Released	t	1
3	Pirates of the Caribbean: Dead Man's Chest	\N	Captain Jack Sparrow owes a debt to Davy Jones, who captains the flying Dutchman. Jack must find the heart of Davy Jones.	https://m.media-amazon.com/images/M/MV5BMTcwODc1MTMxM15BMl5BanBnXkFtZTYwMDg1NzY3._V1_.jpg	2006-07-07 00:00:00+07	https://www.youtube.com/watch?v=ozk0-RHXtFw	7.3	151	Released	t	1
4	Drive	\N	A skilled Hollywood stuntman, who also moonlights as a getaway driver, finds himself drawn into a dangerous underworld of crime and violence.	https://m.media-amazon.com/images/M/MV5BYTFmNTFlOTAtNzEyNi00MWU2LTg3MGEtYjA2NWY3MDliNjlkXkEyXkFqcGc@._V1_.jpg	2011-09-16 00:00:00+07	https://www.youtube.com/watch?v=CWX34ShfcsE	7.8	100	Released	t	1
6	The Notebook	\N	A young couple falls in love, but circumstances and social expectations drive them apart. Years later, their love story is retold through a notebook.	https://m.media-amazon.com/images/M/MV5BNzk0NGU5ZWYtZTI5Ni00NTcwLWJjMzAtN2JmZTA5YTA1YTVlXkEyXkFqcGdeQXVyMzk3NDU4NTU@._V1_.jpg	2004-06-25 00:00:00+07	https://www.youtube.com/watch?v=FC6biTjEyZw	7.8	123	Released	t	1
7	La La Land	\N	A jazz musician and an aspiring actress fall in love while pursuing their dreams in Los Angeles, but their relationship faces challenges as they grow more successful.	https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_FMjpg_UX1000_.jpg	2016-12-09 00:00:00+07	https://www.youtube.com/watch?v=0pdqf4P9MB8	8	128	Released	t	1
8	Pirates of the Caribbean: At World's End	\N	Will Turner, Elizabeth Swann, and Captain Barbossa make their final alliances to face off against Lord Cutler Beckett and Davy Jones.	https://m.media-amazon.com/images/M/MV5BZThmMzE4OTktMDBlMi00OWM3LWIzNjQtZjY4NmRlNjNjZTFlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_.jpg	2007-05-25 00:00:00+07	https://www.youtube.com/watch?v=HKSZtp_OGHY	7.1	169	Released	t	1
10	Pirates of the Caribbean: Dead Men Tell No Tales	\N	Captain Jack Sparrow faces ghost pirates led by his old nemesis, Captain Salazar, who is determined to kill every pirate at sea.	https://m.media-amazon.com/images/M/MV5BMTYyMTcxNzc5M15BMl5BanBnXkFtZTgwOTg2ODE2MTI@._V1_.jpg	2017-05-26 00:00:00+07	https://www.youtube.com/watch?v=Hgeu5rhoxxY	6.5	129	Released	t	1
11	Despicable Me	\N	Gru, a supervillain, plans to steal the moon, but his life changes when he adopts three orphaned girls.	https://m.media-amazon.com/images/M/MV5BMTY3NjY0MTQ0Nl5BMl5BanBnXkFtZTcwMzQ2MTc0Mw@@._V1_.jpg	2010-07-09 00:00:00+07	https://www.youtube.com/watch?v=zzCZ1W_CUoI	7.6	95	Released	t	1
13	Despicable Me 3	\N	Gru meets his long-lost twin brother, who wants to embrace a villainous lifestyle.	https://m.media-amazon.com/images/M/MV5BNjUyNzQ2MTg3Ml5BMl5BanBnXkFtZTgwNzE4NDM3MTI@._V1_FMjpg_UX1000_.jpg	2017-06-30 00:00:00+07	https://www.youtube.com/watch?v=6DBi41reeF0	6.2	90	Released	t	1
14	Minions	\N	The Minions search for the perfect villainous master, leading them to Scarlet Overkill.	https://m.media-amazon.com/images/M/MV5BODI4NzMyNjE0MF5BMl5BanBnXkFtZTgwMTcwNzI0MzE@._V1_FMjpg_UX1000_.jpg	2015-07-10 00:00:00+07	https://www.youtube.com/watch?v=P9-FCC6I7u0	6.4	91	Released	t	1
16	Toy Story	\N	Woody, a toy cowboy, feels threatened when Buzz Lightyear, a new toy, becomes Andy's favorite.	https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_QL75_UX190_CR0,1,190,281_.jpg	1995-11-22 00:00:00+07	https://www.youtube.com/watch?v=v-PjgYDrg70	8.3	81	Released	t	1
18	Toy Story 3	\N	As Andy prepares to leave for college, his toys are mistakenly sent to a daycare center.	https://m.media-amazon.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@._V1_QL75_UY281_CR5,0,190,281_.jpg	2010-06-18 00:00:00+07	https://www.youtube.com/watch?v=2BlMNH1QTeE	8.2	103	Released	t	1
17	Toy Story 2	\N	Buzz and the other toys must rescue Woody when he is stolen by a toy collector.	https://m.media-amazon.com/images/M/MV5BMWM5ZDcxMTYtNTEyNS00MDRkLWI3YTItNThmMGExMWY4NDIwXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_FMjpg_UX1000_.jpg	1999-11-24 00:00:00+07	https://www.youtube.com/watch?v=0gDFIGAXZa4	7.9	92	Released	t	1
12	Despicable Me 2	\N	Gru is recruited by the Anti-Villain League to help track down a stolen Arctic lab.	https://m.media-amazon.com/images/M/MV5BMTQxNzY1MjI5NF5BMl5BanBnXkFtZTcwNTI0MDY1OQ@@._V1_FMjpg_UX1000_.jpg	2013-07-03 00:00:00+07	https://www.youtube.com/watch?v=TlbnGSMJQbQ	7.3	98	Released	t	1
9	Pirates of the Caribbean: On Stranger Tides	\N	Captain Jack Sparrow embarks on a quest to find the Fountain of Youth, encountering Angelica, Blackbeard, and treachery along the way.	https://m.media-amazon.com/images/M/MV5BY2JiZDg4MzMtNmZlZS00MjUyLTgyMWYtODQyZjIzMGI3NDY0XkEyXkFqcGc@._V1_.jpg	2011-05-20 00:00:00+07	https://www.youtube.com/watch?v=0BXCVe8Yww4	6.6	137	Released	t	1
20	UP	\N	Carl Fredricksen embarks on an adventure to South America by tying thousands of balloons to his house.	https://m.media-amazon.com/images/M/MV5BYjBkM2RjMzItM2M3Ni00N2NjLWE3NzMtMGY4MzE4MDAzMTRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg	2009-05-29 00:00:00+07	https://www.youtube.com/watch?v=ORFWdXl_zJ4	8.2	96	Released	t	1
5	Barbie	\N	Barbie experiences an existential crisis that sends her on an adventure into the real world, where she explores self-discovery and empowerment.	https://m.media-amazon.com/images/M/MV5BOTIxZTMyZTgtYTg1Ny00ZDNmLTkwMTEtZTI3Mzg5OTE2N2E2XkEyXkFqcGc@._V1_.jpg	2023-07-21 00:00:00+07	https://www.youtube.com/watch?v=pBk4NYhWNMM	7.4	114	Released	f	1
19	Toy Story 4	\N	Woody goes on a road trip with Bonnie's new toy Forky and reunites with Bo Peep.	https://m.media-amazon.com/images/M/MV5BMTYzMDM4NzkxOV5BMl5BanBnXkFtZTgwNzM1Mzg2NzM@._V1_QL75_UX190_CR0,0,190,281_.jpg	2019-06-21 00:00:00+07	https://www.youtube.com/watch?v=wmiIUN-7qhE	7.7	100	Released	f	1
21	The Shawshank Redemption	\N	Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.	https://m.media-amazon.com/images/M/MV5BMDAyY2FhYjctNDc5OS00MDNlLThiMGUtY2UxYWVkNGY2ZjljXkEyXkFqcGc@._V1_.jpg	1994-09-23 00:00:00+07	https://www.youtube.com/watch?v=NmzuHjWmXOc	9.3	142	Released	t	1
22	The Godfather	\N	The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.	https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg	1972-03-24 00:00:00+07	https://www.youtube.com/watch?v=sY1S34973zA	9.2	175	Released	t	1
23	The Dark Knight	\N	When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.	https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg	2008-07-18 00:00:00+07	https://www.youtube.com/watch?v=EXeTwQWrcwY	9	152	Released	t	1
24	SchindlerΓÇÖs List	\N	In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.	https://m.media-amazon.com/images/M/MV5BNjM1ZDQxYWUtMzQyZS00MTE1LWJmZGYtNGUyNTdlYjM3ZmVmXkEyXkFqcGc@._V1_.jpg	1993-12-15 00:00:00+07	https://www.youtube.com/watch?v=gG22XNhtnoY	9	195	Released	t	2
26	The Lord of the Rings: The Return of the King	\N	Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.	https://m.media-amazon.com/images/M/MV5BMTZkMjBjNWMtZGI5OC00MGU0LTk4ZTItODg2NWM3NTVmNWQ4XkEyXkFqcGc@._V1_.jpg	2003-12-17 00:00:00+07	https://www.youtube.com/watch?v=r5X-hFf6Bwo	8.9	201	Released	t	2
27	Pulp Fiction	\N	The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.	https://m.media-amazon.com/images/M/MV5BYTViYTE3ZGQtNDBlMC00ZTAyLTkyODMtZGRiZDg0MjA2YThkXkEyXkFqcGc@._V1_QL75_UY281_CR2,0,190,281_.jpg	1994-10-14 00:00:00+07	https://www.youtube.com/watch?v=s7EdQ4FqbhY	8.9	154	Released	t	1
28	Inception	\N	A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.	https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX1000_.jpg	2010-07-16 00:00:00+07	https://www.youtube.com/watch?v=YoHD9XEInc0	8.8	148	Released	t	1
29	Fight Club	\N	An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.	https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_QL75_UX190_CR0,2,190,281_.jpg	1999-10-15 00:00:00+07	https://www.youtube.com/watch?v=SUXWAEX2jlg	8.8	139	Released	t	1
30	Forrest Gump	\N	The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other historical events unfold from the perspective of an Alabama man with an IQ of 75.	https://m.media-amazon.com/images/M/MV5BNDYwNzVjMTItZmU5YS00YjQ5LTljYjgtMjY2NDVmYWMyNWFmXkEyXkFqcGc@._V1_.jpg	1994-07-06 00:00:00+07	https://www.youtube.com/watch?v=bLvqoHBptjg	8.8	142	Released	t	1
31	GoodFellas	\N	The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito.	https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg	1990-09-21 00:00:00+07	https://www.youtube.com/watch?v=2ilzidi_J8Q	8.7	146	Released	t	1
32	The Matrix	\N	A computer hacker learns about the true nature of his reality and his role in the war against its controllers.	https://m.media-amazon.com/images/M/MV5BN2NmN2VhMTQtMDNiOS00NDlhLTliMjgtODE2ZTY0ODQyNDRhXkEyXkFqcGc@._V1_QL75_UX190_CR0,2,190,281_.jpg	1999-03-31 00:00:00+07	https://www.youtube.com/watch?v=vKQi3bBA1y8	8.7	136	Released	t	1
33	Oppenheimer	\N	The story of J. Robert Oppenheimer, the theoretical physicist who helped create the atomic bomb during World War II.	https://m.media-amazon.com/images/M/MV5BN2JkMDc5MGQtZjg3YS00NmFiLWIyZmQtZTJmNTM5MjVmYTQ4XkEyXkFqcGc@._V1_.jpg	2023-07-21 00:00:00+07	https://www.youtube.com/watch?v=bK6ldnjE3Y0	8.8	180	Released	t	1
34	Interstellar	\N	A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.	https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_.jpg	2014-11-07 00:00:00+07	https://www.youtube.com/watch?v=zSWdZVtXT7E	8.6	169	Released	t	1
35	The Prestige	\N	After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion.	https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_.jpg	2006-10-20 00:00:00+07	https://www.youtube.com/watch?v=o4gHCmTQDVI	8.5	130	Released	t	2
36	Gladiator	\N	A former Roman general sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.	https://m.media-amazon.com/images/M/MV5BYWQ4YmNjYjEtOWE1Zi00Y2U4LWI4NTAtMTU0MjkxNWQ1ZmJiXkEyXkFqcGc@._V1_QL75_UX190_CR0,0,190,281_.jpg	2000-05-05 00:00:00+07	https://www.youtube.com/watch?v=owK1qxDselE	8.5	155	Released	t	1
37	The Aviator	\N	A biographical depiction of aviation pioneer Howard Hughes, exploring his triumphs and struggles in business and his descent into madness.	https://m.media-amazon.com/images/M/MV5BYTUyYWJlNDgtOTM5Ny00YTQ3LWFmYTgtZjJiNTNkYjJlMmY4XkEyXkFqcGc@._V1_QL75_UX190_CR0,0,190,281_.jpg	2004-12-25 00:00:00+07	https://www.youtube.com/watch?v=awvqIi427_A	7.5	170	Released	t	1
38	The Revenant	\N	A frontiersman fights for survival after being mauled by a bear and left for dead by his companions in the 1820s American wilderness.	https://m.media-amazon.com/images/M/MV5BYTgwNmQzZDctMjNmOS00OTExLTkwM2UtNzJmOTJhODFjOTdlXkEyXkFqcGc@._V1_QL75_UX190_CR0,0,190,281_.jpg	2015-12-25 00:00:00+07	https://www.youtube.com/watch?v=LoebZZ8K5N0	8	156	Released	t	1
39	Catch Me If You Can	\N	The story of Frank Abagnale Jr., who, before his 19th birthday, successfully performed cons worth millions of dollars by posing as a Pan Am pilot, doctor, and legal prosecutor.	https://m.media-amazon.com/images/M/MV5BMTY5MzYzNjc5NV5BMl5BanBnXkFtZTYwNTUyNTc2._V1_FMjpg_UX1000_.jpg	2002-12-25 00:00:00+07	https://www.youtube.com/watch?v=71rDQ7z4eFg	8.1	141	Released	t	1
40	The Wolf of Wall Street	\N	Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption, and the federal government.	https://m.media-amazon.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_FMjpg_UX1000_.jpg	2013-12-25 00:00:00+07	https://www.youtube.com/watch?v=iszwuX1AK6A	8.2	180	Released	t	1
41	Les Mis├⌐rables	\N	In 19th-century France, Jean Valjean, who for decades has been hunted by the ruthless policeman Javert after breaking parole, agrees to care for a factory worker's daughter. The decision changes their lives forever.	https://m.media-amazon.com/images/M/MV5BY2Q1YjIxZTAtZTU0YS00ZmE5LWEwODEtY2IyYWM2ZTJlOWE1XkEyXkFqcGc@._V1_.jpg	2012-12-25 00:00:00+07	https://www.youtube.com/watch?v=IuEFm84s4oI	7.6	158	Released	t	2
43	Braveheart	\N	Scottish warrior William Wallace leads his countrymen in a rebellion to free his homeland from the tyranny of King Edward I of England.	https://m.media-amazon.com/images/M/MV5BNGMxZDBhNGQtYTZlNi00N2UzLWI4NDEtNmUzNWM2NTdmZDA0XkEyXkFqcGc@._V1_.jpg	1995-05-24 00:00:00+07	https://www.youtube.com/watch?v=nMft5QDOHek	8.3	178	Released	t	1
44	A Beautiful Mind	\N	After John Nash, a brilliant but asocial mathematician, accepts secret work in cryptography, his life takes a turn for the nightmarish.	https://m.media-amazon.com/images/M/MV5BNzljZTk5ZDgtZTQ1Zi00NTM4LThlOGUtZDk2MGM4NDQ4NWQyXkEyXkFqcGc@._V1_.jpg	2001-12-21 00:00:00+07	https://www.youtube.com/watch?v=aS_d0Ayjw4o	8.2	135	Released	t	1
45	The Big Short	\N	In 2006-2007, a group of investors bet against the U.S. mortgage market. In their research, they discover how flawed and corrupt the market is.	https://m.media-amazon.com/images/M/MV5BZDZkNDQ3YjktYjBlZC00YTY1LTgxOGYtY2RhMWFhZmNkZGY3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg	2015-12-11 00:00:00+07	https://www.youtube.com/watch?v=vgqG3ITMv1Q	7.8	130	Released	t	1
46	The Pursuit of Happyness	\N	A struggling salesman takes custody of his son as he's poised to begin a life-changing professional endeavor.	https://m.media-amazon.com/images/M/MV5BMTQ5NjQ0NDI3NF5BMl5BanBnXkFtZTcwNDI0MjEzMw@@._V1_FMjpg_UX1000_.jpg	2006-12-15 00:00:00+07	https://www.youtube.com/watch?v=89Kq8SDyvfg	8	117	Released	t	1
48	The Truman Show	\N	An insurance salesman discovers his entire life is actually a reality TV show.	https://m.media-amazon.com/images/M/MV5BNzA3ZjZlNzYtMTdjMy00NjMzLTk5ZGYtMTkyYzNiOGM1YmM3XkEyXkFqcGc@._V1_.jpg	1998-06-05 00:00:00+07	https://www.youtube.com/watch?v=loTIzXAS7v4	8.1	103	Released	t	1
49	Indiana Jones and the Last Crusade	\N	In 1938, after his father goes missing while pursuing the Holy Grail, Indiana Jones finds himself up against Adolf Hitler's Nazis again to stop them from obtaining its powers.	https://m.media-amazon.com/images/M/MV5BNGIxNzQ0YzYtMjNmYi00YjBlLWFjNzEtNGE3ZGFmYTczM2MwXkEyXkFqcGc@._V1_.jpg	1989-05-24 00:00:00+07	https://www.youtube.com/watch?v=sagmdpkWUqc	8.2	127	Released	t	1
47	Gone Girl	\N	With his wife's disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it's suspected that he may not be innocent.	https://m.media-amazon.com/images/M/MV5BMTk0MDQ3MzAzOV5BMl5BanBnXkFtZTgwNzU1NzE3MjE@._V1_FMjpg_UX1000_.jpg	2014-10-03 00:00:00+07	https://www.youtube.com/watch?v=2-_-1nJf8Vg?si=zWj8TTJ_8JnJwQpK	8.1	149	Released	t	1
50	Cast Away	\N	A FedEx executive must transform himself physically and emotionally to survive a crash landing on a deserted island.	https://m.media-amazon.com/images/M/MV5BOGNjNDI5ZGQtZjRjMy00NzQyLWFiYzQtYjcwNjM3ZDYwNThhXkEyXkFqcGc@._V1_QL75_UX190_CR0,0,190,281_.jpg	2000-12-22 00:00:00+07	https://www.youtube.com/watch?v=/qGuOZPwLayY?si=NlB_KJdScSBobvqZ	7.8	143	Released	t	1
42	Noah	\N	A man is chosen by God to undertake a momentous mission of rescue before an apocalyptic flood destroys the world.	https://m.media-amazon.com/images/M/MV5BMjI2OTgyNTc0Ml5BMl5BanBnXkFtZTgwNDM1NTQxMTE@._V1_FMjpg_UX1000_.jpg	2014-03-28 00:00:00+07	https://www.youtube.com/watch?v=/fdu10cX3pWA?si=QAKs512gHq3y7AYo	5.8	138	Released	t	1
25	12 Angry Men	\N	A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.	https://m.media-amazon.com/images/M/MV5BYjE4NzdmOTYtYjc5Yi00YzBiLWEzNDEtNTgxZGQ2MWVkN2NiXkEyXkFqcGc@._V1_.jpg	1957-04-10 00:00:00+07	https://www.youtube.com/watch?v=TEN-2uTi2c0?si=4leON86V5ZZmFGsD	9	96	Released	t	1
15	Despicable Me 4	\N	Gru faces challenges as his son Gru Jr. gets into trouble and a new villain arises.	https://m.media-amazon.com/images/M/MV5BNzY0ZTlhYzgtOTgzZC00ZTg2LTk4NTEtZDllM2E2NGE5Njg2XkEyXkFqcGc@._V1_QL75_UX190_CR0,2,190,281_.jpg	2024-07-03 00:00:00+07	https://www.youtube.com/watch?v=LtNYaH61dXY	0	95	On Going	t	1
52	TEST123		makan bang	https://m.media-amazon.com/images/M/MV5BOTIxZTMyZTgtYTg1Ny00ZDNmLTkwMTEtZTI3Mzg5OTE2N2E2XkEyXkFqcGc@._V1_.jpg	2024-11-04 07:00:00+07	https://www.youtube.com/watch?v=LtNYaH61dXY	9.9	95	Released	f	3
51	matharr	ee	aku menamatkan	https://avatars.githubusercontent.com/u/124325264?v=4	2024-11-05 07:00:00+07	https://www.youtube.com/watch?v=TGYEvZjRCF4	9	95	Released	t	6
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, role, "createdAt", "updatedAt", "verificationCode", "isVerified", "googleId", suspend) FROM stdin;
68	mathar1	matharrizqi1@gmail.com	$2a$10$UipgwjeZwMjjO.YYXb00.Ow31pxITexNrvBKYSDPJBWMhrl4biOXa	editor	2024-11-18 09:29:44.259+07	2024-11-18 09:30:42.763+07	\N	t	\N	f
22	3A_014_MATHAR	muhamad.mathar.tif422@polban.ac.id	\N	editor	2024-10-18 20:49:42.557+07	2024-11-18 08:23:22.73+07	\N	f	105045971583177407889	f
16	mathar	matharrizqi@gmail.com	$2a$10$ElPMns5/y3qwala/yqT5.ukTUA3ALc3KWeQRrcYBhdtO7KI9emMqW	admin	2024-10-14 02:59:19.841+07	2024-11-18 08:24:31.757+07	638526	t	\N	f
59	Rafadi Azwanto	rafadiazwanto@gmail.com	\N	editor	2024-11-18 08:23:36.508+07	2024-11-18 08:23:36.508+07	\N	f	110111291750594837984	f
70	manz	firmanfirdaus3006@gmail.com	$2a$10$KBdh7GewO9/UYHgBQgEnJuWCCKXkaaeB3GrOAkdBMq2wfANLnw8NS	admin	2024-11-19 12:03:08.7+07	2024-11-19 12:03:27.628+07	\N	t	\N	f
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 1, true);


--
-- Name: actors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_id_seq', 56, true);


--
-- Name: availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.availabilities_id_seq', 9, true);


--
-- Name: awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.awards_id_seq', 43, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 5, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 15, true);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_id_seq', 33, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_seq', 30, true);


--
-- Name: movie_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_actor_id_seq', 97, true);


--
-- Name: movie_availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_availabilities_id_seq', 76, true);


--
-- Name: movie_award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_award_id_seq', 75, true);


--
-- Name: movie_director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_director_id_seq', 53, true);


--
-- Name: movie_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_genre_id_seq', 128, true);


--
-- Name: movie_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_user_id_seq', 1, false);


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 65, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 70, true);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key1" UNIQUE (email);


--
-- Name: Users Users_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key2" UNIQUE (email);


--
-- Name: Users Users_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key3" UNIQUE (email);


--
-- Name: Users Users_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key4" UNIQUE (email);


--
-- Name: Users Users_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key5" UNIQUE (email);


--
-- Name: Users Users_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key6" UNIQUE (email);


--
-- Name: Users Users_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key7" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- Name: availabilities availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availabilities
    ADD CONSTRAINT availabilities_pkey PRIMARY KEY (id);


--
-- Name: awards awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: movie_actor movie_actor_movieid_actorid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_actorid_key UNIQUE (movieid, actorid);


--
-- Name: movie_actor movie_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_pkey PRIMARY KEY (id);


--
-- Name: movie_availabilities movie_availabilities_movieid_availid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_availid_key UNIQUE (movieid, availid);


--
-- Name: movie_availabilities movie_availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_pkey PRIMARY KEY (id);


--
-- Name: movie_award movie_award_movieid_awardid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_awardid_key UNIQUE (movieid, awardid);


--
-- Name: movie_award movie_award_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_pkey PRIMARY KEY (id);


--
-- Name: movie_director movie_director_movieid_directorid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_directorid_key UNIQUE (movieid, directorid);


--
-- Name: movie_director movie_director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_pkey PRIMARY KEY (id);


--
-- Name: movie_genre movie_genre_movieid_genreid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_genreid_key UNIQUE (movieid, genreid);


--
-- Name: movie_genre movie_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_pkey PRIMARY KEY (id);


--
-- Name: movie_user movie_user_movieid_userid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_user
    ADD CONSTRAINT movie_user_movieid_userid_key UNIQUE (movieid, userid);


--
-- Name: movie_user movie_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_user
    ADD CONSTRAINT movie_user_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- Name: users users_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);


--
-- Name: users users_email_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key100 UNIQUE (email);


--
-- Name: users users_email_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key101 UNIQUE (email);


--
-- Name: users users_email_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key102 UNIQUE (email);


--
-- Name: users users_email_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key103 UNIQUE (email);


--
-- Name: users users_email_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key104 UNIQUE (email);


--
-- Name: users users_email_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key105 UNIQUE (email);


--
-- Name: users users_email_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key106 UNIQUE (email);


--
-- Name: users users_email_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key107 UNIQUE (email);


--
-- Name: users users_email_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key108 UNIQUE (email);


--
-- Name: users users_email_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key109 UNIQUE (email);


--
-- Name: users users_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);


--
-- Name: users users_email_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key110 UNIQUE (email);


--
-- Name: users users_email_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key111 UNIQUE (email);


--
-- Name: users users_email_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key112 UNIQUE (email);


--
-- Name: users users_email_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key113 UNIQUE (email);


--
-- Name: users users_email_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key114 UNIQUE (email);


--
-- Name: users users_email_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key115 UNIQUE (email);


--
-- Name: users users_email_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key116 UNIQUE (email);


--
-- Name: users users_email_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key117 UNIQUE (email);


--
-- Name: users users_email_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key118 UNIQUE (email);


--
-- Name: users users_email_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key119 UNIQUE (email);


--
-- Name: users users_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);


--
-- Name: users users_email_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key120 UNIQUE (email);


--
-- Name: users users_email_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key121 UNIQUE (email);


--
-- Name: users users_email_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key122 UNIQUE (email);


--
-- Name: users users_email_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key123 UNIQUE (email);


--
-- Name: users users_email_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key124 UNIQUE (email);


--
-- Name: users users_email_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key125 UNIQUE (email);


--
-- Name: users users_email_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key126 UNIQUE (email);


--
-- Name: users users_email_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key127 UNIQUE (email);


--
-- Name: users users_email_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key128 UNIQUE (email);


--
-- Name: users users_email_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key129 UNIQUE (email);


--
-- Name: users users_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);


--
-- Name: users users_email_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key130 UNIQUE (email);


--
-- Name: users users_email_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key131 UNIQUE (email);


--
-- Name: users users_email_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key132 UNIQUE (email);


--
-- Name: users users_email_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key133 UNIQUE (email);


--
-- Name: users users_email_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key134 UNIQUE (email);


--
-- Name: users users_email_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key135 UNIQUE (email);


--
-- Name: users users_email_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key136 UNIQUE (email);


--
-- Name: users users_email_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key137 UNIQUE (email);


--
-- Name: users users_email_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key138 UNIQUE (email);


--
-- Name: users users_email_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key139 UNIQUE (email);


--
-- Name: users users_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);


--
-- Name: users users_email_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key140 UNIQUE (email);


--
-- Name: users users_email_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key141 UNIQUE (email);


--
-- Name: users users_email_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key142 UNIQUE (email);


--
-- Name: users users_email_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key143 UNIQUE (email);


--
-- Name: users users_email_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key144 UNIQUE (email);


--
-- Name: users users_email_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key145 UNIQUE (email);


--
-- Name: users users_email_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key146 UNIQUE (email);


--
-- Name: users users_email_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key147 UNIQUE (email);


--
-- Name: users users_email_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key148 UNIQUE (email);


--
-- Name: users users_email_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key149 UNIQUE (email);


--
-- Name: users users_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);


--
-- Name: users users_email_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key150 UNIQUE (email);


--
-- Name: users users_email_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key151 UNIQUE (email);


--
-- Name: users users_email_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key152 UNIQUE (email);


--
-- Name: users users_email_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key153 UNIQUE (email);


--
-- Name: users users_email_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key154 UNIQUE (email);


--
-- Name: users users_email_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key155 UNIQUE (email);


--
-- Name: users users_email_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key156 UNIQUE (email);


--
-- Name: users users_email_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key157 UNIQUE (email);


--
-- Name: users users_email_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key158 UNIQUE (email);


--
-- Name: users users_email_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key159 UNIQUE (email);


--
-- Name: users users_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);


--
-- Name: users users_email_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key160 UNIQUE (email);


--
-- Name: users users_email_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key161 UNIQUE (email);


--
-- Name: users users_email_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key162 UNIQUE (email);


--
-- Name: users users_email_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key163 UNIQUE (email);


--
-- Name: users users_email_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key164 UNIQUE (email);


--
-- Name: users users_email_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key165 UNIQUE (email);


--
-- Name: users users_email_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key166 UNIQUE (email);


--
-- Name: users users_email_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key167 UNIQUE (email);


--
-- Name: users users_email_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key168 UNIQUE (email);


--
-- Name: users users_email_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key169 UNIQUE (email);


--
-- Name: users users_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);


--
-- Name: users users_email_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key170 UNIQUE (email);


--
-- Name: users users_email_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key171 UNIQUE (email);


--
-- Name: users users_email_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key172 UNIQUE (email);


--
-- Name: users users_email_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key173 UNIQUE (email);


--
-- Name: users users_email_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key174 UNIQUE (email);


--
-- Name: users users_email_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key175 UNIQUE (email);


--
-- Name: users users_email_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key176 UNIQUE (email);


--
-- Name: users users_email_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key177 UNIQUE (email);


--
-- Name: users users_email_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key178 UNIQUE (email);


--
-- Name: users users_email_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key179 UNIQUE (email);


--
-- Name: users users_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);


--
-- Name: users users_email_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key180 UNIQUE (email);


--
-- Name: users users_email_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key181 UNIQUE (email);


--
-- Name: users users_email_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key182 UNIQUE (email);


--
-- Name: users users_email_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key183 UNIQUE (email);


--
-- Name: users users_email_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key184 UNIQUE (email);


--
-- Name: users users_email_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key185 UNIQUE (email);


--
-- Name: users users_email_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key186 UNIQUE (email);


--
-- Name: users users_email_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key187 UNIQUE (email);


--
-- Name: users users_email_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key188 UNIQUE (email);


--
-- Name: users users_email_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key189 UNIQUE (email);


--
-- Name: users users_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);


--
-- Name: users users_email_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key190 UNIQUE (email);


--
-- Name: users users_email_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key191 UNIQUE (email);


--
-- Name: users users_email_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key192 UNIQUE (email);


--
-- Name: users users_email_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key193 UNIQUE (email);


--
-- Name: users users_email_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key194 UNIQUE (email);


--
-- Name: users users_email_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key195 UNIQUE (email);


--
-- Name: users users_email_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key196 UNIQUE (email);


--
-- Name: users users_email_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key197 UNIQUE (email);


--
-- Name: users users_email_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key198 UNIQUE (email);


--
-- Name: users users_email_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key199 UNIQUE (email);


--
-- Name: users users_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);


--
-- Name: users users_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);


--
-- Name: users users_email_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key200 UNIQUE (email);


--
-- Name: users users_email_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key201 UNIQUE (email);


--
-- Name: users users_email_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key202 UNIQUE (email);


--
-- Name: users users_email_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key203 UNIQUE (email);


--
-- Name: users users_email_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key204 UNIQUE (email);


--
-- Name: users users_email_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key205 UNIQUE (email);


--
-- Name: users users_email_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key206 UNIQUE (email);


--
-- Name: users users_email_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key207 UNIQUE (email);


--
-- Name: users users_email_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key208 UNIQUE (email);


--
-- Name: users users_email_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key209 UNIQUE (email);


--
-- Name: users users_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);


--
-- Name: users users_email_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key210 UNIQUE (email);


--
-- Name: users users_email_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key211 UNIQUE (email);


--
-- Name: users users_email_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key212 UNIQUE (email);


--
-- Name: users users_email_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key213 UNIQUE (email);


--
-- Name: users users_email_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key214 UNIQUE (email);


--
-- Name: users users_email_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key215 UNIQUE (email);


--
-- Name: users users_email_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key216 UNIQUE (email);


--
-- Name: users users_email_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key217 UNIQUE (email);


--
-- Name: users users_email_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key218 UNIQUE (email);


--
-- Name: users users_email_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key219 UNIQUE (email);


--
-- Name: users users_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);


--
-- Name: users users_email_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key220 UNIQUE (email);


--
-- Name: users users_email_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key221 UNIQUE (email);


--
-- Name: users users_email_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key222 UNIQUE (email);


--
-- Name: users users_email_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key223 UNIQUE (email);


--
-- Name: users users_email_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key224 UNIQUE (email);


--
-- Name: users users_email_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key225 UNIQUE (email);


--
-- Name: users users_email_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key226 UNIQUE (email);


--
-- Name: users users_email_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key227 UNIQUE (email);


--
-- Name: users users_email_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key228 UNIQUE (email);


--
-- Name: users users_email_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key229 UNIQUE (email);


--
-- Name: users users_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);


--
-- Name: users users_email_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key230 UNIQUE (email);


--
-- Name: users users_email_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key231 UNIQUE (email);


--
-- Name: users users_email_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key232 UNIQUE (email);


--
-- Name: users users_email_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key233 UNIQUE (email);


--
-- Name: users users_email_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key234 UNIQUE (email);


--
-- Name: users users_email_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key235 UNIQUE (email);


--
-- Name: users users_email_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key236 UNIQUE (email);


--
-- Name: users users_email_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key237 UNIQUE (email);


--
-- Name: users users_email_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key238 UNIQUE (email);


--
-- Name: users users_email_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key239 UNIQUE (email);


--
-- Name: users users_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);


--
-- Name: users users_email_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key240 UNIQUE (email);


--
-- Name: users users_email_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key241 UNIQUE (email);


--
-- Name: users users_email_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key242 UNIQUE (email);


--
-- Name: users users_email_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key243 UNIQUE (email);


--
-- Name: users users_email_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key244 UNIQUE (email);


--
-- Name: users users_email_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key245 UNIQUE (email);


--
-- Name: users users_email_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key246 UNIQUE (email);


--
-- Name: users users_email_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key247 UNIQUE (email);


--
-- Name: users users_email_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key248 UNIQUE (email);


--
-- Name: users users_email_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key249 UNIQUE (email);


--
-- Name: users users_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);


--
-- Name: users users_email_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key250 UNIQUE (email);


--
-- Name: users users_email_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key251 UNIQUE (email);


--
-- Name: users users_email_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key252 UNIQUE (email);


--
-- Name: users users_email_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key253 UNIQUE (email);


--
-- Name: users users_email_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key254 UNIQUE (email);


--
-- Name: users users_email_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key255 UNIQUE (email);


--
-- Name: users users_email_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key256 UNIQUE (email);


--
-- Name: users users_email_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key257 UNIQUE (email);


--
-- Name: users users_email_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key258 UNIQUE (email);


--
-- Name: users users_email_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key259 UNIQUE (email);


--
-- Name: users users_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);


--
-- Name: users users_email_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key260 UNIQUE (email);


--
-- Name: users users_email_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key261 UNIQUE (email);


--
-- Name: users users_email_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key262 UNIQUE (email);


--
-- Name: users users_email_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key263 UNIQUE (email);


--
-- Name: users users_email_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key264 UNIQUE (email);


--
-- Name: users users_email_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key265 UNIQUE (email);


--
-- Name: users users_email_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key266 UNIQUE (email);


--
-- Name: users users_email_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key267 UNIQUE (email);


--
-- Name: users users_email_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key268 UNIQUE (email);


--
-- Name: users users_email_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key269 UNIQUE (email);


--
-- Name: users users_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);


--
-- Name: users users_email_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key270 UNIQUE (email);


--
-- Name: users users_email_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key271 UNIQUE (email);


--
-- Name: users users_email_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key272 UNIQUE (email);


--
-- Name: users users_email_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key273 UNIQUE (email);


--
-- Name: users users_email_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key274 UNIQUE (email);


--
-- Name: users users_email_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key275 UNIQUE (email);


--
-- Name: users users_email_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key276 UNIQUE (email);


--
-- Name: users users_email_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key277 UNIQUE (email);


--
-- Name: users users_email_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key278 UNIQUE (email);


--
-- Name: users users_email_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key279 UNIQUE (email);


--
-- Name: users users_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);


--
-- Name: users users_email_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key280 UNIQUE (email);


--
-- Name: users users_email_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key281 UNIQUE (email);


--
-- Name: users users_email_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key282 UNIQUE (email);


--
-- Name: users users_email_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key283 UNIQUE (email);


--
-- Name: users users_email_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key284 UNIQUE (email);


--
-- Name: users users_email_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key285 UNIQUE (email);


--
-- Name: users users_email_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key286 UNIQUE (email);


--
-- Name: users users_email_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key287 UNIQUE (email);


--
-- Name: users users_email_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key288 UNIQUE (email);


--
-- Name: users users_email_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key289 UNIQUE (email);


--
-- Name: users users_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);


--
-- Name: users users_email_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key290 UNIQUE (email);


--
-- Name: users users_email_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key291 UNIQUE (email);


--
-- Name: users users_email_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key292 UNIQUE (email);


--
-- Name: users users_email_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key293 UNIQUE (email);


--
-- Name: users users_email_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key294 UNIQUE (email);


--
-- Name: users users_email_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key295 UNIQUE (email);


--
-- Name: users users_email_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key296 UNIQUE (email);


--
-- Name: users users_email_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key297 UNIQUE (email);


--
-- Name: users users_email_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key298 UNIQUE (email);


--
-- Name: users users_email_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key299 UNIQUE (email);


--
-- Name: users users_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);


--
-- Name: users users_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);


--
-- Name: users users_email_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key300 UNIQUE (email);


--
-- Name: users users_email_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key301 UNIQUE (email);


--
-- Name: users users_email_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key302 UNIQUE (email);


--
-- Name: users users_email_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key303 UNIQUE (email);


--
-- Name: users users_email_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key304 UNIQUE (email);


--
-- Name: users users_email_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key305 UNIQUE (email);


--
-- Name: users users_email_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key306 UNIQUE (email);


--
-- Name: users users_email_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key307 UNIQUE (email);


--
-- Name: users users_email_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key308 UNIQUE (email);


--
-- Name: users users_email_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key309 UNIQUE (email);


--
-- Name: users users_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);


--
-- Name: users users_email_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key310 UNIQUE (email);


--
-- Name: users users_email_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key311 UNIQUE (email);


--
-- Name: users users_email_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key312 UNIQUE (email);


--
-- Name: users users_email_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key313 UNIQUE (email);


--
-- Name: users users_email_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key314 UNIQUE (email);


--
-- Name: users users_email_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key315 UNIQUE (email);


--
-- Name: users users_email_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key316 UNIQUE (email);


--
-- Name: users users_email_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key317 UNIQUE (email);


--
-- Name: users users_email_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key318 UNIQUE (email);


--
-- Name: users users_email_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key319 UNIQUE (email);


--
-- Name: users users_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);


--
-- Name: users users_email_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key320 UNIQUE (email);


--
-- Name: users users_email_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key321 UNIQUE (email);


--
-- Name: users users_email_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key322 UNIQUE (email);


--
-- Name: users users_email_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key323 UNIQUE (email);


--
-- Name: users users_email_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key324 UNIQUE (email);


--
-- Name: users users_email_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key325 UNIQUE (email);


--
-- Name: users users_email_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key326 UNIQUE (email);


--
-- Name: users users_email_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key327 UNIQUE (email);


--
-- Name: users users_email_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key328 UNIQUE (email);


--
-- Name: users users_email_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key329 UNIQUE (email);


--
-- Name: users users_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);


--
-- Name: users users_email_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key330 UNIQUE (email);


--
-- Name: users users_email_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key331 UNIQUE (email);


--
-- Name: users users_email_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key332 UNIQUE (email);


--
-- Name: users users_email_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key333 UNIQUE (email);


--
-- Name: users users_email_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key334 UNIQUE (email);


--
-- Name: users users_email_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key335 UNIQUE (email);


--
-- Name: users users_email_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key336 UNIQUE (email);


--
-- Name: users users_email_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key337 UNIQUE (email);


--
-- Name: users users_email_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key338 UNIQUE (email);


--
-- Name: users users_email_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key339 UNIQUE (email);


--
-- Name: users users_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);


--
-- Name: users users_email_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key340 UNIQUE (email);


--
-- Name: users users_email_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key341 UNIQUE (email);


--
-- Name: users users_email_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key342 UNIQUE (email);


--
-- Name: users users_email_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key343 UNIQUE (email);


--
-- Name: users users_email_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key344 UNIQUE (email);


--
-- Name: users users_email_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key345 UNIQUE (email);


--
-- Name: users users_email_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key346 UNIQUE (email);


--
-- Name: users users_email_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key347 UNIQUE (email);


--
-- Name: users users_email_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key348 UNIQUE (email);


--
-- Name: users users_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);


--
-- Name: users users_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);


--
-- Name: users users_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);


--
-- Name: users users_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);


--
-- Name: users users_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);


--
-- Name: users users_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);


--
-- Name: users users_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);


--
-- Name: users users_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);


--
-- Name: users users_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);


--
-- Name: users users_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key43 UNIQUE (email);


--
-- Name: users users_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key44 UNIQUE (email);


--
-- Name: users users_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key45 UNIQUE (email);


--
-- Name: users users_email_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key46 UNIQUE (email);


--
-- Name: users users_email_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key47 UNIQUE (email);


--
-- Name: users users_email_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key48 UNIQUE (email);


--
-- Name: users users_email_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key49 UNIQUE (email);


--
-- Name: users users_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);


--
-- Name: users users_email_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key50 UNIQUE (email);


--
-- Name: users users_email_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key51 UNIQUE (email);


--
-- Name: users users_email_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key52 UNIQUE (email);


--
-- Name: users users_email_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key53 UNIQUE (email);


--
-- Name: users users_email_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key54 UNIQUE (email);


--
-- Name: users users_email_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key55 UNIQUE (email);


--
-- Name: users users_email_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key56 UNIQUE (email);


--
-- Name: users users_email_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key57 UNIQUE (email);


--
-- Name: users users_email_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key58 UNIQUE (email);


--
-- Name: users users_email_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key59 UNIQUE (email);


--
-- Name: users users_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);


--
-- Name: users users_email_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key60 UNIQUE (email);


--
-- Name: users users_email_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key61 UNIQUE (email);


--
-- Name: users users_email_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key62 UNIQUE (email);


--
-- Name: users users_email_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key63 UNIQUE (email);


--
-- Name: users users_email_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key64 UNIQUE (email);


--
-- Name: users users_email_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key65 UNIQUE (email);


--
-- Name: users users_email_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key66 UNIQUE (email);


--
-- Name: users users_email_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key67 UNIQUE (email);


--
-- Name: users users_email_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key68 UNIQUE (email);


--
-- Name: users users_email_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key69 UNIQUE (email);


--
-- Name: users users_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);


--
-- Name: users users_email_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key70 UNIQUE (email);


--
-- Name: users users_email_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key71 UNIQUE (email);


--
-- Name: users users_email_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key72 UNIQUE (email);


--
-- Name: users users_email_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key73 UNIQUE (email);


--
-- Name: users users_email_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key74 UNIQUE (email);


--
-- Name: users users_email_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key75 UNIQUE (email);


--
-- Name: users users_email_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key76 UNIQUE (email);


--
-- Name: users users_email_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key77 UNIQUE (email);


--
-- Name: users users_email_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key78 UNIQUE (email);


--
-- Name: users users_email_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key79 UNIQUE (email);


--
-- Name: users users_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);


--
-- Name: users users_email_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key80 UNIQUE (email);


--
-- Name: users users_email_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key81 UNIQUE (email);


--
-- Name: users users_email_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key82 UNIQUE (email);


--
-- Name: users users_email_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key83 UNIQUE (email);


--
-- Name: users users_email_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key84 UNIQUE (email);


--
-- Name: users users_email_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key85 UNIQUE (email);


--
-- Name: users users_email_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key86 UNIQUE (email);


--
-- Name: users users_email_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key87 UNIQUE (email);


--
-- Name: users users_email_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key88 UNIQUE (email);


--
-- Name: users users_email_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key89 UNIQUE (email);


--
-- Name: users users_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);


--
-- Name: users users_email_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key90 UNIQUE (email);


--
-- Name: users users_email_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key91 UNIQUE (email);


--
-- Name: users users_email_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key92 UNIQUE (email);


--
-- Name: users users_email_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key93 UNIQUE (email);


--
-- Name: users users_email_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key94 UNIQUE (email);


--
-- Name: users users_email_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key95 UNIQUE (email);


--
-- Name: users users_email_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key96 UNIQUE (email);


--
-- Name: users users_email_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key97 UNIQUE (email);


--
-- Name: users users_email_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key98 UNIQUE (email);


--
-- Name: users users_email_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key99 UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: actors actors_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey1 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey10 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey100 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey101 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey102 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey103 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey104 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey105 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey106 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey107 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey108 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey109 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey11 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey110 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey111 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey112 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey113 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey114 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey115 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey116 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey117 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey118 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey119 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey12 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey120 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey121 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey122 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey123 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey124 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey125 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey126 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey127 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey128 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey129 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey13 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey130 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey131 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey132 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey133 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey134 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey135 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey136 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey137 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey138 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey139 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey14 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey140 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey141 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey142 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey143 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey144 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey145 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey146 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey147 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey148 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey149 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey15 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey150 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey151 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey152 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey153 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey154 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey155 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey156 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey157 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey158 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey159 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey16 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey160 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey161 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey162 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey163 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey164 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey165 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey166 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey167 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey168 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey169 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey17 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey170 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey171 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey172 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey173 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey174 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey175 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey176 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey177 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey178 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey179 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey18 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey180 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey181 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey182 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey183 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey184 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey185 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey186 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey187 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey188 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey189 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey19 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey190 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey191; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey191 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey192; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey192 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey193; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey193 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey194; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey194 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey2 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey20 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey21 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey22 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey23 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey24 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey25 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey26 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey27 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey28 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey29 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey3 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey30 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey31 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey32 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey33 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey34 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey35 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey36 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey37 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey38 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey39 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey4 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey40 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey41 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey42 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey43 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey44 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey45 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey46 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey47 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey48 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey49 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey5 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey50 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey51 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey52 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey53 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey54 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey55 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey56 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey57 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey58 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey59 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey6 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey60 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey61 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey62 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey63 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey64 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey65 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey66 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey67 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey68 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey69 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey7 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey70 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey71 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey72 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey73 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey74 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey75 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey76 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey77 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey78 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey79 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey8 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey80 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey81 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey82 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey83 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey84 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey85 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey86 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey87 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey88 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey89 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey9 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey90 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey91 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey92 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey93 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey94 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey95 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey96 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey97 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey98 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: actors actors_countryid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_countryid_fkey99 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey1 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey10 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey100 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey101 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey102 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey103 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey104 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey105 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey106 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey107 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey108 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey109 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey11 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey110 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey111 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey112 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey113 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey114 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey115 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey116 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey117 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey118 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey119 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey12 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey120 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey121 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey122 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey123 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey124 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey125 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey126 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey127 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey128 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey129 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey13 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey130 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey131 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey132 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey133 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey134 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey135 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey136 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey137 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey138 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey139 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey14 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey140 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey141 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey142 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey143 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey144 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey145 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey146 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey147 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey148 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey149 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey15 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey150 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey151 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey152 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey153 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey154 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey155 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey156 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey157 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey158 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey159 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey16 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey160 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey161 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey162 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey163 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey164 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey165 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey166 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey167 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey168 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey169 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey17 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey170 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey171 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey172 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey173 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey174 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey175 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey176 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey177 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey178 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey179 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey18 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey180 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey181 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey182 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey183 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey184 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey185 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey186 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey187 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey188 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey189 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey19 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey190 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey191; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey191 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey192; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey192 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey193; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey193 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey194; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey194 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey195; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey195 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey196; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey196 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey197; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey197 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey198; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey198 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey199; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey199 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey2 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey20 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey200 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey201; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey201 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey202; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey202 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey203; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey203 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey204; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey204 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey205; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey205 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey206; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey206 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey207; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey207 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey208; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey208 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey209; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey209 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey21 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey210; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey210 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey211; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey211 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey22 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey23 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey24 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey25 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey26 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey27 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey28 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey29 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey3 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey30 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey31 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey32 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey33 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey34 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey35 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey36 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey37 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey38 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey39 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey4 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey40 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey41 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey42 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey43 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey44 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey45 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey46 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey47 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey48 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey49 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey5 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey50 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey51 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey52 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey53 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey54 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey55 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey56 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey57 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey58 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey59 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey6 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey60 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey61 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey62 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey63 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey64 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey65 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey66 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey67 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey68 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey69 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey7 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey70 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey71 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey72 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey73 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey74 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey75 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey76 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey77 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey78 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey79 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey8 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey80 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey81 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey82 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey83 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey84 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey85 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey86 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey87 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey88 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey89 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey9 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey90 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey91 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey92 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey93 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey94 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey95 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey96 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey97 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey98 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: awards awards_countryid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_countryid_fkey99 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey1 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey10 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey11 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey12 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey13 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey14 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey15 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey16 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey17 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey18 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey19 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey2 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey20 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey21 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey22 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey23 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey24 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey25 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey26 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey27 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey28 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey29 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey3 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey30 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey31 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey32 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey33 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey34 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey35 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey36 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey37 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey38 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey39 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey4 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey40 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey41 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey42 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey43 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey44 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey45 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey46 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey47 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey48 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey49 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey5 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey50 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey51 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey52 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey53 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey54 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey55 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey56 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey57 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey58 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey59 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey6 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey60 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey61 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey62 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey63 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey64 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey65 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey66 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey67 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey68 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey69 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey7 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey70 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey71 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey72 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey73 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey74 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey75 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey76 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey77 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey78 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey79 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey8 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_movieid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey80 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey81 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: comments comments_movieid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey82 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey83 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey84 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey85 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE;


--
-- Name: comments comments_movieid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_movieid_fkey9 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey1 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey10 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey11 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey12 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey13 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey14 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey15 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey16 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey17 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey18 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey19 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey2 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey20 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey21 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey22 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey23 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey24 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey25 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey26 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey27 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey28 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey29 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey3 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey30 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey31 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey32 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey33 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey34 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey35 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey36 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey37 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey38 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey39 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey4 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey40 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey41 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey42 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey43 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey44 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey45 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey46 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey47 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey48 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey49 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey5 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey50 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey51 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey52 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey53 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey54 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey55 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey56 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey57 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey58 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey59 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey6 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey60 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey61 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey62 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey63 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey64 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey65 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey66 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey67 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey68 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey69 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey7 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey70 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey71 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey72 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey73 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey74 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey75 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey76 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey77 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey78 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey79 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey8 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey80 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey81 FOREIGN KEY (userid) REFERENCES public.users(id);


--
-- Name: comments comments_userid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey82 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey83 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey84 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey85 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: comments comments_userid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey9 FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directors directors_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey1 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey10 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey100 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey101 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey102 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey103 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey104 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey105 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey106 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey107 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey108 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey109 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey11 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey110 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey111 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey112 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey113 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey114 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey115 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey116 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey117 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey118 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey119 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey12 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey120 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey121 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey122 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey123 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey124 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey125 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey126 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey127 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey128 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey129 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey13 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey130 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey131 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey132 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey133 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey134 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey135 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey136 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey137 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey138 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey139 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey14 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey140 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey141 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey142 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey143 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey144 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey145 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey146 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey147 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey148 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey149 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey15 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey150 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey151 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey152 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey153 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey154 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey155 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey156 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey157 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey158 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey159 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey16 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey160 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey161 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey162 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey163 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey164 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey165 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey166 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey167 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey168 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey169 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey17 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey170 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey171 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey172 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey173 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey174 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey175 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey176 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey177 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey178 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey18 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey19 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey2 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey20 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey21 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey22 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey23 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey24 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey25 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey26 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey27 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey28 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey29 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey3 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey30 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey31 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey32 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey33 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey34 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey35 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey36 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey37 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey38 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey39 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey4 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey40 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey41 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey42 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey43 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey44 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey45 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey46 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey47 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey48 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey49 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey5 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey50 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey51 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey52 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey53 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey54 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey55 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey56 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey57 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey58 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey59 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey6 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey60 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey61 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey62 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey63 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey64 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey65 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey66 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey67 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey68 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey69 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey7 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey70 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey71 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey72 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey73 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey74 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey75 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey76 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey77 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey78 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey79 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey8 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey80 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey81 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey82 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey83 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey84 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey85 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey86 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey87 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey88 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey89 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey9 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey90 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey91 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey92 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey93 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey94 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey95 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey96 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey97 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey98 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: directors directors_countryid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_countryid_fkey99 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey1 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey10 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey100 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey101 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey102 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey103 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey104 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey105 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey106 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey107 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey108 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey109 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey11 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey110 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey111 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey112 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey113 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey114 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey115 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey116 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey117 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey118 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey119 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey12 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey120 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey121 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey122 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey123 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey124 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey125 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey126 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey127 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey128 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey129 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey13 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey130 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey131 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey132 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey133 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey134 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey135 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey136 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey137 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey138 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey139 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey14 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey140 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey141 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey142 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey143 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey144 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey145 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey146 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey147 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey148 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey149 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey15 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey150 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey151 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey152 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey153 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey154 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey155 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey156 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey157 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey158 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey159 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey16 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey160 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey161 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey162 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey163 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey164 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey165 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey166 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey167 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey168 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey169 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey17 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey170 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey171 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey172 FOREIGN KEY (actorid) REFERENCES public.actors(id);


--
-- Name: movie_actor movie_actor_actorid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey173 FOREIGN KEY (actorid) REFERENCES public.actors(id);


--
-- Name: movie_actor movie_actor_actorid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey174 FOREIGN KEY (actorid) REFERENCES public.actors(id);


--
-- Name: movie_actor movie_actor_actorid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey175 FOREIGN KEY (actorid) REFERENCES public.actors(id);


--
-- Name: movie_actor movie_actor_actorid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey176 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey177 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey18 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey19 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey2 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey20 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey21 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey22 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey23 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey24 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey25 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey26 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey27 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey28 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey29 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey3 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey30 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey31 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey32 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey33 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey34 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey35 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey36 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey37 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey38 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey39 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey4 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey40 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey41 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey42 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey43 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey44 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey45 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey46 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey47 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey48 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey49 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey5 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey50 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey51 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey52 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey53 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey54 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey55 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey56 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey57 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey58 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey59 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey6 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey60 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey61 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey62 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey63 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey64 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey65 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey66 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey67 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey68 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey69 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey7 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey70 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey71 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey72 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey73 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey74 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey75 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey76 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey77 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey78 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey79 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey8 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey80 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey81 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey82 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey83 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey84 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey85 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey86 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey87 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey88 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey89 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey9 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey90 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey91 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey92 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey93 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey94 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey95 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey96 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey97 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey98 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_actorid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_actorid_fkey99 FOREIGN KEY (actorid) REFERENCES public.actors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey1 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey10 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey100 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey101 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey102 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey103 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey104 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey105 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey106 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey107 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey108 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey109 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey11 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey110 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey111 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey112 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey113 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey114 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey115 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey116 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey117 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey118 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey119 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey12 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey120 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey121 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey122 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey123 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey124 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey125 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey126 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey127 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey128 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey129 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey13 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey130 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey131 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey132 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey133 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey134 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey135 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey136 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey137 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey138 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey139 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey14 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey140 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey141 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey142 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey143 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey144 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey145 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey146 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey147 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey148 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey149 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey15 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey150 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey151 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey152 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey153 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey154 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey155 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey156 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey157 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey158 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey159 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey16 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey160 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey161 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey162 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey163 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey164 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey165 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey166 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey167 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey168 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey169 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey17 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey170 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey171 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey172 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_actor movie_actor_movieid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey173 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_actor movie_actor_movieid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey174 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_actor movie_actor_movieid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey175 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_actor movie_actor_movieid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey176 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey177 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey18 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey19 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey2 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey20 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey21 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey22 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey23 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey24 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey25 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey26 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey27 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey28 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey29 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey3 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey30 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey31 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey32 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey33 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey34 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey35 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey36 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey37 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey38 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey39 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey4 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey40 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey41 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey42 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey43 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey44 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey45 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey46 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey47 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey48 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey49 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey5 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey50 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey51 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey52 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey53 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey54 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey55 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey56 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey57 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey58 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey59 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey6 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey60 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey61 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey62 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey63 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey64 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey65 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey66 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey67 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey68 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey69 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey7 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey70 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey71 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey72 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey73 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey74 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey75 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey76 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey77 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey78 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey79 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey8 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey80 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey81 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey82 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey83 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey84 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey85 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey86 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey87 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey88 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey89 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey9 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey90 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey91 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey92 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey93 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey94 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey95 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey96 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey97 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey98 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_actor movie_actor_movieid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actor
    ADD CONSTRAINT movie_actor_movieid_fkey99 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey1 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey10 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey100 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey101 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey102 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey103 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey104 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey105 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey106 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey107 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey108 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey109 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey11 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey110 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey111 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey112 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey113 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey114 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey115 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey116 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey117 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey118 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey119 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey12 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey120 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey121 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey122 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey123 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey124 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey125 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey126 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey127 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey128 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey129 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey13 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey130 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey131 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey132 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey133 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey134 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey135 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey136 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey137 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey138 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey139 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey14 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey140 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey141 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey142 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey143 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey144 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey145 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey146 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey147 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey148 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey149 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey15 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey150 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey151 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey152 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey153 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey154 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey155 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey156 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey157 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey158 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey159 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey16 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey160 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey161 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey162 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey163 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey164 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey165 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey166 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey167 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey168 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey169 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey17 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey170 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey171 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey172 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey173 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey174 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey175 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey176 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey177 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey178 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey179 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey18 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey180 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey181 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey182 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey183 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey184 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey185 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey186 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey187 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey188 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey189 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey19 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey190 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey191; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey191 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey192; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey192 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey193; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey193 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey194; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey194 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey195; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey195 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey196; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey196 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey197; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey197 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey198; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey198 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey199; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey199 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey2 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey20 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey200 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey201; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey201 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey202; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey202 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey203; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey203 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey204; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey204 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey205; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey205 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey206; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey206 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey207; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey207 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey208; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey208 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey209; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey209 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey21 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey210; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey210 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey211; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey211 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey212; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey212 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey213; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey213 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey214; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey214 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey215; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey215 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey216; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey216 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey217; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey217 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey218; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey218 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey219; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey219 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey22 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey220; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey220 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey221 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey222; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey222 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey223; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey223 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey224; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey224 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey225; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey225 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey226; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey226 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey227; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey227 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey228; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey228 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey229; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey229 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey23 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey230; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey230 FOREIGN KEY (availid) REFERENCES public.availabilities(id);


--
-- Name: movie_availabilities movie_availabilities_availid_fkey231; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey231 FOREIGN KEY (availid) REFERENCES public.availabilities(id);


--
-- Name: movie_availabilities movie_availabilities_availid_fkey232; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey232 FOREIGN KEY (availid) REFERENCES public.availabilities(id);


--
-- Name: movie_availabilities movie_availabilities_availid_fkey233; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey233 FOREIGN KEY (availid) REFERENCES public.availabilities(id);


--
-- Name: movie_availabilities movie_availabilities_availid_fkey234; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey234 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey235; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey235 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey24 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey25 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey26 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey27 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey28 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey29 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey3 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey30 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey31 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey32 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey33 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey34 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey35 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey36 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey37 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey38 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey39 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey4 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey40 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey41 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey42 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey43 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey44 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey45 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey46 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey47 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey48 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey49 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey5 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey50 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey51 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey52 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey53 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey54 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey55 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey56 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey57 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey58 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey59 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey6 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey60 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey61 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey62 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey63 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey64 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey65 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey66 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey67 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey68 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey69 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey7 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey70 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey71 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey72 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey73 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey74 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey75 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey76 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey77 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey78 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey79 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey8 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey80 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey81 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey82 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey83 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey84 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey85 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey86 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey87 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey88 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey89 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey9 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey90 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey91 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey92 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey93 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey94 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey95 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey96 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey97 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey98 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_availid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_availid_fkey99 FOREIGN KEY (availid) REFERENCES public.availabilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey1 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey10 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey100 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey101 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey102 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey103 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey104 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey105 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey106 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey107 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey108 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey109 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey11 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey110 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey111 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey112 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey113 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey114 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey115 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey116 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey117 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey118 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey119 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey12 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey120 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey121 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey122 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey123 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey124 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey125 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey126 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey127 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey128 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey129 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey13 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey130 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey131 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey132 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey133 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey134 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey135 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey136 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey137 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey138 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey139 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey14 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey140 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey141 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey142 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey143 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey144 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey145 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey146 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey147 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey148 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey149 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey15 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey150 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey151 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey152 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey153 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey154 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey155 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey156 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey157 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey158 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey159 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey16 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey160 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey161 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey162 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey163 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey164 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey165 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey166 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey167 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey168 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey169 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey17 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey170 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey171 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey172 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey173 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey174 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey175 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey176 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey177 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey178 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey179 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey18 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey180 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey181 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey182 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey183 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey184 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey185 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey186 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey187 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey188 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey189 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey19 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey190 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey191; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey191 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey192; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey192 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey193; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey193 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey194; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey194 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey195; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey195 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey196; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey196 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey197; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey197 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey198; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey198 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey199; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey199 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey2 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey20 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey200 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey201; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey201 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey202; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey202 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey203; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey203 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey204; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey204 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey205; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey205 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey206; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey206 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey207; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey207 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey208; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey208 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey209; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey209 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey21 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey210; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey210 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey211; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey211 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey212; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey212 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey213; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey213 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey214; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey214 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey215; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey215 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey216; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey216 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey217; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey217 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey218; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey218 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey219; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey219 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey22 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey220; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey220 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey221 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey222; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey222 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey223; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey223 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey224; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey224 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey225; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey225 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey226; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey226 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey227; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey227 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey228; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey228 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey229; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey229 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey23 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey230; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey230 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey231; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey231 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey232; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey232 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey233; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey233 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey234; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey234 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey235; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey235 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey24 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey25 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey26 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey27 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey28 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey29 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey3 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey30 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey31 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey32 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey33 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey34 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey35 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey36 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey37 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey38 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey39 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey4 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey40 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey41 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey42 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey43 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey44 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey45 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey46 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey47 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey48 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey49 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey5 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey50 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey51 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey52 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey53 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey54 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey55 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey56 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey57 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey58 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey59 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey6 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey60 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey61 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey62 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey63 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey64 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey65 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey66 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey67 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey68 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey69 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey7 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey70 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey71 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey72 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey73 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey74 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey75 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey76 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey77 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey78 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey79 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey8 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey80 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey81 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey82 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey83 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey84 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey85 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey86 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey87 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey88 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey89 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey9 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey90 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey91 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey92 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey93 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey94 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey95 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey96 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey97 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey98 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_availabilities movie_availabilities_movieid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_availabilities
    ADD CONSTRAINT movie_availabilities_movieid_fkey99 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey1 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey10 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey100 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey101 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey102 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey103 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey104 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey105 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey106 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey107 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey108 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey109 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey11 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey110 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey111 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey112 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey113 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey114 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey115 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey116 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey117 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey118 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey119 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey12 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey120 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey121 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey122 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey123 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey124 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey125 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey126 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey127 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey128 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey129 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey13 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey130 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey131 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey132 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey133 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey134 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey135 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey136 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey137 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey138 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey139 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey14 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey140 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey141 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey142 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey143 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey144 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey145 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey146 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey147 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey148 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey149 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey15 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey150 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey151 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey152 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey153 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey154 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey155 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey156 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey157 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey158 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey159 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey16 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey160 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey161 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey162 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey163 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey164 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey165 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey166 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey167 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey168 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey169 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey17 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey170 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey171 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey172 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey173 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey174 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey175 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey176 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey177 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey178 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey179 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey18 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey180 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey181 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey182 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey183 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey184 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey185 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey186 FOREIGN KEY (awardid) REFERENCES public.awards(id);


--
-- Name: movie_award movie_award_awardid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey187 FOREIGN KEY (awardid) REFERENCES public.awards(id);


--
-- Name: movie_award movie_award_awardid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey188 FOREIGN KEY (awardid) REFERENCES public.awards(id);


--
-- Name: movie_award movie_award_awardid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey189 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey19 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey190 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey2 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey20 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey21 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey22 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey23 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey24 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey25 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey26 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey27 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey28 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey29 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey3 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey30 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey31 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey32 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey33 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey34 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey35 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey36 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey37 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey38 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey39 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey4 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey40 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey41 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey42 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey43 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey44 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey45 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey46 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey47 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey48 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey49 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey5 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey50 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey51 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey52 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey53 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey54 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey55 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey56 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey57 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey58 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey59 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey6 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey60 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey61 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey62 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey63 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey64 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey65 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey66 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey67 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey68 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey69 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey7 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey70 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey71 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey72 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey73 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey74 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey75 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey76 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey77 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey78 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey79 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey8 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey80 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey81 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey82 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey83 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey84 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey85 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey86 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey87 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey88 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey89 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey9 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey90 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey91 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey92 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey93 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey94 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey95 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey96 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey97 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey98 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_awardid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_awardid_fkey99 FOREIGN KEY (awardid) REFERENCES public.awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey1 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey10 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey100 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey101 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey102 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey103 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey104 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey105 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey106 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey107 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey108 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey109 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey11 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey110 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey111 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey112 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey113 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey114 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey115 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey116 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey117 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey118 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey119 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey12 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey120 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey121 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey122 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey123 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey124 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey125 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey126 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey127 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey128 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey129 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey13 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey130 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey131 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey132 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey133 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey134 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey135 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey136 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey137 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey138 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey139 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey14 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey140 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey141 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey142 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey143 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey144 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey145 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey146 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey147 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey148 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey149 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey15 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey150 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey151 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey152 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey153 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey154 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey155 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey156 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey157 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey158 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey159 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey16 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey160 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey161 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey162 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey163 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey164 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey165 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey166 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey167 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey168 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey169 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey17 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey170 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey171 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey172 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey173 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey174 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey175 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey176 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey177 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey178 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey179 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey18 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey180 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey181 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey182 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey183 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey184 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey185 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey186 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_award movie_award_movieid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey187 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_award movie_award_movieid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey188 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_award movie_award_movieid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey189 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey19 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey190 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey2 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey20 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey21 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey22 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey23 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey24 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey25 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey26 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey27 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey28 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey29 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey3 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey30 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey31 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey32 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey33 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey34 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey35 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey36 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey37 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey38 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey39 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey4 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey40 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey41 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey42 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey43 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey44 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey45 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey46 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey47 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey48 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey49 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey5 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey50 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey51 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey52 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey53 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey54 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey55 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey56 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey57 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey58 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey59 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey6 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey60 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey61 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey62 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey63 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey64 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey65 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey66 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey67 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey68 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey69 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey7 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey70 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey71 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey72 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey73 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey74 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey75 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey76 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey77 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey78 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey79 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey8 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey80 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey81 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey82 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey83 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey84 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey85 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey86 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey87 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey88 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey89 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey9 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey90 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey91 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey92 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey93 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey94 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey95 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey96 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey97 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey98 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_award movie_award_movieid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_award
    ADD CONSTRAINT movie_award_movieid_fkey99 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey1 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey10 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey100 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey101 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey102 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey103 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey104 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey105 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey106 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey107 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey108 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey109 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey11 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey110 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey111 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey112 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey113 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey114 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey115 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey116 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey117 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey118 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey119 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey12 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey120 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey121 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey122 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey123 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey124 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey125 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey126 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey127 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey128 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey129 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey13 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey130 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey131 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey132 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey133 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey134 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey135 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey136 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey137 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey138 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey139 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey14 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey140 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey141 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey142 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey143 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey144 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey145 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey146 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey147 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey148 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey149 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey15 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey150 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey151 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey152 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey153 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey154 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey155 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey156 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey157 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey158 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey159 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey16 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey160 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey161 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey162 FOREIGN KEY (directorid) REFERENCES public.directors(id);


--
-- Name: movie_director movie_director_directorid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey163 FOREIGN KEY (directorid) REFERENCES public.directors(id);


--
-- Name: movie_director movie_director_directorid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey164 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey165 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey17 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey18 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey19 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey2 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey20 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey21 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey22 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey23 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey24 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey25 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey26 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey27 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey28 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey29 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey3 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey30 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey31 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey32 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey33 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey34 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey35 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey36 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey37 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey38 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey39 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey4 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey40 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey41 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey42 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey43 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey44 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey45 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey46 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey47 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey48 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey49 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey5 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey50 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey51 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey52 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey53 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey54 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey55 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey56 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey57 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey58 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey59 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey6 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey60 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey61 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey62 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey63 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey64 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey65 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey66 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey67 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey68 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey69 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey7 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey70 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey71 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey72 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey73 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey74 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey75 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey76 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey77 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey78 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey79 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey8 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey80 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey81 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey82 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey83 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey84 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey85 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey86 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey87 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey88 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey89 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey9 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey90 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey91 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey92 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey93 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey94 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey95 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey96 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey97 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey98 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_directorid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_directorid_fkey99 FOREIGN KEY (directorid) REFERENCES public.directors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey1 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey10 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey100 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey101 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey102 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey103 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey104 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey105 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey106 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey107 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey108 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey109 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey11 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey110 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey111 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey112 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey113 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey114 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey115 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey116 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey117 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey118 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey119 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey12 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey120 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey121 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey122 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey123 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey124 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey125 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey126 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey127 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey128 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey129 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey13 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey130 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey131 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey132 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey133 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey134 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey135 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey136 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey137 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey138 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey139 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey14 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey140 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey141 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey142 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey143 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey144 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey145 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey146 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey147 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey148 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey149 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey15 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey150 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey151 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey152 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey153 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey154 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey155 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey156 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey157 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey158 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey159 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey16 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey160 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey161 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey162 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_director movie_director_movieid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey163 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_director movie_director_movieid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey164 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey165 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey17 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey18 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey19 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey2 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey20 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey21 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey22 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey23 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey24 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey25 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey26 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey27 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey28 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey29 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey3 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey30 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey31 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey32 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey33 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey34 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey35 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey36 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey37 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey38 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey39 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey4 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey40 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey41 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey42 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey43 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey44 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey45 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey46 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey47 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey48 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey49 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey5 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey50 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey51 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey52 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey53 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey54 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey55 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey56 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey57 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey58 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey59 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey6 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey60 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey61 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey62 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey63 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey64 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey65 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey66 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey67 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey68 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey69 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey7 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey70 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey71 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey72 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey73 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey74 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey75 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey76 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey77 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey78 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey79 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey8 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey80 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey81 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey82 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey83 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey84 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey85 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey86 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey87 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey88 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey89 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey9 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey90 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey91 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey92 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey93 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey94 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey95 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey96 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey97 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey98 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_director movie_director_movieid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_director
    ADD CONSTRAINT movie_director_movieid_fkey99 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey1 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey10 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey100 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey101 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey102 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey103 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey104 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey105 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey106 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey107 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey108 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey109 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey11 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey110 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey111 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey112 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey113 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey114 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey115 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey116 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey117 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey118 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey119 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey12 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey120 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey121 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey122 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey123 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey124 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey125 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey126 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey127 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey128 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey129 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey13 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey130 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey131 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey132 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey133 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey134 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey135 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey136 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey137 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey138 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey139 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey14 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey140 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey141 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey142 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey143 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey144 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey145 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey146 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey147 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey148 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey149 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey15 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey150 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey151 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey152 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey153 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey154 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey155 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey156 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey157 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey158 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey159 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey16 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey160 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey161 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey162 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey163 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey164 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey165 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey166 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey167 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey168 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey169 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey17 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey170 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey171 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey172 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey173 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey174 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey175 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey176 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey177 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey178 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey179 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey18 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey180 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey181 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey182 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey183 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey184 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey185 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey186 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey187 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey188 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey189 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey19 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey190 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey191; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey191 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey192; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey192 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey193; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey193 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey194; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey194 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey195; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey195 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey196; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey196 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey197; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey197 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey198; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey198 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey199; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey199 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey2 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey20 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey200 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey201; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey201 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey202; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey202 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey203; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey203 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey204; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey204 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey205; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey205 FOREIGN KEY (genreid) REFERENCES public.genres(id);


--
-- Name: movie_genre movie_genre_genreid_fkey206; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey206 FOREIGN KEY (genreid) REFERENCES public.genres(id);


--
-- Name: movie_genre movie_genre_genreid_fkey207; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey207 FOREIGN KEY (genreid) REFERENCES public.genres(id);


--
-- Name: movie_genre movie_genre_genreid_fkey208; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey208 FOREIGN KEY (genreid) REFERENCES public.genres(id);


--
-- Name: movie_genre movie_genre_genreid_fkey209; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey209 FOREIGN KEY (genreid) REFERENCES public.genres(id);


--
-- Name: movie_genre movie_genre_genreid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey21 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey210; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey210 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey211; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey211 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey22 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey23 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey24 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey25 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey26 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey27 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey28 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey29 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey3 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey30 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey31 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey32 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey33 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey34 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey35 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey36 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey37 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey38 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey39 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey4 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey40 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey41 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey42 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey43 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey44 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey45 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey46 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey47 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey48 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey49 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey5 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey50 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey51 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey52 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey53 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey54 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey55 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey56 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey57 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey58 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey59 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey6 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey60 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey61 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey62 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey63 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey64 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey65 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey66 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey67 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey68 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey69 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey7 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey70 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey71 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey72 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey73 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey74 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey75 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey76 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey77 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey78 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey79 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey8 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey80 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey81 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey82 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey83 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey84 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey85 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey86 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey87 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey88 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey89 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey9 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey90 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey91 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey92 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey93 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey94 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey95 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey96 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey97 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey98 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_genreid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_genreid_fkey99 FOREIGN KEY (genreid) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey1 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey10 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey100 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey101 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey102 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey103 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey104 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey105 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey106 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey107 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey108 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey109 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey11 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey110 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey111 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey112 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey113 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey114 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey115 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey116 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey117 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey118 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey119 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey12 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey120 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey121 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey122 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey123 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey124 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey125 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey126 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey127 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey128 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey129 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey13 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey130 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey131 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey132 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey133 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey134 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey135 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey136 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey137 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey138 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey139 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey14 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey140 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey141 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey142 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey143 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey144 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey145 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey146 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey147 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey148 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey149 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey15 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey150 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey151 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey152 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey153 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey154 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey155 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey156 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey157 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey158 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey159 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey16 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey160 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey161 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey162 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey163 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey164 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey165 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey166 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey167 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey168 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey169 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey17 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey170 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey171 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey172 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey173 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey174 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey175 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey176 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey177 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey178 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey179 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey18 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey180 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey181 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey182 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey183 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey184 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey185 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey186 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey187 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey188 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey189 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey19 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey190 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey191; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey191 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey192; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey192 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey193; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey193 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey194; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey194 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey195; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey195 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey196; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey196 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey197; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey197 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey198; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey198 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey199; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey199 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey2 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey20 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey200 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey201; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey201 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey202; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey202 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey203; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey203 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey204; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey204 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey205; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey205 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_genre movie_genre_movieid_fkey206; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey206 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_genre movie_genre_movieid_fkey207; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey207 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_genre movie_genre_movieid_fkey208; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey208 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_genre movie_genre_movieid_fkey209; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey209 FOREIGN KEY (movieid) REFERENCES public.movies(id);


--
-- Name: movie_genre movie_genre_movieid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey21 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey210; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey210 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey211; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey211 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey22 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey23 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey24 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey25 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey26 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey27 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey28 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey29 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey3 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey30 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey31 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey32 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey33 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey34 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey35 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey36 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey37 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey38 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey39 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey4 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey40 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey41 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey42 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey43 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey44 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey45 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey46 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey47 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey48 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey49 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey5 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey50 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey51 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey52 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey53 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey54 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey55 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey56 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey57 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey58 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey59 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey6 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey60 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey61 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey62 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey63 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey64 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey65 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey66 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey67 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey68 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey69 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey7 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey70 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey71 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey72 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey73 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey74 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey75 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey76 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey77 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey78 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey79 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey8 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey80 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey81 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey82 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey83 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey84 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey85 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey86 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey87 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey88 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey89 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey9 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey90 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey91 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey92 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey93 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey94 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey95 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey96 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey97 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey98 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie_genre movie_genre_movieid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_movieid_fkey99 FOREIGN KEY (movieid) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movies movies_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey1 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey10 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey100 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey101 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey102; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey102 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey103; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey103 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey104; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey104 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey105 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey106; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey106 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey107 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey108; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey108 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey109; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey109 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey11 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey110 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey111 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey112 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey113; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey113 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey114 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey115; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey115 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey116; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey116 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey117; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey117 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey118; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey118 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey119 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey12 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey120 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey121 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey122; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey122 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey123 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey124; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey124 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey125 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey126; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey126 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey127; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey127 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey128; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey128 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey129 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey13 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey130; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey130 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey131; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey131 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey132 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey133; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey133 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey134; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey134 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey135 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey136 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey137 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey138; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey138 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey139 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey14 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey140 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey141; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey141 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey142; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey142 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey143; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey143 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey144; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey144 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey145; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey145 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey146; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey146 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey147; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey147 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey148; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey148 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey149 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey15 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey150 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey151 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey152; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey152 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey153 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey154; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey154 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey155; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey155 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey156; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey156 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey157; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey157 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey158; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey158 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey159; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey159 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey16 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey160; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey160 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey161; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey161 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey162; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey162 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey163; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey163 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey164; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey164 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey165 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey166; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey166 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey167 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey168 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey169; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey169 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey17 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey170 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey171 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey172; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey172 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey173; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey173 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey174; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey174 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey175; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey175 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey176; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey176 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey177; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey177 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey178; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey178 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey179; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey179 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey18 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey180; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey180 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey181; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey181 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey182; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey182 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey183; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey183 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey184; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey184 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey185; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey185 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey186; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey186 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey187; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey187 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey188 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey189; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey189 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey19 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey190; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey190 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey191; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey191 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey192; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey192 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey193; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey193 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey194; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey194 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey195; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey195 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey196; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey196 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey197; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey197 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey198; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey198 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey199; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey199 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey2 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey20 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey200 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey201; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey201 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey202; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey202 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey203; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey203 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey204; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey204 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey205; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey205 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey206; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey206 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey207; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey207 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey208; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey208 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey209; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey209 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey21 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey210; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey210 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey211; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey211 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey212; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey212 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey213; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey213 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey214; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey214 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey215; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey215 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey216; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey216 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey217; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey217 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey218; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey218 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey219; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey219 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey22 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey220; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey220 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey221; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey221 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey222; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey222 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey223; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey223 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey224; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey224 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey225; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey225 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey226; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey226 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey227; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey227 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey228; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey228 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey229; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey229 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey23 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey230; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey230 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey231; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey231 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey232; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey232 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey233; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey233 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey234; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey234 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey235; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey235 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey236; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey236 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey237; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey237 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey238; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey238 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey239; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey239 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey24 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey240; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey240 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey241; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey241 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey242; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey242 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey243; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey243 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey244; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey244 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey245; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey245 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey246; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey246 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey247; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey247 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey248; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey248 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey249; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey249 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey25 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey250; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey250 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey251; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey251 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey252; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey252 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey253; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey253 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey254; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey254 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey255; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey255 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey256; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey256 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey257; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey257 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey258; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey258 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey259; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey259 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey26 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey260; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey260 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey261; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey261 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey262; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey262 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey263; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey263 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey264; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey264 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey265; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey265 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey266; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey266 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey267; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey267 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey268; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey268 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey269; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey269 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey27 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey270; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey270 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey271; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey271 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey272; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey272 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey273; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey273 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey274; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey274 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey275; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey275 FOREIGN KEY (countryid) REFERENCES public.countries(id);


--
-- Name: movies movies_countryid_fkey276; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey276 FOREIGN KEY (countryid) REFERENCES public.countries(id);


--
-- Name: movies movies_countryid_fkey277; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey277 FOREIGN KEY (countryid) REFERENCES public.countries(id);


--
-- Name: movies movies_countryid_fkey278; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey278 FOREIGN KEY (countryid) REFERENCES public.countries(id);


--
-- Name: movies movies_countryid_fkey279; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey279 FOREIGN KEY (countryid) REFERENCES public.countries(id);


--
-- Name: movies movies_countryid_fkey28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey28 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey280; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey280 FOREIGN KEY (countryid) REFERENCES public.countries(id);


--
-- Name: movies movies_countryid_fkey281; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey281 FOREIGN KEY (countryid) REFERENCES public.countries(id);


--
-- Name: movies movies_countryid_fkey282; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey282 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey283; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey283 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey284; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey284 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey285; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey285 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey286; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey286 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey287; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey287 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey29 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey3 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey30 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey31 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey32 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey33 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey34 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey35 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey36 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey37 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey38 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey39 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey4 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey40 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey41 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey42 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey43 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey44 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey45 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey46 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey47 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey48 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey49 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey5 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey50 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey51 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey52 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey53 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey54; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey54 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey55 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey56; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey56 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey57 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey58; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey58 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey59 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey6 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey60; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey60 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey61 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey62 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey63; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey63 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey64 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey65 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey66 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey67 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey68 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey69 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey7 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey70; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey70 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey71 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey72 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey73 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey74; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey74 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey75; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey75 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey76 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey77 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey78 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey79 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey8 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey80 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey81; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey81 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey82; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey82 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey83 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey84 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey85 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey86 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey87; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey87 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey88 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey89 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey9 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey90 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey91 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey92; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey92 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey93; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey93 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey94 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey95 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey96 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey97; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey97 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey98 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- Name: movies movies_countryid_fkey99; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_countryid_fkey99 FOREIGN KEY (countryid) REFERENCES public.countries(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

