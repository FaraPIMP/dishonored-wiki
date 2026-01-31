--
-- PostgreSQL database dump
--

\restrict zpPYcezs3XVKhqM11tJ1TSTcdVYKReAk9RcpeaH0lHnPCEhgCgcsTD7QFBfsKZe

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    role character varying(255),
    faction character varying(255),
    game character varying(255),
    image character varying(500),
    description text,
    quotes text[],
    status character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    voice_actor character varying(255),
    first_appearance character varying(255),
    faction_id integer
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.characters_id_seq OWNER TO postgres;

--
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- Name: factions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    game character varying(255),
    description text,
    leader character varying(255),
    headquarters character varying(255),
    image character varying(500),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.factions OWNER TO postgres;

--
-- Name: factions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factions_id_seq OWNER TO postgres;

--
-- Name: factions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factions_id_seq OWNED BY public.factions.id;


--
-- Name: game_mechanics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_mechanics (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    category character varying(100),
    game character varying(255),
    description text,
    effects text[],
    tips text[],
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    image character varying(500)
);


ALTER TABLE public.game_mechanics OWNER TO postgres;

--
-- Name: game_mechanics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_mechanics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.game_mechanics_id_seq OWNER TO postgres;

--
-- Name: game_mechanics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_mechanics_id_seq OWNED BY public.game_mechanics.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    subtitle character varying(255),
    release_date date,
    description text,
    img character varying(500),
    video character varying(500),
    audio character varying(500),
    info text,
    developer character varying(255),
    publisher character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    category character varying(100),
    rarity character varying(100),
    game character varying(255),
    image character varying(500),
    description text,
    effects text[],
    location character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    game character varying(255),
    district character varying(255),
    type character varying(100),
    description text,
    notable_features text[],
    image character varying(500),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: powers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.powers (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    type character varying(100),
    cost integer,
    game character varying(255),
    image character varying(500),
    description text,
    upgrades text[],
    "character" character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    character_name character varying(255),
    max_level integer DEFAULT 1,
    mana_cost character varying(50),
    rune_cost integer
);


ALTER TABLE public.powers OWNER TO postgres;

--
-- Name: powers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.powers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.powers_id_seq OWNER TO postgres;

--
-- Name: powers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.powers_id_seq OWNED BY public.powers.id;


--
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- Name: factions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factions ALTER COLUMN id SET DEFAULT nextval('public.factions_id_seq'::regclass);


--
-- Name: game_mechanics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_mechanics ALTER COLUMN id SET DEFAULT nextval('public.game_mechanics_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: powers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.powers ALTER COLUMN id SET DEFAULT nextval('public.powers_id_seq'::regclass);


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (id, name, role, faction, game, image, description, quotes, status, created_at, voice_actor, first_appearance, faction_id) FROM stdin;
7	Верховный Смотритель Кэмпбелл	Смотритель	Вечнопритоки	Dishonored	/assets/img/characters/campbell.png	Глава Ордена Аббатства Вечного Хора. Религиозный фанатик и заговорщик. Участвовал в убийстве императрицы. Использовал Орден для своих политических целей.	{"Во имя Аббатства!","Еретики должны быть наказаны","Аутсайдер - источник всего зла"}	Убит или заклеймён как еретик	2026-01-31 03:04:15.555579	Дэниел Хейген	Dishonored	\N
9	Эмили Калдвин	Дочь императрицы	Империя	Dishonored	/assets/img/characters/emily_child.png	Дочь императрицы Джесамин Калдвин и Корво Аттано. После смерти матери находилась под опекой Корво. Наследница трона Островной Империи. Стала свидетелем убийства матери.	{"Корво! Я знала, что ты придёшь!","Расскажи мне про маму","Когда я стану императрицей, всё будет по-другому"}	Жива	2026-01-31 03:04:15.555579	Хлоя Грэйс Морец	Dishonored	\N
11	Делайла Копперспун	Самозванка-императрица	Ведьмы Бригмора	Dishonored 2	/assets/img/characters/delilah.png	Самозванка-императрица, обладающая магическими способностями. Сводная сестра Джесамин Калдвин. Захватила трон с помощью колдовства и превратила Дунвольд в кошмар.	{"Я создам мир по своему образу","Трон принадлежит мне по праву рождения","Они забыли обо мне, но я не забыла"}	Побеждена Эмили/Корво	2026-01-31 03:04:15.561037	Пола Маркс	Dishonored: DLC (упоминание)	\N
12	Киррин Джиндош	Изобретатель	Независимый	Dishonored 2	/assets/img/characters/jindosh.png	Гениальный изобретатель и учёный Карнаки. Создатель Клокворк-солдат. Служит Делайле. Его особняк полон механических ловушек и изобретений.	{"Совершенство механики!","Мои творения непобедимы","Наука превыше всего"}	Убит или лишён разума	2026-01-31 03:04:15.561037	Педро Паскаль	Dishonored 2	\N
13	Брендан Байрн	Глава Великой стражи	Вечнопритоки	Dishonored 2	/assets/img/characters/byrne.png	Герцог Серконоса, правитель южных земель. Союзник Делайлы. Организовал переворот против Эмили. Устраивает жестокие кровавые бои.	{"Добро пожаловать в Серконос","Здесь правлю я","Кровь и власть - вот что важно"}	Убит или свергнут	2026-01-31 03:04:15.561037	Сэм Рокуэлл	Dishonored 2	\N
15	Миган Фостер	Капитан	Вечнопритоки	Dishonored 2	/assets/img/characters/meagan.png	Капитан корабля "Ужасный Герцог", на самом деле Билли Лёрк под псевдонимом. Помогает Эмили и Корво сбежать из Дунвольда.	{"На корабль! Быстрее!","Море - мой дом","Доверьтесь мне"}	Жива (на самом деле Билли Лёрк)	2026-01-31 03:04:15.561037	Розарио Доусон	Dishonored 2	\N
16	Аутсайдер	Божество пустоты	Независимая	Dishonored 2	/assets/img/characters/outsider2.png	Загадочное божество Бездны. Продолжает наблюдать за судьбами избранных. Дарует Эмили её уникальные способности, если она принимает его дар.	{"Интересно, что ты выберешь на этот раз","Империя в огне. Что ты будешь делать?","Твоя судьба - в твоих руках"}	Бессмертен	2026-01-31 03:04:15.561037	Робин Лорд Тейлор	Dishonored	\N
2	Аутсайдер	Божество пустоты	Независимая	Dishonored	/assets/img/characters/outsider.png	Загадочное божество Бездны, существующее вне времени и пространства. Дарует избранным смертным сверхъестественные способности, наблюдая за их судьбами. Проявляет интерес к Корво Аттано и его выборам.	{"Твоё сердце бьётся чаще, когда я рядом","Я дам тебе силу. Что ты с ней сделаешь - твой выбор","Наблюдать за тобой... интересно"}	Бессмертен	2026-01-31 03:04:15.555579	Билли Люш	Dishonored	\N
4	Пьеро Джоплин	Королевский врач	Верные	Dishonored	/assets/img/characters/piero.png	Королевский врач и изобретатель. Гений механики и алхимии. Создатель многих устройств для Корво, включая складную маску и улучшения оружия. Член группы Лоялистов.	{"Наука и магия - две стороны одной медали","Я создал для вас кое-что интересное","Эти изобретения помогут вам в миссии"}	Жив	2026-01-31 03:04:15.555579	Брэд Дуриф	Dishonored	\N
5	Антон Соколов	Художник и учёный	Китобои	Dishonored	/assets/img/characters/sokolov.png	Королевский врач, художник, философ и учёный. Гений своего времени. Работал на лорда-регента, изучая чуму. Позже помогал Корво в его миссии возмездия. Создатель многих изобретений.	{"Соколов создал это!","Я посвятил жизнь изучению природы вещей","Искусство и наука неразделимы"}	Жив	2026-01-31 03:04:15.555579	Роджер Л. Джексон	Dishonored	\N
19	Эмили Калдвин	Императрица	Империя	Dishonored 2	/assets/img/characters/emily.png	Дочь Корво Аттано и Джесамин Калдвин. Императрица Островной Империи. После государственного переворота была вынуждена бежать из Дунволла. Обладает уникальными способностями, дарованными Аутсайдером.	{"Мне не нужна корона, чтобы быть сильной","Я не просто императрица. Я воин","Они забыли, что я дочь Корво Аттано"}	Жива	2026-01-31 03:04:15.561037	Эрика Латтрелл	Dishonored (ребенок)	\N
17	Корво Аттано	Королевский защитник	Империя	Dishonored 2	/assets/img/characters/corvo2.png	Королевский Защитник, отец Эмили Калдвин. Легендарный убийца, который остановил заговор лорда-регента. Теперь защищает свою дочь и помогает вернуть ей трон.	{"Я защищал императрицу. Теперь защищаю свою дочь","Месть - это то, чем я занимаюсь лучше всего","За Эмили"}	Жив	2026-01-31 03:04:15.561037	Стивен Рассел	Dishonored	\N
10	Билли Лёрк	Капитан корабля	Независимая	Dishonored 2	/assets/img/characters/billie.png	Бывшая правая рука Дауда, капитан корабля "Трепанация". Помогает Эмили и Корво в их миссии вернуть трон. Потеряла руку и глаз в прошлом.	{"Готовы отплывать?","Я многое повидала, но это...","Дауд многому меня научил"}	Жива	2026-01-31 03:04:15.561037	Розарио Доусон	Dishonored 2	\N
14	Александрия Хайпейша	Доктор	Культ Аутсайдера	Dishonored 2	/assets/img/characters/hypatia.png	Доктор и алхимик Аддермайрского института. Создала раствор Аддермайра. Проводит жестокие эксперименты над пациентами по приказу короны.	{"Во имя науки","Прогресс требует жертв","Мои исследования важнее всего"}	Убита или арестована	2026-01-31 03:04:15.561037	Андреа Райзборо	Dishonored 2	\N
18	Антон Соколов	Художник и учёный	Независимая	Dishonored 2	/assets/img/characters/sokolov2.png	Легендарный учёный, художник и изобретатель. Теперь пожилой, но всё ещё гениальный. Помогает Эмили и Корво советами и изобретениями.	{"Годы не остановили мой разум","Я всё ещё могу удивить мир","Эмили, ты выросла сильной"}	Жив	2026-01-31 03:04:15.561037	Роджер Л. Джексон	Dishonored	\N
3	Дауд	Наёмный убийца	Китобои	Dishonored	/assets/img/characters/daud.png	Легендарный убийца, лидер китобоев. Убил императрицу Джесамин Калдвин по заказу. Позже раскаялся в содеянном и пытался искупить свою вину.	{"Моё имя - Дауд. И я убил императрицу","Я много убивал. Но это убийство изменило всё","Искупление... возможно ли оно для таких, как я?"}	Жив (на момент Dishonored 2)	2026-01-31 03:04:15.555579	Майкл Мадсен	Dishonored	\N
1	Корво Аттано	Королевский защитник	Лоялисты	Dishonored	/assets/img/characters/corvo.png	Королевский Защитник императрицы Джесамин Калдвин. Ложно обвинён в её убийстве и заключён в тюрьму Колдридж. Сбегает с помощью Лоялистов и получает силы от Аутсайдера, чтобы отомстить заговорщикам.	{"За императрицу","Месть решает всё","Я был обманут. Преда"}	Жив	2026-01-31 03:04:15.555579	Не озвучен (Dishonored 1)	Dishonored	\N
6	Адмирал Хавлок	Адмирал флота	Верные	Dishonored	/assets/img/characters/havelock.png	\N	\N	Мертв	2026-01-31 03:04:15.555579	\N	\N	\N
8	Грэнни Тряпки	Ведьма	Ведьмы Бригмора	Dishonored	/assets/img/characters/granny.png	\N	\N	Мертв	2026-01-31 03:04:15.555579	\N	\N	\N
\.


--
-- Data for Name: factions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factions (id, name, game, description, leader, headquarters, image, created_at) FROM stdin;
1	Верные	Dishonored	Группа заговорщиков, стремящихся свергнуть Лорда-Регента и вернуть Эмили на трон.	Адмирал Хавлок	Паб "Гончие Ямы"	\N	2026-01-31 00:34:17.794492
2	Китобои	Dishonored	Могущественная промышленная гильдия, занимающаяся добычей китового жира - основного источника энергии Империи.	Соколов	Китобойная станция Рудшор	\N	2026-01-31 00:34:17.794492
3	Вечнозрители	Dishonored	Религиозный орден, поклоняющийся Вечнозрителю и борющийся с магией и ересью.	Верховный Смотритель Кэмпбелл	Высокое Аббатство	\N	2026-01-31 00:34:17.794492
4	Убийцы Даудю	Dishonored	Элитная группа наёмных убийц под командованием Даудю, наделённых силами Аутсайдера.	Даудю	Скотобойня	\N	2026-01-31 00:34:17.794492
5	Герцогская гвардия	Dishonored 2	Военизированная полиция Карнаки под контролем Делайлы Копперспун.	Делайла Копперспун	Особняк герцога	\N	2026-01-31 00:34:17.794492
6	Алая стража	Dishonored 2	Королевская гвардия Дануолла и личные телохранители Императрицы.	Императрица Эмили	Башня Дануолла	\N	2026-01-31 00:34:17.794492
7	Аббатство Вечнозрителей	Dishonored 2	Продолжение религиозного ордена, но с новыми взглядами после событий первой игры.	Верховная Смотрительница Байрн	Храм Карнаки	\N	2026-01-31 00:34:17.794492
\.


--
-- Data for Name: game_mechanics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_mechanics (id, title, category, game, description, effects, tips, created_at, image) FROM stdin;
2	Стелс-геймплей	stealth	Dishonored	Скрытность - ключ к успеху. Избегайте обнаружения, используя тени, способности и окружение.	{"Обнаружение повышает сложность","Тени скрывают от врагов","Звуки привлекают внимание","Разные пути прохождения уровней"}	{"Используйте Тёмное зрение для планирования","Ждите патрули врагов","Перемещайтесь по крышам","Отключайте источники света"}	2026-01-31 00:34:17.811333	\N
3	Достижения Ghost и Clean Hands	achievements	Dishonored	Особые достижения за прохождение без убийств и обнаружений.	{"Ghost: не быть замеченным","Clean Hands: никого не убивать","Требует идеального планирования","Награждается уникальными концовками"}	{"Сохраняйтесь часто","Изучайте карты перед действием","Используйте способности для стелса","Нокаутированные враги не считаются убийством"}	2026-01-31 00:34:17.811333	\N
5	Руны и улучшения	progression	Dishonored	Руны используются для получения и улучшения сверхъестественных способностей.	{"Находятся с помощью Сердца","Каждая способность имеет уровни","Ограниченное количество рун в игре","Влияют на стиль прохождения"}	{"Планируйте развитие заранее","Исследуйте уровни полностью","Разные билды для разных стилей"}	2026-01-31 00:34:17.811333	\N
1	Система Хаоса	chaos	Dishonored	Уровень хаоса определяет мир вокруг вас и влияет на концовку игры. Чем больше людей вы убиваете, тем выше хаос.	{"Низкий хаос: меньше крыс и жуков, светлая концовка","Высокий хаос: больше врагов, тёмная концовка","Влияет на поведение союзников","Изменяет диалоги и реакции NPC"}	{"Используйте нелетальные методы для низкого хаоса","Прячьте тела убитых врагов","Используйте сон-дротики вместо смертельных"}	2026-01-31 00:34:17.811333	/assets/img/mechanics/chaos.png
4	Костяные амулеты	customization	Dishonored	Магические амулеты, дающие пассивные бонусы и улучшения.	{"Находятся по всему миру","Дают различные пассивные эффекты","Можно носить до 6 одновременно","В D2 можно создавать собственные"}	{"Используйте Сердце для поиска амулетов","Выбирайте амулеты под свой стиль игры","Комбинируйте эффекты для синергии"}	2026-01-31 00:34:17.811333	/assets/img/mechanics/bone_charms.png
6	Система Хаоса	chaos	Dishonored 2	Улучшенная система хаоса с более детализированным влиянием на мир. Каждое убийство и обнаружение влияет на концовку игры.	{"Низкий хаос: меньше врагов, светлая концовка","Высокий хаос: больше кровомух и крыс, тёмная концовка","Влияет на диалоги и реакции персонажей","Более детальная система чем в первой игре"}	{"Используйте нелетальные методы для низкого хаоса","Прячьте тела убитых врагов","Избегайте случайных убийств","Используйте усыпляющие дротики"}	2026-01-31 06:03:13.892902	\N
7	Стелс-геймплей	stealth	Dishonored 2	Улучшенная система скрытности с новыми механиками укрытия и обнаружения.	{"Новая система укрытий","Улучшенный ИИ врагов","Разные уровни обнаружения","Звук влияет на скрытность"}	{"Используйте Тёмное зрение для планирования","Следите за конусами обзора врагов","Перемещайтесь в присяде в опасных зонах","Используйте окружение для отвлечения"}	2026-01-31 06:03:13.892902	\N
8	Достижения Ghost и Clean Hands	achievements	Dishonored 2	Классические достижения за прохождение без убийств и обнаружения. Доступны для обоих персонажей.	{"Ghost: пройти без обнаружения","Clean Hands: никого не убивать","Можно получить за одно прохождение","Работает для Эмили и Корво"}	{"Часто сохраняйтесь","Изучайте карты перед действием","Используйте способности для стелса","Нокаутированные враги не считаются убийством"}	2026-01-31 06:03:13.892902	\N
9	Костяные амулеты и крафт	customization	Dishonored 2	Новая система крафта костяных амулетов. Можно создавать свои амулеты с выбранными эффектами.	{"Можно носить до 10 амулетов","Крафт новых амулетов","Комбинирование эффектов","Уникальные черты Эмили и Корво"}	{"Собирайте все костяные осколки","Экспериментируйте с комбинациями","Подбирайте амулеты под стиль игры","Некоторые комбинации дают синергию"}	2026-01-31 06:03:13.892902	\N
10	Руны и древо способностей	progression	Dishonored 2	Расширенное древо способностей для Эмили и Корво. Больше рун и вариантов развития персонажей.	{"Уникальные способности для каждого персонажа","Больше улучшений чем в первой игре","Можно переиграть с другим персонажем","Разблокируются новые способности по сюжету"}	{"Планируйте развитие заранее","Ищите все руны с помощью Сердца","Разные способности для разных стилей","Некоторые способности синергируют между собой"}	2026-01-31 06:03:13.892902	\N
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, title, subtitle, release_date, description, img, video, audio, info, developer, publisher, created_at) FROM stdin;
1	Dishonored	Revenge Solves Everything	2012-10-09	Dishonored - это immersive sim от Arkane Studios, где вы играете за Корво Аттано, бывшего Королевского Защитника, ложно обвиненного в убийстве Императрицы.	\N	\N	\N	\N	Arkane Studios	Bethesda Softworks	2026-01-23 15:28:01.575982
2	Dishonored 2	Take Back What's Yours	2016-11-11	Dishonored 2 - продолжение культовой игры, где вы можете выбрать между Корво Аттано и его дочерью Эмили Кэлдвин.	\N	\N	\N	\N	Arkane Studios	Bethesda Softworks	2026-01-23 15:28:01.575982
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, title, category, rarity, game, image, description, effects, location, created_at) FROM stdin;
4	Меч	weapon	common	Dishonored	\N	Основное оружие ближнего боя. Быстрые и смертельные удары.	{"Блокирование атак","Бесшумные убийства","Быстрые комбо"}	С самого начала игры	2026-01-31 05:32:39.277095
5	Арбалет	weapon	common	Dishonored	\N	Бесшумное оружие дальнего боя с различными видами болтов.	{"Бесшумная стрельба","Различные типы болтов","Высокая точность"}	Получен от Пьеро	2026-01-31 05:32:39.277095
6	Пистолет	weapon	uncommon	Dishonored	\N	Шумное огнестрельное оружие. Эффективно против бронированных врагов.	{"Высокий урон","Пробивает броню","Привлекает внимание"}	Получен от Пьеро	2026-01-31 05:32:39.277095
7	Гранаты	weapon	uncommon	Dishonored	\N	Взрывные устройства для уничтожения групп врагов.	{"Урон по площади","Отбрасывает врагов","Уничтожает препятствия"}	Можно купить у Пьеро	2026-01-31 05:32:39.277095
8	Пружинная бритва	weapon	rare	Dishonored	\N	Смертельная ловушка. Убивает первого, кто активирует её.	{"Смертельный урон","Устанавливается как ловушка","Работает на расстоянии"}	Можно купить у Пьеро	2026-01-31 05:32:39.277095
9	Эликсир здоровья	consumable	common	Dishonored	\N	Эликсир Соколова. Восстанавливает здоровье при использовании.	{"Восстанавливает 50% здоровья","Мгновенное действие"}	Находятся по всему миру	2026-01-31 05:32:39.277095
10	Эликсир маны	consumable	common	Dishonored	\N	Духовное средство Пьеро. Восстанавливает ману для способностей.	{"Восстанавливает 50% маны","Необходим для способностей"}	Находятся по всему миру	2026-01-31 05:32:39.277095
11	Костяные амулеты	enhancement	uncommon	Dishonored	\N	Мистические артефакты с пассивными бонусами различных эффектов.	{"Пассивные бонусы","Различные эффекты","Можно носить до 6 штук"}	Находятся с помощью Сердца	2026-01-31 05:32:39.277095
12	Руны	currency	rare	Dishonored	\N	Используются для получения и улучшения сверхъестественных способностей.	{"Открывают новые способности","Улучшают существующие","Ограниченное количество"}	Находятся с помощью Сердца	2026-01-31 05:32:39.277095
13	Меч	weapon	common	Dishonored 2	\N	Основное оружие ближнего боя. Улучшенная версия с новыми возможностями.	{"Блокирование и контратаки","Бесшумные убийства","Различные комбо"}	С самого начала игры	2026-01-31 05:48:35.744274
14	Арбалет	weapon	common	Dishonored 2	\N	Бесшумное оружие дальнего боя с улучшенными характеристиками.	{"Бесшумная стрельба","Улучшенные типы болтов","Точность выше чем в первой части"}	Получен от Антона Сокольского	2026-01-31 05:48:35.744274
15	Пистолет	weapon	uncommon	Dishonored 2	\N	Улучшенное огнестрельное оружие с новыми модификациями.	{"Высокий урон","Новые типы патронов","Возможность улучшения"}	Получен от Антона Сокольского	2026-01-31 05:48:35.744274
16	Шокирующие мины	weapon	uncommon	Dishonored 2	\N	Нелетальные ловушки для оглушения врагов.	{Оглушение,"Не убивает","Можно переставлять"}	Можно купить	2026-01-31 05:48:35.744274
17	Липкие гранаты	weapon	rare	Dishonored 2	\N	Взрывные устройства, прилипающие к поверхностям.	{"Урон по площади","Прилипают к целям","Таймер детонации"}	Можно купить	2026-01-31 05:48:35.744274
18	Раствор Аддермайра	consumable	uncommon	Dishonored 2	\N	Улучшенный эликсир, восстанавливающий здоровье и ману одновременно.	{"Восстанавливает 50% здоровья","Восстанавливает 50% маны","Комбинированное действие"}	Находятся по всему миру	2026-01-31 05:48:35.744274
19	Костяные амулеты	enhancement	uncommon	Dishonored 2	\N	Мистические артефакты с пассивными бонусами. Можно создавать свои.	{"Пассивные бонусы","Возможность крафта","Можно носить до 10 штук"}	Находятся с помощью Сердца	2026-01-31 05:48:35.744274
20	Руны	currency	rare	Dishonored 2	\N	Используются для получения способностей Эмили или Корво.	{"Открывают новые способности","Улучшают существующие","Больше рун чем в первой части"}	Находятся с помощью Сердца	2026-01-31 05:48:35.744274
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, name, game, district, type, description, notable_features, image, created_at) FROM stdin;
7	Карнака	Dishonored 2	\N	city	Южный портовый город Империи, известный своей архитектурой и теплым климатом.	{"Ветряные мельницы","Пылевые бури","Дворец герцога",Санаторий}	/assets/img/locations/dishonored2/dust_district.jpg	2026-01-31 00:34:17.799789
8	Особняк герцога	Dishonored 2	Аристократический	building	Роскошная резиденция герцога Абеле и Делайлы Копперспун.	{"Механический особняк","Сейфовая комната","Королевская галерея"}	/assets/img/locations/dishonored2/grand_palace.jpg	2026-01-31 00:34:17.799789
9	Часовой механизм	Dishonored 2	Промышленный	building	Огромное механическое устройство, созданное гениальным изобретателем Кириным Джиндошем.	{"Механические солдаты","Трансформирующиеся комнаты",Головоломки}	/assets/img/locations/dishonored2/clockwork_mansion.jpg	2026-01-31 00:34:17.799789
10	Институт Аддермайра	Dishonored 2	Медицинский	building	Психиатрическая лечебница, где проводятся жестокие эксперименты.	{"Камеры пациентов",Операционные,Подземелья}	/assets/img/locations/dishonored2/addermire_institute.jpg	2026-01-31 00:34:17.799789
11	Пыльный округ	Dishonored 2	Бедняцкий	district	Беднейший район Карнаки, страдающий от кровопийц и банд.	{"Заражение кровопийцами","Гнездо Гнили","Чёрный рынок"}	/assets/img/locations/dishonored2/dust_district.jpg	2026-01-31 00:34:17.799789
1	Дануолл	Dishonored	\N	city	Столица Островной Империи, индустриальный мегаполис викторианской эпохи, охваченный чумой.	{"Башня Дануолла","Китобойные станции","Районы трущоб","Крысиная чума"}	/assets/img/locations/dishonored1/dunwall_tower.png	2026-01-31 00:34:17.799789
4	Высокое Аббатство	Dishonored	Религиозный	building	Штаб-квартира Ордена Вечнозрителей, место религиозной власти.	{Библиотека,"Офис Верховного Смотрителя","Зал поклонения"}	/assets/img/locations/dishonored1/dunwall_tower_fortified.jpg	2026-01-31 00:34:17.799789
5	Особняк Буль	Dishonored	Аристократический	building	Роскошная резиденция леди Буль, центр светской жизни знати.	{"Бальный зал","Подвал с пытками","Тайные проходы"}	/assets/img/locations/dishonored1/golden_cat_exterior.jpg	2026-01-31 00:34:17.799789
6	Скотобойня	Dishonored	Промышленный	building	Заброшенная скотобойня, превращённая в базу убийц Даудю.	{"Тренировочный зал","Алтарь Аутсайдера","Секретные пути"}	/assets/img/locations/dishonored1/flooded_district.png	2026-01-31 00:34:17.799789
2	Башня Дануолла	Dishonored	Правительственный	building	Резиденция Императрицы и центр политической власти Империи.	{"Тронный зал","Покои Эмили","Королевский сад"}	/assets/img/locations/dishonored1/dunwall_tower.png	2026-01-31 00:34:17.799789
3	Паб "Гончие Ямы"	Dishonored	Промышленный	building	Штаб-квартира Верных заговорщиков, старый паб в промышленном районе.	{"Комната планирования",Арсенал,"Мастерская Пьеро"}	/assets/img/locations/dishonored1/hound_pits_front.png	2026-01-31 00:34:17.799789
12	Золотой Кот	Dishonored	Дистиллерный округ	building	Роскошный бордель в Дистиллерном округе, популярное заведение среди дануолльской знати.	\N	/assets/img/locations/dishonored1/golden_cat_exterior.jpg	2026-01-31 04:13:26.654155
13	Затопленный район	Dishonored	Затопленный округ	district	Район Дануолла, опустошённый чумой и затопленный. Здесь обитают чумные крысы и зараженные.	\N	/assets/img/locations/dishonored1/flooded_district.png	2026-01-31 04:13:26.654155
14	Тюрьма Колдридж	Dishonored	Река Рэт	building	Охраняемая тюрьма на острове в реке Рэт, где Корво был заключён после убийства императрицы.	\N	/assets/img/locations/dishonored1/coldridge_prison_front.jpg	2026-01-31 04:13:26.654155
15	Рудшор Гейт	Dishonored	Затопленный округ	landmark	Ворота в Затопленный район, последний оплот городской стражи перед заражённой зоной.	\N	/assets/img/locations/dishonored1/rudshore_gate.png	2026-01-31 04:13:26.654155
16	Центральный Рудшор	Dishonored	Рудшор	district	Торговый район с китобойными станциями, центр промышленности Дануолла.	\N	/assets/img/locations/dishonored1/central_rudshore.jpg	2026-01-31 04:13:26.654155
17	Часовой Особняк	Dishonored 2	Карнака	building	Механическое чудо, созданное Кирином Джиндошем - особняк с трансформирующимися комнатами.	\N	/assets/img/locations/dishonored2/clockwork_mansion.jpg	2026-01-31 04:13:26.662254
18	Королевская консерватория	Dishonored 2	Карнака	building	Музыкальная академия Карнаки, захваченная ведьмами Делайлы.	\N	/assets/img/locations/dishonored2/royal_conservatory.png	2026-01-31 04:13:26.662254
19	Поместье Стилтона	Dishonored 2	Карнака	building	Заброшенный особняк Арамиса Стилтона, место, где время можно изменить.	\N	/assets/img/locations/dishonored2/stilton_manor_exterior.jpg	2026-01-31 04:13:26.662254
20	Великий Дворец	Dishonored 2	Карнака	building	Резиденция герцога Луки Абеле, величественный дворец в центре Карнаки.	\N	/assets/img/locations/dishonored2/grand_palace.jpg	2026-01-31 04:13:26.662254
21	Дредфул Вейл	Dishonored 2	Море	ship	Корабль Билли Лёрк, служащий мобильной базой для Корво и Эмили.	\N	/assets/img/locations/dishonored2/dreadful_wale.jpg	2026-01-31 04:13:26.662254
\.


--
-- Data for Name: powers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.powers (id, title, type, cost, game, image, description, upgrades, "character", created_at, character_name, max_level, mana_cost, rune_cost) FROM stdin;
7	Искривление времени	Time	2	Dishonored	\N	Замедление или остановка времени вокруг Корво.	\N	\N	2026-01-31 00:34:17.807225	Корво Аттано	2	60%	3
9	Пожирающая стая	Offensive	1	Dishonored	\N	Призыв стаи прожорливых крыс для атаки врагов.	\N	\N	2026-01-31 00:34:17.807225	Корво Аттано	2	40%	2
10	Притяжение	Control	1	Dishonored	\N	Притягивает предметы и врагов на расстоянии.	\N	\N	2026-01-31 00:34:17.807225	Корво Аттано	1	20%	1
11	Дальняя хватка	Movement	1	Dishonored 2	\N	Притягивает Эмили к отдалённым точкам или притягивает врагов к ней.	\N	\N	2026-01-31 00:34:17.807225	Эмили Кэлдвин	2	20%	1
12	Теневая поступь	Stealth	2	Dishonored 2	\N	Превращение в неуязвимую тень, способную проходить сквозь узкие щели.	\N	\N	2026-01-31 00:34:17.807225	Эмили Кэлдвин	2	60%	3
13	Домино	Control	2	Dishonored 2	\N	Связывает врагов, заставляя их разделять одну судьбу.	\N	\N	2026-01-31 00:34:17.807225	Эмили Кэлдвин	2	40%	2
14	Гипноз	Control	2	Dishonored 2	\N	Призывает духа Бездны для отвлечения и заколдовывания врагов.	\N	\N	2026-01-31 00:34:17.807225	Эмили Кэлдвин	2	50%	3
15	Двойник	Offensive	3	Dishonored 2	\N	Создаёт копию Эмили, способную сражаться и использовать способности.	\N	\N	2026-01-31 00:34:17.807225	Эмили Кэлдвин	2	80%	4
16	Призыв убийц	Summon	2	Dishonored	\N	Призывает убийц из группы Даудю для помощи в бою.	\N	\N	2026-01-31 00:34:17.807225	Даудю	2	50%	2
17	Стоп времени	Time	2	Dishonored	\N	Полная остановка времени, уникальная версия способности Корво.	\N	\N	2026-01-31 00:34:17.807225	Даудю	1	80%	3
18	Проворство	Passive	1	Dishonored	\N	Увеличивает скорость перемещения и высоту прыжка.	\N	\N	2026-01-31 00:34:17.807225	Все персонажи	2	0%	1
19	Кровожадность	Passive	2	Dishonored	\N	Адреналиновый режим, замедляющий время при обнаружении.	\N	\N	2026-01-31 00:34:17.807225	Все персонажи	2	0%	2
20	Теневое убийство	Passive	1	Dishonored	\N	Убитые тела мгновенно превращаются в пепел.	\N	\N	2026-01-31 00:34:17.807225	Все персонажи	1	0%	1
4	Скачок	Movement	1	Dishonored	/assets/img/powers/dishonored1/blink.png	Мгновенная телепортация на короткое расстояние. Фундаментальная способность для перемещения.	\N	\N	2026-01-31 00:34:17.807225	Корво Аттано	2	20%	1
5	Тёмное зрение	Perception	1	Dishonored	/assets/img/powers/dishonored1/dark_vision.png	Позволяет видеть живых существ сквозь стены и их поле зрения.	\N	\N	2026-01-31 00:34:17.807225	Корво Аттано	2	20%	1
6	Вселение	Control	2	Dishonored	/assets/img/powers/dishonored1/possession.png	Вселение в тела животных и людей для скрытного перемещения.	\N	\N	2026-01-31 00:34:17.807225	Корво Аттано	2	60%	2
8	Порыв ветра	Offensive	1	Dishonored	/assets/img/powers/dishonored1/windblast.png	Мощная волна воздуха, отбрасывающая врагов и объекты.	\N	\N	2026-01-31 00:34:17.807225	Корво Аттано	2	40%	2
\.


--
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_id_seq', 19, true);


--
-- Name: factions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factions_id_seq', 7, true);


--
-- Name: game_mechanics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_mechanics_id_seq', 10, true);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 2, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 20, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 21, true);


--
-- Name: powers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.powers_id_seq', 20, true);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- Name: factions factions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factions
    ADD CONSTRAINT factions_pkey PRIMARY KEY (id);


--
-- Name: game_mechanics game_mechanics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_mechanics
    ADD CONSTRAINT game_mechanics_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: powers powers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.powers
    ADD CONSTRAINT powers_pkey PRIMARY KEY (id);


--
-- Name: idx_characters_game; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_characters_game ON public.characters USING btree (game);


--
-- Name: idx_characters_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_characters_name ON public.characters USING btree (name);


--
-- Name: idx_factions_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_factions_name ON public.factions USING btree (name);


--
-- Name: idx_games_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_games_title ON public.games USING btree (title);


--
-- Name: idx_items_game; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_items_game ON public.items USING btree (game);


--
-- Name: idx_items_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_items_title ON public.items USING btree (title);


--
-- Name: idx_locations_game; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_locations_game ON public.locations USING btree (game);


--
-- Name: idx_locations_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_locations_name ON public.locations USING btree (name);


--
-- Name: idx_mechanics_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mechanics_category ON public.game_mechanics USING btree (category);


--
-- Name: idx_powers_character; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_powers_character ON public.powers USING btree (character_name);


--
-- Name: idx_powers_game; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_powers_game ON public.powers USING btree (game);


--
-- Name: idx_powers_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_powers_title ON public.powers USING btree (title);


--
-- PostgreSQL database dump complete
--

\unrestrict zpPYcezs3XVKhqM11tJ1TSTcdVYKReAk9RcpeaH0lHnPCEhgCgcsTD7QFBfsKZe

