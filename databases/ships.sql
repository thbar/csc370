--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: battles; Type: TABLE; Schema: public; Owner: dmg; Tablespace: 
--

CREATE TABLE battles (
    battle character(30) NOT NULL,
    bdate integer
);


ALTER TABLE battles OWNER TO dmg;

--
-- Name: classes; Type: TABLE; Schema: public; Owner: dmg; Tablespace: 
--

CREATE TABLE classes (
    class character(20) NOT NULL,
    country character(30),
    numgus integer,
    bore double precision,
    displacement double precision
);


ALTER TABLE classes OWNER TO dmg;

--
-- Name: outcomes; Type: TABLE; Schema: public; Owner: dmg; Tablespace: 
--

CREATE TABLE outcomes (
    shipname character(30) NOT NULL,
    battle character(20) NOT NULL,
    result character(20)
);


ALTER TABLE outcomes OWNER TO dmg;

--
-- Name: r; Type: TABLE; Schema: public; Owner: dmg; Tablespace: 
--

CREATE TABLE r (
    a integer,
    b integer
);


ALTER TABLE r OWNER TO dmg;

--
-- Name: s; Type: TABLE; Schema: public; Owner: dmg; Tablespace: 
--

CREATE TABLE s (
    a integer,
    c integer
);


ALTER TABLE s OWNER TO dmg;

--
-- Name: ships; Type: TABLE; Schema: public; Owner: dmg; Tablespace: 
--

CREATE TABLE ships (
    shipname character(30) NOT NULL,
    class character(20),
    launched date
);


ALTER TABLE ships OWNER TO dmg;

--
-- Data for Name: battles; Type: TABLE DATA; Schema: public; Owner: dmg
--

COPY battles (battle, bdate) FROM stdin;
Tsushima                      	1905
Yellow Sea                    	1904
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: dmg
--

COPY classes (class, country, numgus, bore, displacement) FROM stdin;
Petropavlovsk       	Russia                        	\N	\N	\N
Pallada             	Russia                        	40	\N	6839
Kasuga              	Japan                         	37	\N	7750
Nisshin             	Japan                         	35	\N	7822
Peresvet            	Russia                        	\N	\N	\N
\.


--
-- Data for Name: outcomes; Type: TABLE DATA; Schema: public; Owner: dmg
--

COPY outcomes (shipname, battle, result) FROM stdin;
Kasuga                        	Yellow Sea          	ok                  
Nisshin                       	Yellow Sea          	ok                  
Kasuga                        	Tsushima            	ok                  
Nisshin                       	Tsushima            	ok                  
Pallada                       	Yellow Sea          	damaged             
Diana                         	Yellow Sea          	Light damage        
Oslyabya                      	Tsushima            	sunk                
Peresvet                      	Tsushima            	captured            
Pobeda                        	Tsushima            	captured            
\.


--
-- Data for Name: r; Type: TABLE DATA; Schema: public; Owner: dmg
--

COPY r (a, b) FROM stdin;
0	20
1	30
\.


--
-- Data for Name: s; Type: TABLE DATA; Schema: public; Owner: dmg
--

COPY s (a, c) FROM stdin;
0	0
2	-1
\.


--
-- Data for Name: ships; Type: TABLE DATA; Schema: public; Owner: dmg
--

COPY ships (shipname, class, launched) FROM stdin;
Kasuga                        	Kasuga              	1902-10-22
Nisshin                       	Nisshin             	1903-02-09
Pallada                       	Pallada             	1899-08-01
Diana                         	Pallada             	1899-10-01
Aurora                        	Pallada             	\N
Oslyabya                      	Peresvet            	1898-12-08
Peresvet                      	Peresvet            	1898-05-19
Pobeda                        	Peresvet            	\N
\.


--
-- Name: battles_pkey; Type: CONSTRAINT; Schema: public; Owner: dmg; Tablespace: 
--

ALTER TABLE ONLY battles
    ADD CONSTRAINT battles_pkey PRIMARY KEY (battle);


--
-- Name: classes_pkey; Type: CONSTRAINT; Schema: public; Owner: dmg; Tablespace: 
--

ALTER TABLE ONLY classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (class);


--
-- Name: outcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: dmg; Tablespace: 
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT outcomes_pkey PRIMARY KEY (shipname, battle);


--
-- Name: ships_pkey; Type: CONSTRAINT; Schema: public; Owner: dmg; Tablespace: 
--

ALTER TABLE ONLY ships
    ADD CONSTRAINT ships_pkey PRIMARY KEY (shipname);


--
-- Name: outcomes_battle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dmg
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT outcomes_battle_fkey FOREIGN KEY (battle) REFERENCES battles(battle);


--
-- Name: outcomes_shipname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dmg
--

ALTER TABLE ONLY outcomes
    ADD CONSTRAINT outcomes_shipname_fkey FOREIGN KEY (shipname) REFERENCES ships(shipname);


--
-- Name: ships_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dmg
--

ALTER TABLE ONLY ships
    ADD CONSTRAINT ships_class_fkey FOREIGN KEY (class) REFERENCES classes(class);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

