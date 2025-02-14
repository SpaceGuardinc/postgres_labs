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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: children; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.children (
    name_child character varying(50) NOT NULL,
    sex_child character(1) DEFAULT 'm'::bpchar,
    born date,
    id_child character(5) NOT NULL,
    CONSTRAINT check_sex CHECK ((sex_child = ANY (ARRAY['m'::bpchar, 'w'::bpchar])))
);


ALTER TABLE public.children OWNER TO postgres;

--
-- Name: departament; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departament (
    id_departament numeric(2,0) NOT NULL,
    name_departament character varying(80) NOT NULL
);


ALTER TABLE public.departament OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id_employee character(5) NOT NULL,
    name_employee character varying(50) NOT NULL,
    post_employee character varying(35) NOT NULL,
    salary numeric(7,2) NOT NULL,
    born date NOT NULL,
    phone character(11),
    id_departament numeric(2,0),
    CONSTRAINT check_salary CHECK ((salary > (9600)::numeric))
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Data for Name: children; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.children (name_child, sex_child, born, id_child) FROM stdin;
тАЪ┬а╨▒╨┐	m	2002-01-02	1    
╨П╥Р╨▓╨┐	m	2001-03-03	2    
╨К┬а╨╕┬а	w	2004-02-10	3    
тАЮ┬а╨╕┬а	w	2002-10-03	4    
╨К╨Б╨╕┬а	m	2002-04-02	5    
\.


--
-- Data for Name: departament; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departament (id_departament, name_departament) FROM stdin;
1	тАЮ╥Р╨З┬а╨░╨▓┬а┬м╥Р┬н╨▓ ╨Б┬н╨┤┬о╨░┬м┬а╨╢╨Б┬о┬н┬н╨╗╨╡ ╨▓╥Р╨╡┬н┬о┬л┬о╨И╨Б┬й
2	╨Г╨│╨╡╨И┬а┬л╨▓╥Р╨░╨Б╨┐
3	╨П┬л┬а┬н┬о╤Ю╨╗┬й ┬о╨▓┬д╥Р┬л
4	╨Л╨▓┬д╥Р┬л ╨Д┬а┬д╨░┬о╤Ю
5	╨Л╨▓┬д╥Р┬л ╨▓╥Р╨╡┬н╨Б╨╖╥Р╨▒╨Д┬о╨И┬о ╨Д┬о┬н╨▓╨░┬о┬л╨┐
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id_employee, name_employee, post_employee, salary, born, phone, id_departament) FROM stdin;
1    	╤Т╨╛┬м╨Б┬н тАЪ.╨П.	╨М┬а╨╖┬а┬л╨╝┬н╨Б╨Д ┬о╨▓┬д╥Р┬л┬а	48000.00	1970-02-01	115-20-12  	1
2    	тАШ╥Р╨░┬о╤Ю ╤У.тАЭ.	╨П╨░┬о╨И╨░┬а┬м┬м╨Б╨▒╨▓	70000.00	2000-10-20	120-13-11  	3
3    	╨Й╥Р╨Д┬о╤Ю тАЮ.╨В.	╨Г╨│╨╡╨И┬а┬л╨▓╥Р╨░	40000.00	1990-10-10	124-31-31  	5
4    	тА╣┬а╨░╨Б┬н┬а ╨К.тАЪ.	╨╜╨Д┬о┬н┬о┬м╨Б╨▒╨▓	45000.00	1995-01-12	131-41-54  	2
5    	╨Й┬а╨╕╨Б┬н┬а ╨М.╨В.	╨╛╨░╨Б╨▒╨▓	55000.00	1998-07-15	121-24-13  	4
E001 	тВм╤Ю┬а┬н┬о╤Ю тВм.тВм.	╨К╥Р┬н╥Р┬д┬ж╥Р╨░	50000.00	1985-07-12	12345678901	1
E002 	╨П╥Р╨▓╨░┬о╤Ю ╨П.╨П.	тВм┬н┬ж╥Р┬н╥Р╨░	55000.00	1990-05-20	98765432100	1
E003 	тАШ╨Б┬д┬о╨░┬о╤Ю тАШ.тАШ.	╨В┬н┬а┬л╨Б╨▓╨Б╨Д	60000.00	1988-03-15	12312312312	1
E004 	╨Й╨│┬з┬н╥Р╨╢┬о╤Ю ╨Й.╨Й.	тАЮ╨Б┬з┬а┬й┬н╥Р╨░	62000.00	1992-11-10	32132132100	1
\.


--
-- Name: children pk_child; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.children
    ADD CONSTRAINT pk_child PRIMARY KEY (id_child, name_child);


--
-- Name: departament pk_departament; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departament
    ADD CONSTRAINT pk_departament PRIMARY KEY (id_departament);


--
-- Name: employees pk_employee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employee PRIMARY KEY (id_employee);


--
-- Name: employees ref_departament; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT ref_departament FOREIGN KEY (id_departament) REFERENCES public.departament(id_departament);


--
-- Name: children ref_employees; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.children
    ADD CONSTRAINT ref_employees FOREIGN KEY (id_child) REFERENCES public.employees(id_employee);


--
-- Name: TABLE children; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.children TO spaceguard;


--
-- Name: TABLE departament; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.departament TO spaceguard;


--
-- Name: TABLE employees; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.employees TO spaceguard;


--
-- PostgreSQL database dump complete
--

