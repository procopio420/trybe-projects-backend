--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE "new-trybe";
DROP DATABASE "recipes-app";




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md543225d7c19e7b7bd74e416fe9566a7f9';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "new-trybe" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

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

--
-- Name: new-trybe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "new-trybe" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE "new-trybe" OWNER TO postgres;

\connect -reuse-previous=on "dbname='new-trybe'"

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
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    class_id integer NOT NULL,
    class character varying(50) NOT NULL
);


ALTER TABLE public.class OWNER TO postgres;

--
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.class_id_seq OWNER TO postgres;

--
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_id_seq OWNED BY public.class.class_id;


--
-- Name: code_review_pair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.code_review_pair (
    code_review_pair_id integer NOT NULL,
    student1 character varying(256) NOT NULL,
    student2 character varying(256) NOT NULL,
    repository_id integer NOT NULL,
    url_student_2 character varying(255),
    avatar_student_1 character varying(255),
    avatar_student_2 character varying(255),
    reviewers_student_2 character varying(255),
    code_review_done boolean DEFAULT false NOT NULL
);


ALTER TABLE public.code_review_pair OWNER TO postgres;

--
-- Name: code_review_pair_code_review_pair_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.code_review_pair_code_review_pair_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.code_review_pair_code_review_pair_id_seq OWNER TO postgres;

--
-- Name: code_review_pair_code_review_pair_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.code_review_pair_code_review_pair_id_seq OWNED BY public.code_review_pair.code_review_pair_id;


--
-- Name: repository; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repository (
    repository_id integer NOT NULL,
    project_name character varying(100) NOT NULL,
    repo_url character varying(256) NOT NULL,
    github_repo_id integer NOT NULL,
    class_id integer NOT NULL
);


ALTER TABLE public.repository OWNER TO postgres;

--
-- Name: repository_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repository_repository_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repository_repository_id_seq OWNER TO postgres;

--
-- Name: repository_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repository_repository_id_seq OWNED BY public.repository.repository_id;


--
-- Name: class class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class ALTER COLUMN class_id SET DEFAULT nextval('public.class_id_seq'::regclass);


--
-- Name: code_review_pair code_review_pair_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_review_pair ALTER COLUMN code_review_pair_id SET DEFAULT nextval('public.code_review_pair_code_review_pair_id_seq'::regclass);


--
-- Name: repository repository_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository ALTER COLUMN repository_id SET DEFAULT nextval('public.repository_repository_id_seq'::regclass);


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class (class_id, class) FROM stdin;
1	sd-01
2	sd-04
3	sd-02
4	sd-05
\.


--
-- Data for Name: code_review_pair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.code_review_pair (code_review_pair_id, student1, student2, repository_id, url_student_2, avatar_student_1, avatar_student_2, reviewers_student_2, code_review_done) FROM stdin;
1	jessica-tavares	AliceAAtalla	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/13	https://avatars0.githubusercontent.com/u/62182603?v=4	https://avatars1.githubusercontent.com/u/62206355?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/13/comments	f
2	juniomelos	rangel20	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/12	https://avatars1.githubusercontent.com/u/60393498?v=4	https://avatars0.githubusercontent.com/u/29238500?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/12/comments	f
3	orlando-messias	deboracosilveira	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/15	https://avatars3.githubusercontent.com/u/52613749?v=4	https://avatars3.githubusercontent.com/u/59754058?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/15/comments	f
4	leandromarten1	orlando-messias	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/17	https://avatars1.githubusercontent.com/u/62161776?v=4	https://avatars3.githubusercontent.com/u/52613749?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/17/comments	f
5	HenriqueBaetaLeite	leandromarten1	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/27	https://avatars3.githubusercontent.com/u/60404874?v=4	https://avatars1.githubusercontent.com/u/62161776?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/27/comments	f
6	frederico-campello	HenriqueBaetaLeite	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/20	https://avatars2.githubusercontent.com/u/62222372?v=4	https://avatars3.githubusercontent.com/u/60404874?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/20/comments	f
7	AliceAAtalla	procopio420	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/8	https://avatars1.githubusercontent.com/u/62206355?v=4	https://avatars1.githubusercontent.com/u/48629624?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/8/comments	f
8	EduardoSantosF	jessica-tavares	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/28	https://avatars1.githubusercontent.com/u/62265259?v=4	https://avatars0.githubusercontent.com/u/62182603?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/28/comments	f
9	rangel20	frederico-campello	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/16	https://avatars0.githubusercontent.com/u/29238500?v=4	https://avatars2.githubusercontent.com/u/62222372?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/16/comments	f
10	deboracosilveira	juniomelos	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/5	https://avatars3.githubusercontent.com/u/59754058?v=4	https://avatars1.githubusercontent.com/u/60393498?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/5/comments	f
11	procopio420	EduardoSantosF	1	https://github.com/tryber/sd-04-project-starwars-datatable-hooks/pull/23	https://avatars1.githubusercontent.com/u/48629624?v=4	https://avatars1.githubusercontent.com/u/62265259?v=4	https://api.github.com/repos/tryber/sd-04-project-starwars-datatable-hooks/pulls/23/comments	f
12	igorgbr	samueap	3	https://github.com/tryber/sd-04-block11-project-jest/pull/25	https://avatars3.githubusercontent.com/u/33362898?v=4	https://avatars2.githubusercontent.com/u/62288803?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/25/comments	f
13	fogo5000	caiolmf	3	https://github.com/tryber/sd-04-block11-project-jest/pull/53	https://avatars0.githubusercontent.com/u/28369643?v=4	https://avatars3.githubusercontent.com/u/6031746?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/53/comments	f
15	caiolmf	cacobribeiro	3	https://github.com/tryber/sd-04-block11-project-jest/pull/29	https://avatars3.githubusercontent.com/u/6031746?v=4	https://avatars0.githubusercontent.com/u/62265253?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/29/comments	f
17	saturnian99	danielPantalena	3	https://github.com/tryber/sd-04-block11-project-jest/pull/19	https://avatars0.githubusercontent.com/u/60621615?v=4	https://avatars0.githubusercontent.com/u/60634194?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/19/comments	f
18	pedrotpo	anicioalexandre	3	https://github.com/tryber/sd-04-block11-project-jest/pull/35	https://avatars3.githubusercontent.com/u/24573924?v=4	https://avatars3.githubusercontent.com/u/58861037?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/35/comments	f
22	DanielLMiranda	DiegoCampos1	3	https://github.com/tryber/sd-04-block11-project-jest/pull/24	https://avatars0.githubusercontent.com/u/55032792?v=4	https://avatars3.githubusercontent.com/u/62223980?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/24/comments	f
24	josiasviveiro	fabioladeiro	3	https://github.com/tryber/sd-04-block11-project-jest/pull/45	https://avatars1.githubusercontent.com/u/62304302?v=4	https://avatars2.githubusercontent.com/u/62265924?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/45/comments	f
27	Kaecio	Tiago-ers	3	https://github.com/tryber/sd-04-block11-project-jest/pull/40	https://avatars3.githubusercontent.com/u/56613892?v=4	https://avatars3.githubusercontent.com/u/62243260?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/40/comments	f
31	mathieubouhelier	DaniloSSousa	3	https://github.com/tryber/sd-04-block11-project-jest/pull/44	https://avatars0.githubusercontent.com/u/62220320?v=4	https://avatars2.githubusercontent.com/u/62265855?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/44/comments	f
34	Tiago-ers	pedrotpo	3	https://github.com/tryber/sd-04-block11-project-jest/pull/28	https://avatars3.githubusercontent.com/u/62243260?v=4	https://avatars3.githubusercontent.com/u/24573924?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/28/comments	f
32	Ronan-Fernandes	yoshidalucas92	3	https://github.com/tryber/sd-04-block11-project-jest/pull/13	https://avatars2.githubusercontent.com/u/62265281?v=4	https://avatars3.githubusercontent.com/u/62261329?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/13/comments	f
33	DiegoCampos1	DanielLMiranda	3	https://github.com/tryber/sd-04-block11-project-jest/pull/27	https://avatars3.githubusercontent.com/u/62223980?v=4	https://avatars0.githubusercontent.com/u/55032792?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/27/comments	f
36	danielPantalena	mathieubouhelier	3	https://github.com/tryber/sd-04-block11-project-jest/pull/6	https://avatars0.githubusercontent.com/u/60634194?v=4	https://avatars0.githubusercontent.com/u/62220320?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/6/comments	f
37	yoshidalucas92	joaosoutto	3	https://github.com/tryber/sd-04-block11-project-jest/pull/7	https://avatars3.githubusercontent.com/u/62261329?v=4	https://avatars0.githubusercontent.com/u/60697947?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/7/comments	f
38	joaosoutto	fogo5000	3	https://github.com/tryber/sd-04-block11-project-jest/pull/31	https://avatars0.githubusercontent.com/u/60697947?v=4	https://avatars0.githubusercontent.com/u/28369643?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/31/comments	f
40	anicioalexandre	Kaecio	3	https://github.com/tryber/sd-04-block11-project-jest/pull/41	https://avatars3.githubusercontent.com/u/58861037?v=4	https://avatars3.githubusercontent.com/u/56613892?v=4	https://api.github.com/repos/tryber/sd-04-block11-project-jest/pulls/41/comments	f
42	AlexLMitchell	preto115	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/27	https://avatars1.githubusercontent.com/u/64553900?v=4	https://avatars3.githubusercontent.com/u/64562701?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/27/comments	f
43	luialbeto	lucas11allan	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/5	https://avatars3.githubusercontent.com/u/61898388?v=4	https://avatars3.githubusercontent.com/u/64559186?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/5/comments	f
44	juliettebeaudet	AlexLMitchell	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/50	https://avatars3.githubusercontent.com/u/57507532?v=4	https://avatars1.githubusercontent.com/u/64553900?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/50/comments	f
45	lucas11allan	juliettebeaudet	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/10	https://avatars3.githubusercontent.com/u/64559186?v=4	https://avatars3.githubusercontent.com/u/57507532?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/10/comments	f
46	carlanakajuni	ldferrari	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/32	https://avatars1.githubusercontent.com/u/63618167?v=4	https://avatars1.githubusercontent.com/u/60831674?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/32/comments	f
47	FelipeVieira86	AndersonAGodoy	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/26	https://avatars0.githubusercontent.com/u/63760249?v=4	https://avatars1.githubusercontent.com/u/8939807?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/26/comments	f
48	MauSDJ	isabelmeister	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/34	https://avatars2.githubusercontent.com/u/64560578?v=4	https://avatars3.githubusercontent.com/u/60519893?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/34/comments	f
49	ldferrari	FelipeVieira86	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/8	https://avatars1.githubusercontent.com/u/60831674?v=4	https://avatars0.githubusercontent.com/u/63760249?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/8/comments	f
50	Lucadecastro	rafaelqleite	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/21	https://avatars1.githubusercontent.com/u/64559709?v=4	https://avatars1.githubusercontent.com/u/64554795?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/21/comments	f
51	rafaelqleite	LizzardMedeiros	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/29	https://avatars1.githubusercontent.com/u/64554795?v=4	https://avatars2.githubusercontent.com/u/20029072?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/29/comments	f
52	AndersonAGodoy	luialbeto	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/12	https://avatars1.githubusercontent.com/u/8939807?v=4	https://avatars3.githubusercontent.com/u/61898388?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/12/comments	f
53	isabelmeister	MauSDJ	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/24	https://avatars3.githubusercontent.com/u/60519893?v=4	https://avatars2.githubusercontent.com/u/64560578?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/24/comments	f
54	preto115	carlanakajuni	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/36	https://avatars3.githubusercontent.com/u/64562701?v=4	https://avatars1.githubusercontent.com/u/63618167?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/36/comments	f
55	LizzardMedeiros	Lucadecastro	5	https://github.com/tryber/sd-05-block8-project-zoo-functions/pull/40	https://avatars2.githubusercontent.com/u/20029072?v=4	https://avatars1.githubusercontent.com/u/64559709?v=4	https://api.github.com/repos/tryber/sd-05-block8-project-zoo-functions/pulls/40/comments	f
\.


--
-- Data for Name: repository; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repository (repository_id, project_name, repo_url, github_repo_id, class_id) FROM stdin;
1	sd-04-project-starwars-datatable-hooks	https://github.com/tryber/sd-04-project-starwars-datatable-hooks	282321139	2
2	sd-04-recipes-app-18	https://github.com/tryber/sd-04-recipes-app-18	283357677	2
3	sd-04-block11-project-jest	https://github.com/tryber/sd-04-block11-project-jest	267321663	2
4	sd-02-project-cookmaster-v2	https://github.com/tryber/sd-02-project-cookmaster-v2	279321380	3
5	sd-05-block8-project-zoo-functions	https://github.com/tryber/sd-05-block8-project-zoo-functions	273403493	4
\.


--
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 4, true);


--
-- Name: code_review_pair_code_review_pair_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.code_review_pair_code_review_pair_id_seq', 55, true);


--
-- Name: repository_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repository_repository_id_seq', 5, true);


--
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (class_id);


--
-- Name: code_review_pair code_review_pair_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_review_pair
    ADD CONSTRAINT code_review_pair_pkey PRIMARY KEY (code_review_pair_id);


--
-- Name: code_review_pair code_review_pair_student1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_review_pair
    ADD CONSTRAINT code_review_pair_student1_key UNIQUE (student1);


--
-- Name: code_review_pair code_review_pair_student2_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_review_pair
    ADD CONSTRAINT code_review_pair_student2_key UNIQUE (student2);


--
-- Name: repository repository_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository
    ADD CONSTRAINT repository_pkey PRIMARY KEY (repository_id);


--
-- Name: repository repository_project_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository
    ADD CONSTRAINT repository_project_name_key UNIQUE (project_name);


--
-- Name: repository repository_repo_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository
    ADD CONSTRAINT repository_repo_url_key UNIQUE (repo_url);


--
-- Name: repository class_repository_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository
    ADD CONSTRAINT class_repository_id_fkey FOREIGN KEY (class_id) REFERENCES public.class(class_id);


--
-- Name: code_review_pair repository_dupla_id_fkeyÏ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code_review_pair
    ADD CONSTRAINT "repository_dupla_id_fkeyÏ" FOREIGN KEY (repository_id) REFERENCES public.repository(repository_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "recipes-app" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

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

--
-- Name: recipes-app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "recipes-app" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE "recipes-app" OWNER TO postgres;

\connect -reuse-previous=on "dbname='recipes-app'"

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
-- Name: done_recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.done_recipes (
    recipe_id integer NOT NULL,
    recipe_type character varying(256) NOT NULL,
    recipe_area character varying(256),
    recipe_category character varying(256),
    recipe_alcoholic character varying(256),
    recipe_name character varying(256) NOT NULL,
    recipe_tags character varying(256),
    recipe_date character varying(256) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.done_recipes OWNER TO postgres;

--
-- Name: favorite_recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite_recipes (
    recipe_id integer NOT NULL,
    recipe_type character varying(256) NOT NULL,
    recipe_area character varying(256),
    recipe_category character varying(256),
    recipe_alcoholic character varying(256),
    recipe_name character varying(256) NOT NULL,
    recipe_image character varying(256) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.favorite_recipes OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_email character varying(256) NOT NULL,
    user_token character varying(256) NOT NULL,
    user_password character varying(256) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: done_recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.done_recipes (recipe_id, recipe_type, recipe_area, recipe_category, recipe_alcoholic, recipe_name, recipe_tags, recipe_date, user_id) FROM stdin;
\.


--
-- Data for Name: favorite_recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_recipes (recipe_id, recipe_type, recipe_area, recipe_category, recipe_alcoholic, recipe_name, recipe_image, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_email, user_token, user_password) FROM stdin;
\.


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_un UNIQUE (user_email);


--
-- Name: done_recipes user_done_fkeyÏ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.done_recipes
    ADD CONSTRAINT "user_done_fkeyÏ" FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: favorite_recipes user_favorite_fkeyÏ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_recipes
    ADD CONSTRAINT "user_favorite_fkeyÏ" FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

