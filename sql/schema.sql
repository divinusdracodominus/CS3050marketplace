--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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
-- Name: marketplace; Type: SCHEMA; Schema: -; Owner: cardinal
--

CREATE SCHEMA marketplace;


ALTER SCHEMA marketplace OWNER TO cardinal;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: marketplace; Owner: cardinal
--

CREATE TABLE marketplace.addresses (
    id uuid NOT NULL,
    street character varying(40),
    city text,
    state text,
    country character varying(2),
    zip_code integer
);


ALTER TABLE marketplace.addresses OWNER TO cardinal;

--
-- Name: items; Type: TABLE; Schema: marketplace; Owner: cardinal
--

CREATE TABLE marketplace.items (
    id uuid NOT NULL,
    name text NOT NULL,
    quantity integer,
    description text,
    posted timestamp without time zone DEFAULT now(),
    seller uuid
);


ALTER TABLE marketplace.items OWNER TO cardinal;

--
-- Name: purchaserel; Type: TABLE; Schema: marketplace; Owner: cardinal
--

CREATE TABLE marketplace.purchaserel (
    purchase uuid,
    item uuid
);


ALTER TABLE marketplace.purchaserel OWNER TO cardinal;

--
-- Name: purchases; Type: TABLE; Schema: marketplace; Owner: cardinal
--

CREATE TABLE marketplace.purchases (
    id uuid NOT NULL,
    date timestamp without time zone DEFAULT now(),
    purchaser uuid
);


ALTER TABLE marketplace.purchases OWNER TO cardinal;

--
-- Name: shipments; Type: TABLE; Schema: marketplace; Owner: cardinal
--

CREATE TABLE marketplace.shipments (
    id uuid NOT NULL,
    purchase uuid,
    address uuid,
    tracking_number character varying(40)
);


ALTER TABLE marketplace.shipments OWNER TO cardinal;

--
-- Name: users; Type: TABLE; Schema: marketplace; Owner: cardinal
--

CREATE TABLE marketplace.users (
    id uuid NOT NULL,
    email text NOT NULL,
    create_date timestamp without time zone DEFAULT now(),
    password character varying(30)
);


ALTER TABLE marketplace.users OWNER TO cardinal;

--
-- Data for Name: addresses; Type: TABLE DATA; Schema: marketplace; Owner: cardinal
--

COPY marketplace.addresses (id, street, city, state, country, zip_code) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: marketplace; Owner: cardinal
--

COPY marketplace.items (id, name, quantity, description, posted, seller) FROM stdin;
\.


--
-- Data for Name: purchaserel; Type: TABLE DATA; Schema: marketplace; Owner: cardinal
--

COPY marketplace.purchaserel (purchase, item) FROM stdin;
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: marketplace; Owner: cardinal
--

COPY marketplace.purchases (id, date, purchaser) FROM stdin;
\.


--
-- Data for Name: shipments; Type: TABLE DATA; Schema: marketplace; Owner: cardinal
--

COPY marketplace.shipments (id, purchase, address, tracking_number) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: marketplace; Owner: cardinal
--

COPY marketplace.users (id, email, create_date, password) FROM stdin;
\.


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: items item_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.items
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- Name: purchases purchase_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.purchases
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);


--
-- Name: shipments shipment_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.shipments
    ADD CONSTRAINT shipment_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: items items_seller_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.items
    ADD CONSTRAINT items_seller_fkey FOREIGN KEY (seller) REFERENCES marketplace.users(id);


--
-- Name: purchaserel purchase_items_item_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.purchaserel
    ADD CONSTRAINT purchase_items_item_fkey FOREIGN KEY (item) REFERENCES marketplace.items(id);


--
-- Name: purchaserel purchase_items_purchase_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.purchaserel
    ADD CONSTRAINT purchase_items_purchase_fkey FOREIGN KEY (purchase) REFERENCES marketplace.purchases(id);


--
-- Name: purchases purchase_purchaser_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.purchases
    ADD CONSTRAINT purchase_purchaser_fkey FOREIGN KEY (purchaser) REFERENCES marketplace.users(id);


--
-- Name: shipments shipment_address_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.shipments
    ADD CONSTRAINT shipment_address_fkey FOREIGN KEY (address) REFERENCES marketplace.addresses(id);


--
-- Name: shipments shipment_purchase_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: cardinal
--

ALTER TABLE ONLY marketplace.shipments
    ADD CONSTRAINT shipment_purchase_fkey FOREIGN KEY (purchase) REFERENCES marketplace.purchases(id);


--
-- PostgreSQL database dump complete
--

