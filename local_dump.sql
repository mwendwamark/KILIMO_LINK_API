--
-- PostgreSQL database dump
--

\restrict MP4xrsQ20i9IqBaqoV5SW5PvfjAde6CUPUhRBcgOwwP50871ihJM0x2N2Q3MceU

-- Dumped from database version 18.3 (Ubuntu 18.3-1.pgdg24.04+1)
-- Dumped by pg_dump version 18.3 (Ubuntu 18.3-1.pgdg24.04+1)

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

ALTER TABLE ONLY public.conversation_participants DROP CONSTRAINT fk_rails_d4fdd4cae0;
ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT fk_rails_c3b3935057;
ALTER TABLE ONLY public.buyer_profiles DROP CONSTRAINT fk_rails_c1e142d51a;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_rails_bedd9094d4;
ALTER TABLE ONLY public.farmer_profiles DROP CONSTRAINT fk_rails_b199d1bddc;
ALTER TABLE ONLY public.follows DROP CONSTRAINT fk_rails_9cfc70f043;
ALTER TABLE ONLY public.active_storage_variant_records DROP CONSTRAINT fk_rails_993965df05;
ALTER TABLE ONLY public.likes DROP CONSTRAINT fk_rails_87a8aac469;
ALTER TABLE ONLY public.messages DROP CONSTRAINT fk_rails_7f927086d2;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_rails_74a66bd6c5;
ALTER TABLE ONLY public.follows DROP CONSTRAINT fk_rails_622d34a301;
ALTER TABLE ONLY public.posts DROP CONSTRAINT fk_rails_5b5ddfd518;
ALTER TABLE ONLY public.conversation_participants DROP CONSTRAINT fk_rails_39b25ba31e;
ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_31554e7034;
ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_2fd19c0db7;
ALTER TABLE ONLY public.farms DROP CONSTRAINT fk_rails_2a5f4d1971;
ALTER TABLE ONLY public.messages DROP CONSTRAINT fk_rails_273a25a7a6;
ALTER TABLE ONLY public.products DROP CONSTRAINT fk_rails_1f65848341;
ALTER TABLE ONLY public.likes DROP CONSTRAINT fk_rails_1e09b5dabf;
ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_03de2dc08c;
DROP INDEX public.index_users_on_reset_password_token;
DROP INDEX public.index_users_on_phone_number;
DROP INDEX public.index_users_on_jti;
DROP INDEX public.index_users_on_email;
DROP INDEX public.index_users_on_confirmation_token;
DROP INDEX public.index_reviews_on_user_id;
DROP INDEX public.index_reviews_on_product_id;
DROP INDEX public.index_products_on_product_name_trgm;
DROP INDEX public.index_products_on_price_per_unit;
DROP INDEX public.index_products_on_farm_id;
DROP INDEX public.index_products_on_description_trgm;
DROP INDEX public.index_products_on_created_at_and_id;
DROP INDEX public.index_products_on_category;
DROP INDEX public.index_posts_on_user_id;
DROP INDEX public.index_messages_on_user_id;
DROP INDEX public.index_messages_on_conversation_id;
DROP INDEX public.index_likes_on_user_id;
DROP INDEX public.index_likes_on_post_id;
DROP INDEX public.index_follows_on_following_id;
DROP INDEX public.index_follows_on_follower_id_and_following_id;
DROP INDEX public.index_farms_on_user_id;
DROP INDEX public.index_farms_on_county;
DROP INDEX public.index_farmer_profiles_on_user_id;
DROP INDEX public.index_conversation_participants_on_user_id;
DROP INDEX public.index_conversation_participants_on_conversation_id;
DROP INDEX public.index_comments_on_user_id;
DROP INDEX public.index_comments_on_post_id;
DROP INDEX public.index_comments_on_parent_id;
DROP INDEX public.index_buyer_profiles_on_user_id;
DROP INDEX public.index_active_storage_variant_records_uniqueness;
DROP INDEX public.index_active_storage_blobs_on_key;
DROP INDEX public.index_active_storage_attachments_uniqueness;
DROP INDEX public.index_active_storage_attachments_on_blob_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
ALTER TABLE ONLY public.jwt_denylists DROP CONSTRAINT jwt_denylists_pkey;
ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_pkey;
ALTER TABLE ONLY public.farms DROP CONSTRAINT farms_pkey;
ALTER TABLE ONLY public.farmer_profiles DROP CONSTRAINT farmer_profiles_pkey;
ALTER TABLE ONLY public.conversations DROP CONSTRAINT conversations_pkey;
ALTER TABLE ONLY public.conversation_participants DROP CONSTRAINT conversation_participants_pkey;
ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
ALTER TABLE ONLY public.buyer_profiles DROP CONSTRAINT buyer_profiles_pkey;
ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
ALTER TABLE ONLY public.active_storage_variant_records DROP CONSTRAINT active_storage_variant_records_pkey;
ALTER TABLE ONLY public.active_storage_blobs DROP CONSTRAINT active_storage_blobs_pkey;
ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT active_storage_attachments_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.resources ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.likes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.jwt_denylists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.follows ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.farms ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.farmer_profiles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.conversations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.conversation_participants ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.buyer_profiles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_variant_records ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_blobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_attachments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.reviews_id_seq;
DROP TABLE public.reviews;
DROP SEQUENCE public.resources_id_seq;
DROP TABLE public.resources;
DROP SEQUENCE public.products_id_seq;
DROP TABLE public.products;
DROP SEQUENCE public.posts_id_seq;
DROP TABLE public.posts;
DROP SEQUENCE public.messages_id_seq;
DROP TABLE public.messages;
DROP SEQUENCE public.likes_id_seq;
DROP TABLE public.likes;
DROP SEQUENCE public.jwt_denylists_id_seq;
DROP TABLE public.jwt_denylists;
DROP SEQUENCE public.follows_id_seq;
DROP TABLE public.follows;
DROP SEQUENCE public.farms_id_seq;
DROP TABLE public.farms;
DROP SEQUENCE public.farmer_profiles_id_seq;
DROP TABLE public.farmer_profiles;
DROP SEQUENCE public.conversations_id_seq;
DROP TABLE public.conversations;
DROP SEQUENCE public.conversation_participants_id_seq;
DROP TABLE public.conversation_participants;
DROP SEQUENCE public.comments_id_seq;
DROP TABLE public.comments;
DROP SEQUENCE public.buyer_profiles_id_seq;
DROP TABLE public.buyer_profiles;
DROP TABLE public.ar_internal_metadata;
DROP SEQUENCE public.active_storage_variant_records_id_seq;
DROP TABLE public.active_storage_variant_records;
DROP SEQUENCE public.active_storage_blobs_id_seq;
DROP TABLE public.active_storage_blobs;
DROP SEQUENCE public.active_storage_attachments_id_seq;
DROP TABLE public.active_storage_attachments;
DROP EXTENSION pgcrypto;
DROP EXTENSION pg_trgm;
--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: buyer_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.buyer_profiles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    avatar character varying,
    location character varying,
    county character varying,
    country character varying DEFAULT 'Kenya'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: buyer_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.buyer_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: buyer_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.buyer_profiles_id_seq OWNED BY public.buyer_profiles.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    parent_id bigint,
    comment_body text,
    comment_likes integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: conversation_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conversation_participants (
    id bigint NOT NULL,
    conversation_id bigint NOT NULL,
    user_id bigint NOT NULL,
    joined_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: conversation_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conversation_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conversation_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conversation_participants_id_seq OWNED BY public.conversation_participants.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conversations (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- Name: farmer_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.farmer_profiles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    avatar character varying,
    bio text,
    county character varying,
    country character varying DEFAULT 'Kenya'::character varying,
    is_verified boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: farmer_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.farmer_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: farmer_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.farmer_profiles_id_seq OWNED BY public.farmer_profiles.id;


--
-- Name: farms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.farms (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    farm_name character varying,
    county character varying,
    sub_county character varying,
    ward character varying,
    farm_latitude double precision,
    farm_longitude double precision,
    farm_description text,
    farm_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: farms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.farms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: farms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.farms_id_seq OWNED BY public.farms.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id bigint NOT NULL,
    follower_id bigint NOT NULL,
    following_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: jwt_denylists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jwt_denylists (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: jwt_denylists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jwt_denylists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jwt_denylists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jwt_denylists_id_seq OWNED BY public.jwt_denylists.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    conversation_id bigint NOT NULL,
    user_id bigint NOT NULL,
    body text,
    read_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    content text,
    views integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    farm_id bigint NOT NULL,
    category character varying,
    product_name character varying,
    description text,
    quantity integer,
    unit character varying,
    price_per_unit numeric,
    age integer,
    harvest_date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resources (
    id bigint NOT NULL,
    title character varying,
    content text,
    publish_date timestamp(6) without time zone,
    cover_image character varying,
    author character varying,
    source character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    rating integer,
    comment text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    first_name character varying,
    last_name character varying,
    phone_number character varying,
    roles character varying[] DEFAULT '{}'::character varying[],
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    jti character varying NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: buyer_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buyer_profiles ALTER COLUMN id SET DEFAULT nextval('public.buyer_profiles_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: conversation_participants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversation_participants ALTER COLUMN id SET DEFAULT nextval('public.conversation_participants_id_seq'::regclass);


--
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- Name: farmer_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmer_profiles ALTER COLUMN id SET DEFAULT nextval('public.farmer_profiles_id_seq'::regclass);


--
-- Name: farms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farms ALTER COLUMN id SET DEFAULT nextval('public.farms_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: jwt_denylists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jwt_denylists ALTER COLUMN id SET DEFAULT nextval('public.jwt_denylists_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	product_images	Product	1	1	2026-03-06 07:28:57.81315
2	product_images	Product	1	2	2026-03-06 07:28:57.828756
3	product_images	Product	1	3	2026-03-06 07:28:57.842442
4	product_images	Product	1	4	2026-03-06 07:28:57.853766
5	post_images	Post	1	5	2026-03-07 19:44:08.901152
6	profile_picture	FarmerProfile	1	6	2026-03-08 16:09:01.100948
7	product_images	Product	2	7	2026-03-11 02:57:32.7935
8	product_images	Product	2	8	2026-03-11 02:57:32.798688
9	product_images	Product	2	9	2026-03-11 02:57:32.802636
10	product_images	Product	2	10	2026-03-11 02:57:32.806181
11	product_images	Product	2	11	2026-03-11 02:57:32.809591
12	product_images	Product	2	12	2026-03-11 02:57:32.813361
13	product_images	Product	2	13	2026-03-11 02:57:32.817202
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	lync5g2rqr0i82nrovee52nnx612	imgi_178_swartkop-dorper-kle-1.jpg	image/jpeg	{"identified":true,"width":1000,"height":667,"analyzed":true}	google	220932	OdY/3eY+kIut+kYNV2RDXA==	2026-03-06 07:28:57.806042
2	bqjjuhzxmcmx1jlzad15l9dofras	imgi_174_WhatsApp-Image-2023-11-07-at-4.05.30-PM.jpeg	image/jpeg	{"identified":true,"width":1170,"height":506,"analyzed":true}	google	226195	kO6wfq2HAFXBkpQeCwYeCg==	2026-03-06 07:28:57.822172
4	vrzeiqm49t4791m1wmo24azhncsg	imgi_204_we-sell-an_1728145722JHnGeC.png	image/png	{"identified":true,"width":683,"height":687,"analyzed":true}	google	632275	zTcJ52m8RHGdIAkcULmjfw==	2026-03-06 07:28:57.849381
3	eexgdpuhu26urn7201fvyv1ythk1	imgi_250_dorper.png	image/png	{"identified":true,"width":800,"height":561,"analyzed":true}	google	519653	PKuo9DoyLi/MfjLihymFBw==	2026-03-06 07:28:57.836062
5	mgotkokoed2pwvfqn8nl2voytda2	user1.webp	image/webp	{"identified":true,"width":3456,"height":4560,"analyzed":true}	google	501566	3tf2p273vlBdKZdSawym6w==	2026-03-07 19:44:08.892085
6	v12wb8cekvyoet222faw53tooslq	me.webp	image/webp	{"identified":true,"width":1820,"height":1024,"analyzed":true}	google	438258	XXhpSIRIy0IozwvEOvIowg==	2026-03-08 16:09:01.089849
7	vd927p5mady7robsvceo5jhix0ml	imgi_163_Black-garlic-bread-1-1024x683.jpg	image/jpeg	{"identified":true,"width":1024,"height":683,"analyzed":true}	google	250954	vmFkf7RX8mFQ07fa3gBeqg==	2026-03-11 02:57:32.791169
8	oxryetmk2oz7xqusdnmf5hovjh64	imgi_181_Kienyeji-Poultry-Farming.jpg	image/jpeg	{"identified":true,"width":1119,"height":918,"analyzed":true}	google	315938	sRT5CKB8npAVBHIVcMaQaw==	2026-03-11 02:57:32.796795
10	3nkpk9d6zdcnedyy3s1lf15psx9x	imgi_218_kenbro-cock-new.jpg	image/jpeg	{"identified":true,"width":1200,"height":1164,"analyzed":true}	google	195493	EblNo4eVyoYwcxOoBfQlnQ==	2026-03-11 02:57:32.804384
9	e21qv96ou8oqfpk5curzbyk8gzvf	imgi_192_indigenous-kienyeji-chicken-on-free-range-farming-in-kenya-2PDJP1X.jpg	image/jpeg	{"identified":true,"width":1300,"height":1065,"analyzed":true}	google	441426	I8ji1c4rQwx+yPeZ5VOD+w==	2026-03-11 02:57:32.801098
11	m7i7b8jr0tf473jiy96r958pczkr	imgi_201_901921N0011018281643053140042359.jpg	image/jpeg	{"identified":true,"width":1125,"height":1500,"analyzed":true}	google	795018	NaNZhzvrkSgeFCwuZ2WPTA==	2026-03-11 02:57:32.808145
12	trhwwlb6554ju7rn4q3fqs6yudz7	imgi_178_stock-photo-indigenous-kienyeji-chicken-free-range-poultry-farming-in-kenya-2269398333.jpg	image/jpeg	{"identified":true,"width":1500,"height":1225,"analyzed":true}	google	666959	2LBXGN1+XIouGqRg3Iq5ZQ==	2026-03-11 02:57:32.811572
13	0w76eci5lfeu0r2kcun5216wn2t5	imgi_229_1294272_516593138433831_86181040_o.jpg	image/jpeg	{"identified":true,"width":2048,"height":1536,"analyzed":true}	google	817397	a2WpeYI688JAolp6ZueSOg==	2026-03-11 02:57:32.815538
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2026-01-30 03:23:15.890993	2026-01-30 03:23:15.891006
schema_sha1	ac44bc02b7f6753dde4c694d74ca5137e4c9d8b1	2026-01-30 03:23:15.90413	2026-01-30 03:23:15.904137
\.


--
-- Data for Name: buyer_profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.buyer_profiles (id, user_id, avatar, location, county, country, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.comments (id, post_id, user_id, parent_id, comment_body, comment_likes, created_at, updated_at) FROM stdin;
1	1	2	\N	Hello I am here	0	2026-03-07 19:55:36.444971	2026-03-07 19:55:36.444971
2	1	3	1	niaje wasse	0	2026-03-08 16:07:55.382262	2026-03-08 16:07:55.382262
\.


--
-- Data for Name: conversation_participants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conversation_participants (id, conversation_id, user_id, joined_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conversations (id, title, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: farmer_profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.farmer_profiles (id, user_id, avatar, bio, county, country, is_verified, created_at, updated_at) FROM stdin;
1	3	\N	http://localhost:5173/email-confirmed?confirmed=true&userType=farmer	Makueni	Kenya	\N	2026-03-08 16:08:26.652447	2026-03-08 16:09:10.035114
2	1	\N	\N	\N	Kenya	\N	2026-03-10 03:15:51.836655	2026-03-10 03:15:51.836655
\.


--
-- Data for Name: farms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.farms (id, user_id, farm_name, county, sub_county, ward, farm_latitude, farm_longitude, farm_description, farm_type, created_at, updated_at) FROM stdin;
1	1	Muuluka Ranch	Makueni	Tulimani	Iiani	-1.2257825	36.9184879	Why this works better:\nTerminology: Calling it a "Mega Menu" tells the AI to look for grid-based layouts rather than a simple vertical list.\n\nHierarchy: Specifying "Information Architecture" helps the AI understand that it needs to think about how to group your links logically.\n\nSpacing: Using terms like "Airy" and "Premium" pushes the AI away from default, cramped browser styles.\n\nA quick tip for your CSS:\nTo achieve that "full-width container" look for the dropdown while the navbar is centered, you will likely need to set the dropdown's parent to position: static (or ensure the dropdown is position: absolute relative to the wide nav wrapper) and then give the dropdown itself the .container class or a matching max-width.\n\nWould you like me to suggest the specific "Category Titles" and link groupings for your Ministries before you run this in the agent?	dairy	2026-03-06 07:27:43.693759	2026-03-06 07:27:43.693759
2	3	Kiganjo	Nyeri	Kiganjo	Chaka	-1.2240947	36.9218479	WHAT MUST NOT CHANGE\n\nThe public route /products/:id must continue to work exactly as before for non-logged-in visitors and buyers — SecondaryNavbar, breadcrumb, and below_navbar all present\nThe FarmerProductDetails component (for the farmer's own products) is separate and must not be touched\nThe sidebar collapse state, TopDash greeting, and all existing dashboard behavior must remain unaffected\nThe reviews section, share functionality, contact farmer button, image gallery, and all product data rendering in BuyerProductDetails must remain fully functional in both modes	poultry	2026-03-11 02:54:02.344759	2026-03-11 02:54:02.344759
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.follows (id, follower_id, following_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: jwt_denylists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jwt_denylists (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.likes (id, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.messages (id, conversation_id, user_id, body, read_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.posts (id, user_id, content, views, created_at, updated_at) FROM stdin;
1	1	Help with doper farming tips	\N	2026-03-07 19:44:08.863633	2026-03-07 19:44:34.071981
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, farm_id, category, product_name, description, quantity, unit, price_per_unit, age, harvest_date, created_at, updated_at) FROM stdin;
1	1	livestock	Male Doper	Why this works better:\r\nTerminology: Calling it a "Mega Menu" tells the AI to look for grid-based layouts rather than a simple vertical list.\r\n\r\nHierarchy: Specifying "Information Architecture" helps the AI understand that it needs to think about how to group your links logically.\r\n\r\nSpacing: Using terms like "Airy" and "Premium" pushes the AI away from default, cramped browser styles.\r\n\r\nA quick tip for your CSS:\r\nTo achieve that "full-width container" look for the dropdown while the navbar is centered, you will likely need to set the dropdown's parent to position: static (or ensure the dropdown is position: absolute relative to the wide nav wrapper) and then give the dropdown itself the .container class or a matching max-width.\r\n\r\nWould you like me to suggest the specific "Category Titles" and link groupings for your Ministries before you run this in the agent?	22	animal	18000.0	16	\N	2026-03-06 07:28:57.7858	2026-03-06 07:29:16.149816
2	2	poultry	Kienyeji Chicken	WHAT MUST NOT CHANGE\r\n\r\nThe public route /products/:id must continue to work exactly as before for non-logged-in visitors and buyers — SecondaryNavbar, breadcrumb, and below_navbar all present\r\nThe FarmerProductDetails component (for the farmer's own products) is separate and must not be touched\r\nThe sidebar collapse state, TopDash greeting, and all existing dashboard behavior must remain unaffected\r\nThe reviews section, share functionality, contact farmer button, image gallery, and all product data rendering in BuyerProductDetails must remain fully functional in both modes	70	animal	1100.0	14	\N	2026-03-11 02:57:32.781688	2026-03-11 02:58:14.930946
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resources (id, title, content, publish_date, cover_image, author, source, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reviews (id, user_id, product_id, rating, comment, created_at, updated_at) FROM stdin;
1	3	1	5	What was listed on the website was exactly what i bought and at that same price. I recommend Kilimo Link to anyone who wants to sell any farm product  online. Kudos also to Mark Mwendwa	2026-03-10 03:19:15.877555	2026-03-10 03:19:15.877555
2	4	1	3	I found that the sheep was already sold out	2026-03-11 02:40:39.327619	2026-03-11 02:40:39.327619
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20251201075830
20251201075829
20251015094231
20250925201300
20250925201200
20250925201100
20250925201000
20250925161008
20250925160950
20250925160944
20250925160931
20250925155907
20250925155750
20250925155551
20250925155524
20250925155216
20250925153703
20250925153247
20250925153022
20250925152514
20260307191940
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, first_name, last_name, phone_number, roles, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, jti) FROM stdin;
2	lnjagi33@gmail.com	$2a$12$5RCYKBEJy5zwx5xuLq7jieo/kSpthGGgLjK4RLy4C1QSc3uQxc81i	\N	\N	2026-03-07 19:54:35.793343	Lillive	Kawira	+254721277960	{farmer}	2026-03-07 19:46:30.867653	2026-03-07 19:54:35.793724	Wytx5_o-JdGpAsiH8ahv	2026-03-07 19:54:05.899695	2026-03-07 19:46:30.867821	\N	6d92fac4-1bcf-4790-ad4d-bfef5ca99b0c
1	ntheimk@gmail.com	$2a$12$3v.fX88BPsY1ESOxbKSH8up5RXlZM/k88NHP/6Ek4iUCFg3ECRBb2	\N	\N	2026-01-30 03:25:41.666066	Mark	Mwendwa	+254717084324	{farmer}	2026-01-30 03:24:12.096659	2026-01-30 03:25:41.666433	xahV1-dysjs7gggh7-Zm	2026-01-30 03:25:21.729187	2026-01-30 03:24:12.096967	\N	5f69c291-45a5-45d6-a899-8cc59afc59fe
4	kilonzolukenthei@yahoo.com	$2a$12$FBJlx.ENKN3pr/G6omiJ7OW/8iM2WPCpfUiSi9.BiDTev6FC1FTt.	\N	\N	2026-03-10 03:25:19.633743	Luke	Kilonzo	+254722658492	{buyer}	2026-03-10 03:24:10.601236	2026-03-10 03:25:19.634114	1uu3vMBzdwJgHFc3TJ1Y	2026-03-10 03:25:01.18647	2026-03-10 03:24:10.60139	\N	a261449a-f3e3-4fbf-8e71-2a45e1c54297
3	mwendwamark96@gmail.com	$2a$12$5SmqCVlCcGztk92MA3/mLu/RTOixNjQkoT7VWdTRuVu9sUiWA8HMq	\N	\N	2026-03-08 16:07:28.584668	Mark	Mwendwa	+254717084323	{farmer}	2026-03-08 16:05:36.243566	2026-03-08 16:07:28.585076	ggAUyZzRM2YwTgHvbssA	2026-03-08 16:06:16.572535	2026-03-08 16:05:36.243887	\N	fb355ab9-2de2-4ef2-809d-6dba0cd516a7
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 13, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 13, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: buyer_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.buyer_profiles_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 2, true);


--
-- Name: conversation_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conversation_participants_id_seq', 1, false);


--
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conversations_id_seq', 1, false);


--
-- Name: farmer_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.farmer_profiles_id_seq', 2, true);


--
-- Name: farms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.farms_id_seq', 2, true);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.follows_id_seq', 1, false);


--
-- Name: jwt_denylists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jwt_denylists_id_seq', 1, false);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 2, true);


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.resources_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reviews_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: buyer_profiles buyer_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buyer_profiles
    ADD CONSTRAINT buyer_profiles_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: conversation_participants conversation_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversation_participants
    ADD CONSTRAINT conversation_participants_pkey PRIMARY KEY (id);


--
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: farmer_profiles farmer_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmer_profiles
    ADD CONSTRAINT farmer_profiles_pkey PRIMARY KEY (id);


--
-- Name: farms farms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: jwt_denylists jwt_denylists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jwt_denylists
    ADD CONSTRAINT jwt_denylists_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_buyer_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_buyer_profiles_on_user_id ON public.buyer_profiles USING btree (user_id);


--
-- Name: index_comments_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_parent_id ON public.comments USING btree (parent_id);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_post_id ON public.comments USING btree (post_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_conversation_participants_on_conversation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conversation_participants_on_conversation_id ON public.conversation_participants USING btree (conversation_id);


--
-- Name: index_conversation_participants_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conversation_participants_on_user_id ON public.conversation_participants USING btree (user_id);


--
-- Name: index_farmer_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_farmer_profiles_on_user_id ON public.farmer_profiles USING btree (user_id);


--
-- Name: index_farms_on_county; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_farms_on_county ON public.farms USING btree (county);


--
-- Name: index_farms_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_farms_on_user_id ON public.farms USING btree (user_id);


--
-- Name: index_follows_on_follower_id_and_following_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_follows_on_follower_id_and_following_id ON public.follows USING btree (follower_id, following_id);


--
-- Name: index_follows_on_following_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_follows_on_following_id ON public.follows USING btree (following_id);


--
-- Name: index_likes_on_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_likes_on_post_id ON public.likes USING btree (post_id);


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_likes_on_user_id ON public.likes USING btree (user_id);


--
-- Name: index_messages_on_conversation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_conversation_id ON public.messages USING btree (conversation_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_user_id ON public.messages USING btree (user_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_user_id ON public.posts USING btree (user_id);


--
-- Name: index_products_on_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_category ON public.products USING btree (category);


--
-- Name: index_products_on_created_at_and_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_created_at_and_id ON public.products USING btree (created_at DESC, id DESC);


--
-- Name: index_products_on_description_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_description_trgm ON public.products USING gin (description public.gin_trgm_ops);


--
-- Name: index_products_on_farm_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_farm_id ON public.products USING btree (farm_id);


--
-- Name: index_products_on_price_per_unit; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_price_per_unit ON public.products USING btree (price_per_unit);


--
-- Name: index_products_on_product_name_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_product_name_trgm ON public.products USING gin (product_name public.gin_trgm_ops);


--
-- Name: index_reviews_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reviews_on_product_id ON public.reviews USING btree (product_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_jti; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_jti ON public.users USING btree (jti);


--
-- Name: index_users_on_phone_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_phone_number ON public.users USING btree (phone_number);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: likes fk_rails_1e09b5dabf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_1e09b5dabf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products fk_rails_1f65848341; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_1f65848341 FOREIGN KEY (farm_id) REFERENCES public.farms(id);


--
-- Name: messages fk_rails_273a25a7a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_rails_273a25a7a6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: farms fk_rails_2a5f4d1971; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farms
    ADD CONSTRAINT fk_rails_2a5f4d1971 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_2fd19c0db7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_2fd19c0db7 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: comments fk_rails_31554e7034; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_31554e7034 FOREIGN KEY (parent_id) REFERENCES public.comments(id);


--
-- Name: conversation_participants fk_rails_39b25ba31e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversation_participants
    ADD CONSTRAINT fk_rails_39b25ba31e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: follows fk_rails_622d34a301; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_rails_622d34a301 FOREIGN KEY (follower_id) REFERENCES public.users(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: messages fk_rails_7f927086d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_rails_7f927086d2 FOREIGN KEY (conversation_id) REFERENCES public.conversations(id);


--
-- Name: likes fk_rails_87a8aac469; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_87a8aac469 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: follows fk_rails_9cfc70f043; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_rails_9cfc70f043 FOREIGN KEY (following_id) REFERENCES public.users(id);


--
-- Name: farmer_profiles fk_rails_b199d1bddc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmer_profiles
    ADD CONSTRAINT fk_rails_b199d1bddc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews fk_rails_bedd9094d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_bedd9094d4 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: buyer_profiles fk_rails_c1e142d51a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buyer_profiles
    ADD CONSTRAINT fk_rails_c1e142d51a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: conversation_participants fk_rails_d4fdd4cae0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversation_participants
    ADD CONSTRAINT fk_rails_d4fdd4cae0 FOREIGN KEY (conversation_id) REFERENCES public.conversations(id);


--
-- PostgreSQL database dump complete
--

\unrestrict MP4xrsQ20i9IqBaqoV5SW5PvfjAde6CUPUhRBcgOwwP50871ihJM0x2N2Q3MceU

