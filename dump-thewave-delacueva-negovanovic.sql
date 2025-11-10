--
-- PostgreSQL database dump
--

\restrict qjZwsWVe9iobluRXny6Qyefb2HZVhiLEeh7fDmdkGpawNkQY7nu0fFqboPb3lPk

-- Dumped from database version 15.14 (Debian 15.14-0+deb12u1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-0+deb13u1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: delacuevapuert
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO delacuevapuert;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: delacuevapuert
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: album; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.album (
    idalbum integer NOT NULL,
    titre character varying(200) NOT NULL,
    dparution date,
    imcouverture bytea,
    descalbum text
);


ALTER TABLE public.album OWNER TO delacuevapuert;

--
-- Name: album_idalbum_seq; Type: SEQUENCE; Schema: public; Owner: delacuevapuert
--

CREATE SEQUENCE public.album_idalbum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.album_idalbum_seq OWNER TO delacuevapuert;

--
-- Name: album_idalbum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delacuevapuert
--

ALTER SEQUENCE public.album_idalbum_seq OWNED BY public.album.idalbum;


--
-- Name: appartient; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.appartient (
    idartiste integer NOT NULL,
    idgroupe integer NOT NULL,
    idrole integer NOT NULL,
    ddebut date NOT NULL,
    dfin date,
    CONSTRAINT datecoherente CHECK (((dfin IS NULL) OR (ddebut <= dfin)))
);


ALTER TABLE public.appartient OWNER TO delacuevapuert;

--
-- Name: artiste; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.artiste (
    idartiste integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100),
    nationalite character varying(100),
    dnaissance date,
    dmort date,
    imcouverture bytea,
    CONSTRAINT datecoherente CHECK (((dmort IS NULL) OR (dnaissance IS NULL) OR (dnaissance <= dmort)))
);


ALTER TABLE public.artiste OWNER TO delacuevapuert;

--
-- Name: artiste_idartiste_seq; Type: SEQUENCE; Schema: public; Owner: delacuevapuert
--

CREATE SEQUENCE public.artiste_idartiste_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artiste_idartiste_seq OWNER TO delacuevapuert;

--
-- Name: artiste_idartiste_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delacuevapuert
--

ALTER SEQUENCE public.artiste_idartiste_seq OWNED BY public.artiste.idartiste;


--
-- Name: compose; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.compose (
    idmorceau integer NOT NULL,
    idalbum integer NOT NULL,
    ordredsalbum integer NOT NULL
);


ALTER TABLE public.compose OWNER TO delacuevapuert;

--
-- Name: ecoute; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.ecoute (
    pseudo character varying(50) NOT NULL,
    idmorceau integer NOT NULL,
    dureeecoute interval,
    dateecoute timestamp without time zone NOT NULL
);


ALTER TABLE public.ecoute OWNER TO delacuevapuert;

--
-- Name: groupe; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.groupe (
    idgroupe integer NOT NULL,
    nom character varying(200) NOT NULL,
    dcreation date,
    nationalite character varying(100),
    genre character varying(100),
    imcouverture bytea
);


ALTER TABLE public.groupe OWNER TO delacuevapuert;

--
-- Name: groupe_idgroupe_seq; Type: SEQUENCE; Schema: public; Owner: delacuevapuert
--

CREATE SEQUENCE public.groupe_idgroupe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groupe_idgroupe_seq OWNER TO delacuevapuert;

--
-- Name: groupe_idgroupe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delacuevapuert
--

ALTER SEQUENCE public.groupe_idgroupe_seq OWNED BY public.groupe.idgroupe;


--
-- Name: inclus; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.inclus (
    idplaylist integer NOT NULL,
    idmorceau integer NOT NULL,
    ordredsplaylist integer NOT NULL
);


ALTER TABLE public.inclus OWNER TO delacuevapuert;

--
-- Name: joue; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.joue (
    idgroupe integer NOT NULL,
    idmorceau integer NOT NULL
);


ALTER TABLE public.joue OWNER TO delacuevapuert;

--
-- Name: morceau; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.morceau (
    idmorceau integer NOT NULL,
    titre character varying(200) NOT NULL,
    dureemorceau interval,
    dpublication date,
    paroles text
);


ALTER TABLE public.morceau OWNER TO delacuevapuert;

--
-- Name: morceau_idmorceau_seq; Type: SEQUENCE; Schema: public; Owner: delacuevapuert
--

CREATE SEQUENCE public.morceau_idmorceau_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.morceau_idmorceau_seq OWNER TO delacuevapuert;

--
-- Name: morceau_idmorceau_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delacuevapuert
--

ALTER SEQUENCE public.morceau_idmorceau_seq OWNED BY public.morceau.idmorceau;


--
-- Name: participe; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.participe (
    idartiste integer NOT NULL,
    idmorceau integer NOT NULL
);


ALTER TABLE public.participe OWNER TO delacuevapuert;

--
-- Name: playlist; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.playlist (
    idplaylist integer NOT NULL,
    titre character varying(200) NOT NULL,
    descplaylist text,
    visibilite boolean DEFAULT true,
    dcreation date DEFAULT CURRENT_DATE,
    pseudocreateur character varying(100) NOT NULL
);


ALTER TABLE public.playlist OWNER TO delacuevapuert;

--
-- Name: playlist_idplaylist_seq; Type: SEQUENCE; Schema: public; Owner: delacuevapuert
--

CREATE SEQUENCE public.playlist_idplaylist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playlist_idplaylist_seq OWNER TO delacuevapuert;

--
-- Name: playlist_idplaylist_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delacuevapuert
--

ALTER SEQUENCE public.playlist_idplaylist_seq OWNED BY public.playlist.idplaylist;


--
-- Name: publie; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.publie (
    idgroupe integer NOT NULL,
    idalbum integer NOT NULL
);


ALTER TABLE public.publie OWNER TO delacuevapuert;

--
-- Name: role; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.role (
    idrole integer NOT NULL,
    descrole character varying(50)
);


ALTER TABLE public.role OWNER TO delacuevapuert;

--
-- Name: role_idrole_seq; Type: SEQUENCE; Schema: public; Owner: delacuevapuert
--

CREATE SEQUENCE public.role_idrole_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_idrole_seq OWNER TO delacuevapuert;

--
-- Name: role_idrole_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: delacuevapuert
--

ALTER SEQUENCE public.role_idrole_seq OWNED BY public.role.idrole;


--
-- Name: suitgroupe; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.suitgroupe (
    pseudo character varying(50) NOT NULL,
    idgroupe integer NOT NULL,
    ddebut date NOT NULL,
    dfin date,
    CONSTRAINT datecoherente CHECK (((dfin IS NULL) OR (ddebut <= dfin)))
);


ALTER TABLE public.suitgroupe OWNER TO delacuevapuert;

--
-- Name: suitutilisateur; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.suitutilisateur (
    suivant character varying(50) NOT NULL,
    suivi character varying(50) NOT NULL,
    ddebut date NOT NULL,
    dfin date,
    CONSTRAINT datecoherente CHECK (((dfin IS NULL) OR (ddebut <= dfin)))
);


ALTER TABLE public.suitutilisateur OWNER TO delacuevapuert;

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: delacuevapuert
--

CREATE TABLE public.utilisateur (
    pseudo character varying(100) NOT NULL,
    mail character varying(255) NOT NULL,
    mpasse character varying(255) NOT NULL,
    dinscription date NOT NULL
);


ALTER TABLE public.utilisateur OWNER TO delacuevapuert;

--
-- Name: album idalbum; Type: DEFAULT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.album ALTER COLUMN idalbum SET DEFAULT nextval('public.album_idalbum_seq'::regclass);


--
-- Name: artiste idartiste; Type: DEFAULT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.artiste ALTER COLUMN idartiste SET DEFAULT nextval('public.artiste_idartiste_seq'::regclass);


--
-- Name: groupe idgroupe; Type: DEFAULT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.groupe ALTER COLUMN idgroupe SET DEFAULT nextval('public.groupe_idgroupe_seq'::regclass);


--
-- Name: morceau idmorceau; Type: DEFAULT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.morceau ALTER COLUMN idmorceau SET DEFAULT nextval('public.morceau_idmorceau_seq'::regclass);


--
-- Name: playlist idplaylist; Type: DEFAULT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.playlist ALTER COLUMN idplaylist SET DEFAULT nextval('public.playlist_idplaylist_seq'::regclass);


--
-- Name: role idrole; Type: DEFAULT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.role ALTER COLUMN idrole SET DEFAULT nextval('public.role_idrole_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.album (idalbum, titre, dparution, imcouverture, descalbum) FROM stdin;
1	Abbey Road	1969-09-26	\N	Dernier album enregistré par The Beatles.
2	A Night at the Opera	1975-11-21	\N	Album emblématique de Queen.
3	The Dark Side of the Moon	1973-03-01	\N	Chef-d’œuvre de Pink Floyd.
4	Discovery	2001-03-12	\N	Album culte de Daft Punk.
5	Parachutes	2000-07-10	\N	Premier album de Coldplay.
6	OK Computer	1997-05-21	\N	Album majeur de Radiohead.
7	Nevermind	1991-09-24	\N	Album culte de Nirvana.
8	Led Zeppelin IV	1971-11-08	\N	Contient "Stairway to Heaven".
9	AM	2013-09-09	\N	Grand succès des Arctic Monkeys.
10	Evolve	2017-06-23	\N	Album pop-rock d’Imagine Dragons.
11	The Wall	1979-11-30	\N	Opéra rock de Pink Floyd.
12	Random Access Memories	2013-05-17	\N	Dernier album studio de Daft Punk.
13	Dark Passion Play	2007-09-28	\N	Album de Nightwish, premier sans Tarja Turunen.
14	Hydra	2014-01-31	\N	Album de Within Temptation comportant plusieurs duos.
\.


--
-- Data for Name: appartient; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.appartient (idartiste, idgroupe, idrole, ddebut, dfin) FROM stdin;
1	1	1	1960-01-01	1970-04-10
2	1	2	1960-01-01	1970-04-10
3	1	2	1960-01-01	1970-04-10
4	1	3	1960-01-01	1970-04-10
5	2	1	1970-01-01	\N
6	2	2	1970-01-01	\N
7	2	3	1970-01-01	\N
8	3	1	1965-01-01	\N
9	3	2	1968-01-01	\N
10	4	2	1993-01-01	\N
11	4	1	1993-01-01	\N
12	5	1	1996-01-01	\N
14	6	1	1985-01-01	\N
15	7	1	1987-01-01	1994-04-05
16	8	1	1968-01-01	\N
17	8	2	1968-01-01	\N
18	9	1	2002-01-01	\N
19	10	1	2008-01-01	\N
20	11	1	1996-01-01	2005-10-21
21	11	5	1996-01-01	\N
22	11	2	1996-01-01	\N
24	11	4	2001-01-01	\N
25	12	1	1996-01-01	\N
26	12	2	1996-01-01	\N
\.


--
-- Data for Name: artiste; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.artiste (idartiste, nom, prenom, nationalite, dnaissance, dmort, imcouverture) FROM stdin;
1	Lennon	John	Britannique	1940-10-09	1980-12-08	\N
2	McCartney	Paul	Britannique	1942-06-18	\N	\N
3	Harrison	George	Britannique	1943-02-25	2001-11-29	\N
4	Starr	Ringo	Britannique	1940-07-07	\N	\N
5	Mercury	Freddie	Britannique	1946-09-05	1991-11-24	\N
6	May	Brian	Britannique	1947-07-19	\N	\N
7	Taylor	Roger	Britannique	1949-07-26	\N	\N
8	Waters	Roger	Britannique	1943-09-06	\N	\N
9	Gilmour	David	Britannique	1946-03-06	\N	\N
10	Guy-Manuel de Homem-Christo	\N	Français	1974-02-08	\N	\N
11	Bangalter	Thomas	Français	1975-01-03	\N	\N
12	Martin	Chris	Britannique	1977-03-02	\N	\N
13	Bellamy	Matthew	Britannique	1978-06-09	\N	\N
14	Yorke	Thom	Britannique	1968-10-07	\N	\N
15	Cobain	Kurt	Américain	1967-02-20	1994-04-05	\N
16	Plant	Robert	Britannique	1948-08-20	\N	\N
17	Page	Jimmy	Britannique	1944-01-09	\N	\N
18	Turner	Alex	Britannique	1986-01-06	\N	\N
19	Reynolds	Dan	Américain	1987-07-14	\N	\N
20	Turunen	Tarja	Finlandaise	1977-08-17	\N	\N
21	Holopainen	Tuomas	Finlandais	1976-12-25	\N	\N
22	Liimatainen	Emppu	Finlandais	1977-06-24	\N	\N
23	Vuorinen	Erno	Finlandais	1978-06-24	\N	\N
24	Hietala	Marko	Finlandais	1966-01-14	\N	\N
25	Sharon den Adel	\N	Néerlandaise	1974-07-12	\N	\N
26	Robert Westerholt	\N	Néerlandais	1975-01-02	\N	\N
\.


--
-- Data for Name: compose; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.compose (idmorceau, idalbum, ordredsalbum) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	2	1
7	2	2
8	2	3
9	2	4
10	2	5
11	3	1
12	3	2
13	3	3
14	3	4
15	3	5
16	4	1
17	4	2
18	4	3
19	4	4
20	4	5
21	5	1
22	5	2
23	5	3
24	5	4
25	5	5
26	6	1
27	6	2
28	6	3
29	6	4
30	6	5
31	7	1
32	7	2
33	7	3
34	7	4
35	7	5
36	8	1
37	8	2
38	8	3
39	8	4
40	8	5
41	9	1
42	9	2
43	9	3
44	9	4
45	9	5
46	10	1
47	10	2
48	10	3
49	10	4
50	10	5
51	11	1
52	11	2
53	11	3
54	11	4
55	11	5
56	12	1
57	12	2
58	12	3
59	12	4
60	12	5
61	13	10
62	14	3
\.


--
-- Data for Name: ecoute; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.ecoute (pseudo, idmorceau, dureeecoute, dateecoute) FROM stdin;
melomane92	1	00:04:20	2024-09-01 10:00:00
rockfan	6	00:05:55	2024-09-02 11:15:00
indie_vibes	41	00:04:32	2024-09-03 14:20:00
electrohead	57	00:05:37	2024-09-05 22:30:00
queenfan	7	00:02:52	2024-10-01 09:00:00
lofi_dreams	23	00:04:29	2024-10-02 20:45:00
\.


--
-- Data for Name: groupe; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.groupe (idgroupe, nom, dcreation, nationalite, genre, imcouverture) FROM stdin;
1	The Beatles	1960-01-01	Royaume-Uni	Rock	\N
2	Queen	1970-01-01	Royaume-Uni	Rock	\N
3	Pink Floyd	1965-01-01	Royaume-Uni	Progressive Rock	\N
4	Daft Punk	1993-01-01	France	Electro	\N
5	Coldplay	1996-01-01	Royaume-Uni	Alternative Rock	\N
6	Radiohead	1985-01-01	Royaume-Uni	Alternative Rock	\N
7	Nirvana	1987-01-01	États-Unis	Grunge	\N
8	Led Zeppelin	1968-01-01	Royaume-Uni	Hard Rock	\N
9	Arctic Monkeys	2002-01-01	Royaume-Uni	Indie Rock	\N
10	Imagine Dragons	2008-01-01	États-Unis	Pop Rock	\N
11	Nightwish	1996-01-01	Finlande	Symphonic Metal	\N
12	Within Temptation	1996-01-01	Pays-Bas	Symphonic Metal	\N
\.


--
-- Data for Name: inclus; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.inclus (idplaylist, idmorceau, ordredsplaylist) FROM stdin;
1	1	1
1	6	2
1	39	3
1	14	4
2	41	1
2	26	2
2	23	3
2	44	4
3	16	1
3	18	2
3	57	3
3	59	4
\.


--
-- Data for Name: joue; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.joue (idgroupe, idmorceau) FROM stdin;
1	1
1	2
1	3
1	4
1	5
2	6
2	7
2	8
2	9
2	10
3	11
3	12
3	13
3	14
3	15
4	16
4	17
4	18
4	19
4	20
5	21
5	22
5	23
5	24
5	25
6	26
6	27
6	28
6	29
6	30
7	31
7	32
7	33
7	34
7	35
8	36
8	37
8	38
8	39
8	40
9	41
9	42
9	43
9	44
9	45
10	46
10	47
10	48
10	49
10	50
3	51
3	52
3	53
3	54
3	55
4	56
4	57
4	58
4	59
4	60
11	61
12	62
\.


--
-- Data for Name: morceau; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.morceau (idmorceau, titre, dureemorceau, dpublication, paroles) FROM stdin;
1	Come Together	00:04:20	1969-09-26	Here come old flat top...
2	Something	00:03:03	1969-09-26	Something in the way she moves...
3	Maxwell's Silver Hammer	00:03:27	1969-09-26	Joan was quizzical...
4	Oh! Darling	00:03:26	1969-09-26	Oh! Darling, please believe me...
5	Octopus's Garden	00:02:51	1969-09-26	I'd like to be under the sea...
6	Bohemian Rhapsody	00:05:55	1975-11-21	Is this the real life...
7	You're My Best Friend	00:02:52	1975-11-21	Ooh, you're my best friend...
8	Love of My Life	00:03:38	1975-11-21	Love of my life, you've hurt me...
9	39	00:03:30	1975-11-21	In the year of 39...
10	I'm in Love with My Car	00:03:05	1975-11-21	The machine of a dream...
11	Speak to Me	00:01:30	1973-03-01	Instrumental opening...
12	Breathe	00:02:43	1973-03-01	Breathe, breathe in the air...
13	Time	00:07:06	1973-03-01	Ticking away the moments...
14	Money	00:06:23	1973-03-01	Money, get away...
15	Us and Them	00:07:49	1973-03-01	Us and them...
16	One More Time	00:05:20	2001-03-12	One more time, we're gonna celebrate...
17	Digital Love	00:04:58	2001-03-12	Last night I had a dream about you...
18	Harder, Better, Faster, Stronger	00:03:45	2001-03-12	Work it harder, make it better...
19	Around the World	00:07:10	2001-03-12	Around the world, around the world...
20	Face to Face	00:03:58	2001-03-12	Face to face...
21	Don't Panic	00:02:17	2000-07-10	Bones sinking like stones...
22	Shiver	00:04:59	2000-07-10	So I look in your direction...
23	Yellow	00:04:29	2000-07-10	Look at the stars, look how they shine for you...
24	Trouble	00:02:30	2000-07-10	Oh no, I see a man of contradiction now...
25	Parachutes	00:04:09	2000-07-10	When we get older, we will be...
26	Airbag	00:04:44	1997-05-21	In the next world war...
27	Paranoid Android	00:06:23	1997-05-21	Please could you stop the noise...
28	Subterranean Homesick Alien	00:04:27	1997-05-21	I want to be...
29	Karma Police	00:04:24	1997-05-21	Karma police, arrest this man...
30	No Surprises	00:03:48	1997-05-21	A heart that's full up like a landfill...
31	Smells Like Teen Spirit	00:05:01	1991-09-24	Load up on guns, bring your friends...
32	In Bloom	00:04:15	1991-09-24	Sell the kids for food...
33	Come as You Are	00:03:39	1991-09-24	Come as you are, as you were...
34	Breed	00:03:03	1991-09-24	I don't care, I don't mind...
35	Lithium	00:04:15	1991-09-24	I'm so happy, 'cause today I found my friends...
36	Black Dog	00:04:55	1971-11-08	Hey hey mama said the way you move...
37	Rock and Roll	00:03:40	1971-11-08	It's been a long time since I rock and rolled...
38	The Battle of Evermore	00:05:51	1971-11-08	The queen of light took her bow...
39	Stairway to Heaven	00:08:02	1971-11-08	There's a lady who's sure all that glitters is gold...
40	Going to California	00:03:32	1971-11-08	Spent my days with a woman unkind...
41	Do I Wanna Know?	00:04:32	2013-09-09	Have you got color in your cheeks?
42	R U Mine?	00:03:21	2013-09-09	I go crazy ','cause here isn't where I wanna be...
43	One for the Road	00:04:16	2013-09-09	One for the road, and one for the show...
44	Arabella	00:03:27	2013-09-09	Arabella is a witch who comes to me...
45	I Wanna Be Yours	00:03:03	2013-09-09	I wanna be your vacuum cleaner...
46	I Don't Know Why	00:03:12	2017-06-23	I don't know why I love you...
47	Whatever It Takes	00:03:21	2017-06-23	Falling too fast to prepare for this...
48	Believer	00:03:24	2017-06-23	First things first I'ma say all the words inside my head...
49	Thunder	00:03:07	2017-06-23	Just a young gun with a quick fuse...
50	Rise Up	00:03:40	2017-06-23	Rise up from the ashes...
51	In the Flesh?	00:03:19	1979-11-30	So ya thought ya might like to go to the show...
52	Another Brick in the Wall, Pt. 2	00:03:59	1979-11-30	We don't need no education...
53	Mother	00:05:33	1979-11-30	Mother do you think they'll drop the bomb?...
54	Comfortably Numb	00:06:22	1979-11-30	Hello, is there anybody in there?...
55	Hey You	00:04:40	1979-11-30	Hey you, out there in the cold...
56	Give Life Back to Music	00:04:34	2013-05-17	Kicking, squealing, Gucci little piggy...
57	Get Lucky	00:06:09	2013-05-17	We're up all night to get lucky...
58	Lose Yourself to Dance	00:05:53	2013-05-17	Come on, come on, come on, come on...
59	Instant Crush	00:05:37	2013-05-17	I didn't have the heart to tell you...
60	Contact	00:06:21	2013-05-17	Telemetry from the moons...
61	Last of the Wilds	00:06:18	2007-09-28	\N
62	Paradise (What About Us?)	00:05:19	2013-09-27	There’s no sense, the fire burns... what about us?
\.


--
-- Data for Name: participe; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.participe (idartiste, idmorceau) FROM stdin;
1	1
2	1
3	1
4	1
1	2
2	2
3	2
4	2
1	3
2	3
3	3
4	3
1	4
2	4
3	4
4	4
1	5
2	5
3	5
4	5
5	6
6	6
7	6
5	7
6	7
7	7
5	8
6	8
7	8
5	9
6	9
7	9
5	10
6	10
7	10
8	11
9	11
8	12
9	12
8	13
9	13
8	14
9	14
8	15
9	15
8	51
9	51
8	52
9	52
8	53
9	53
8	54
9	54
8	55
9	55
10	16
11	16
10	17
11	17
10	18
11	18
10	19
11	19
10	20
11	20
10	56
11	56
10	57
11	57
10	58
11	58
10	59
11	59
10	60
11	60
12	21
12	22
12	23
12	24
12	25
14	26
14	27
14	28
14	29
14	30
15	31
15	32
15	33
15	34
15	35
16	36
17	36
16	37
17	37
16	38
17	38
16	39
17	39
16	40
17	40
18	41
18	42
18	43
18	44
18	45
19	46
19	47
19	48
19	49
19	50
21	61
22	61
24	61
25	62
26	62
20	62
\.


--
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.playlist (idplaylist, titre, descplaylist, visibilite, dcreation, pseudocreateur) FROM stdin;
1	Best of 70s Rock	Hits incontournables des années 70	t	2024-01-01	melomane92
2	Indie & Chill	Ambiance détendue pour l'après-midi	t	2024-02-14	indie_vibes
3	Electro Party	Bangers électroniques	f	2024-03-03	electrohead
\.


--
-- Data for Name: publie; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.publie (idgroupe, idalbum) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
3	11
4	12
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.role (idrole, descrole) FROM stdin;
1	Chanteur
2	Guitariste
3	Batteur
4	Bassiste
5	Claviériste
6	Producteur
\.


--
-- Data for Name: suitgroupe; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.suitgroupe (pseudo, idgroupe, ddebut, dfin) FROM stdin;
rockfan	1	2024-01-05	\N
queenfan	2	2024-01-06	\N
electrohead	4	2024-02-20	\N
indie_vibes	9	2024-03-01	\N
\.


--
-- Data for Name: suitutilisateur; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.suitutilisateur (suivant, suivi, ddebut, dfin) FROM stdin;
melomane92	rockfan	2024-01-10	\N
indie_vibes	beatlemania	2024-02-01	\N
lofi_dreams	queenfan	2024-03-12	\N
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: delacuevapuert
--

COPY public.utilisateur (pseudo, mail, mpasse, dinscription) FROM stdin;
melomane92	melomane92@mail.com	pass1	2023-01-12
rockfan	rockfan@mail.com	pass2	2023-03-10
jazzlover	jazzlover@mail.com	pass3	2023-05-22
beatlemania	beatlemania@mail.com	password	2023-07-15
vinyl_addict	vinyl_addict@mail.com	pass5	2023-09-01
electrohead	electrohead@mail.com	pass6	2024-02-09
queenfan	queenfan@mail.com	pass7	2024-03-12
classicrock	classicrock@mail.com	pass8	2024-04-01
indie_vibes	indie_vibes@mail.com	pass9	2024-06-23
lofi_dreams	lofi_dreams@mail.com	pass10	2024-08-30
\.


--
-- Name: album_idalbum_seq; Type: SEQUENCE SET; Schema: public; Owner: delacuevapuert
--

SELECT pg_catalog.setval('public.album_idalbum_seq', 14, true);


--
-- Name: artiste_idartiste_seq; Type: SEQUENCE SET; Schema: public; Owner: delacuevapuert
--

SELECT pg_catalog.setval('public.artiste_idartiste_seq', 26, true);


--
-- Name: groupe_idgroupe_seq; Type: SEQUENCE SET; Schema: public; Owner: delacuevapuert
--

SELECT pg_catalog.setval('public.groupe_idgroupe_seq', 12, true);


--
-- Name: morceau_idmorceau_seq; Type: SEQUENCE SET; Schema: public; Owner: delacuevapuert
--

SELECT pg_catalog.setval('public.morceau_idmorceau_seq', 62, true);


--
-- Name: playlist_idplaylist_seq; Type: SEQUENCE SET; Schema: public; Owner: delacuevapuert
--

SELECT pg_catalog.setval('public.playlist_idplaylist_seq', 3, true);


--
-- Name: role_idrole_seq; Type: SEQUENCE SET; Schema: public; Owner: delacuevapuert
--

SELECT pg_catalog.setval('public.role_idrole_seq', 6, true);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (idalbum);


--
-- Name: appartient appartient_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.appartient
    ADD CONSTRAINT appartient_pkey PRIMARY KEY (idartiste, idgroupe, idrole);


--
-- Name: artiste artiste_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.artiste
    ADD CONSTRAINT artiste_pkey PRIMARY KEY (idartiste);


--
-- Name: compose compose_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.compose
    ADD CONSTRAINT compose_pkey PRIMARY KEY (idmorceau, idalbum);


--
-- Name: ecoute ecoute_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.ecoute
    ADD CONSTRAINT ecoute_pkey PRIMARY KEY (pseudo, idmorceau);


--
-- Name: groupe groupe_nom_key; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.groupe
    ADD CONSTRAINT groupe_nom_key UNIQUE (nom);


--
-- Name: groupe groupe_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.groupe
    ADD CONSTRAINT groupe_pkey PRIMARY KEY (idgroupe);


--
-- Name: inclus inclus_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.inclus
    ADD CONSTRAINT inclus_pkey PRIMARY KEY (idplaylist, idmorceau);


--
-- Name: joue joue_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.joue
    ADD CONSTRAINT joue_pkey PRIMARY KEY (idgroupe, idmorceau);


--
-- Name: morceau morceau_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.morceau
    ADD CONSTRAINT morceau_pkey PRIMARY KEY (idmorceau);


--
-- Name: participe participe_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.participe
    ADD CONSTRAINT participe_pkey PRIMARY KEY (idartiste, idmorceau);


--
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (idplaylist);


--
-- Name: publie publie_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.publie
    ADD CONSTRAINT publie_pkey PRIMARY KEY (idgroupe, idalbum);


--
-- Name: role role_descrole_key; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_descrole_key UNIQUE (descrole);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (idrole);


--
-- Name: suitgroupe suitgroupe_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.suitgroupe
    ADD CONSTRAINT suitgroupe_pkey PRIMARY KEY (pseudo, idgroupe);


--
-- Name: suitutilisateur suitutilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.suitutilisateur
    ADD CONSTRAINT suitutilisateur_pkey PRIMARY KEY (suivant, suivi);


--
-- Name: utilisateur utilisateur_mail_key; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_mail_key UNIQUE (mail);


--
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (pseudo);


--
-- Name: appartient appartient_idartiste_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.appartient
    ADD CONSTRAINT appartient_idartiste_fkey FOREIGN KEY (idartiste) REFERENCES public.artiste(idartiste) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: appartient appartient_idgroupe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.appartient
    ADD CONSTRAINT appartient_idgroupe_fkey FOREIGN KEY (idgroupe) REFERENCES public.groupe(idgroupe) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: appartient appartient_idrole_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.appartient
    ADD CONSTRAINT appartient_idrole_fkey FOREIGN KEY (idrole) REFERENCES public.role(idrole) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: compose compose_idalbum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.compose
    ADD CONSTRAINT compose_idalbum_fkey FOREIGN KEY (idalbum) REFERENCES public.album(idalbum) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: compose compose_idmorceau_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.compose
    ADD CONSTRAINT compose_idmorceau_fkey FOREIGN KEY (idmorceau) REFERENCES public.morceau(idmorceau) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ecoute ecoute_idmorceau_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.ecoute
    ADD CONSTRAINT ecoute_idmorceau_fkey FOREIGN KEY (idmorceau) REFERENCES public.morceau(idmorceau) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ecoute ecoute_pseudo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.ecoute
    ADD CONSTRAINT ecoute_pseudo_fkey FOREIGN KEY (pseudo) REFERENCES public.utilisateur(pseudo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: inclus inclus_idmorceau_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.inclus
    ADD CONSTRAINT inclus_idmorceau_fkey FOREIGN KEY (idmorceau) REFERENCES public.morceau(idmorceau) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inclus inclus_idplaylist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.inclus
    ADD CONSTRAINT inclus_idplaylist_fkey FOREIGN KEY (idplaylist) REFERENCES public.playlist(idplaylist) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: joue joue_idgroupe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.joue
    ADD CONSTRAINT joue_idgroupe_fkey FOREIGN KEY (idgroupe) REFERENCES public.groupe(idgroupe) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: joue joue_idmorceau_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.joue
    ADD CONSTRAINT joue_idmorceau_fkey FOREIGN KEY (idmorceau) REFERENCES public.morceau(idmorceau) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: participe participe_idartiste_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.participe
    ADD CONSTRAINT participe_idartiste_fkey FOREIGN KEY (idartiste) REFERENCES public.artiste(idartiste) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: participe participe_idmorceau_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.participe
    ADD CONSTRAINT participe_idmorceau_fkey FOREIGN KEY (idmorceau) REFERENCES public.morceau(idmorceau) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: playlist playlist_pseudocreateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pseudocreateur_fkey FOREIGN KEY (pseudocreateur) REFERENCES public.utilisateur(pseudo);


--
-- Name: publie publie_idalbum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.publie
    ADD CONSTRAINT publie_idalbum_fkey FOREIGN KEY (idalbum) REFERENCES public.album(idalbum) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: publie publie_idgroupe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.publie
    ADD CONSTRAINT publie_idgroupe_fkey FOREIGN KEY (idgroupe) REFERENCES public.groupe(idgroupe) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: suitgroupe suitgroupe_idgroupe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.suitgroupe
    ADD CONSTRAINT suitgroupe_idgroupe_fkey FOREIGN KEY (idgroupe) REFERENCES public.groupe(idgroupe) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: suitgroupe suitgroupe_pseudo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.suitgroupe
    ADD CONSTRAINT suitgroupe_pseudo_fkey FOREIGN KEY (pseudo) REFERENCES public.utilisateur(pseudo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: suitutilisateur suitutilisateur_suivant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.suitutilisateur
    ADD CONSTRAINT suitutilisateur_suivant_fkey FOREIGN KEY (suivant) REFERENCES public.utilisateur(pseudo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: suitutilisateur suitutilisateur_suivi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: delacuevapuert
--

ALTER TABLE ONLY public.suitutilisateur
    ADD CONSTRAINT suitutilisateur_suivi_fkey FOREIGN KEY (suivi) REFERENCES public.utilisateur(pseudo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: delacuevapuert
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict qjZwsWVe9iobluRXny6Qyefb2HZVhiLEeh7fDmdkGpawNkQY7nu0fFqboPb3lPk

