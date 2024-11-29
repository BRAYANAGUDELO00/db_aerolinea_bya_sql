--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.6

-- Started on 2024-11-28 21:24:25

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
-- TOC entry 215 (class 1259 OID 16667)
-- Name: aerolineas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aerolineas (
    codigo_iata character varying(10) NOT NULL,
    nombre character varying(100) NOT NULL,
    pais_origen character varying(100) NOT NULL
);


ALTER TABLE public.aerolineas OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16687)
-- Name: aeropuertos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aeropuertos (
    codigo_iata character varying(10) NOT NULL,
    nombre character varying(100) NOT NULL,
    ciudad character varying(100) NOT NULL,
    pais character varying(100) NOT NULL
);


ALTER TABLE public.aeropuertos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16672)
-- Name: aviones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aviones (
    matricula character varying(20) NOT NULL,
    modelo character varying(50) NOT NULL,
    capacidad integer NOT NULL,
    aerolinea_fk character varying(10) NOT NULL
);


ALTER TABLE public.aviones OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16682)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    numero_empleado character varying(20) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    cargo character varying(50) NOT NULL,
    tipo_licencia character varying(20)
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16737)
-- Name: hoteles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hoteles (
    id_hotel character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(200) NOT NULL,
    ciudad character varying(100) NOT NULL,
    numero_estrellas integer NOT NULL
);


ALTER TABLE public.hoteles OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16742)
-- Name: paquetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paquetes (
    id_paquete character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(200),
    precio numeric(10,2) NOT NULL,
    vuelo_fk character varying(20) NOT NULL,
    hotel_fk character varying(20) NOT NULL
);


ALTER TABLE public.paquetes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16717)
-- Name: pasajeros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pasajeros (
    numero_documento character varying(20) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    genero character varying(10) NOT NULL
);


ALTER TABLE public.pasajeros OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16722)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    codigo_reserva character varying(20) NOT NULL,
    pasajero_fk character varying(20) NOT NULL,
    vuelo_fk character varying(20) NOT NULL,
    asiento character varying(10) NOT NULL,
    fecha_compra date NOT NULL
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16692)
-- Name: vuelos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelos (
    numero_vuelo character varying(20) NOT NULL,
    origen character varying(10) NOT NULL,
    destino character varying(10) NOT NULL,
    fecha_hora_salida timestamp without time zone NOT NULL,
    fecha_hora_llegada timestamp without time zone NOT NULL,
    avion_fk character varying(20) NOT NULL,
    aerolinea_fk character varying(10) NOT NULL
);


ALTER TABLE public.vuelos OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 16667)
-- Dependencies: 215
-- Data for Name: aerolineas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aerolineas (codigo_iata, nombre, pais_origen) FROM stdin;
AA	American Airlines	Estados Unidos
AF	Air France	Francia
IB	Iberia	Espa¤a
LH	Lufthansa	Alemania
AM	Aerom‚xico	M‚xico
UA	United Airlines	Estados Unidos
DL	Delta Airlines	Estados Unidos
BA	British Airways	Reino Unido
KL	KLM	Pa¡ses Bajos
CX	Cathay Pacific	Hong Kong
QF	Qantas Airways	Australia
AI	Air India	India
SA	South African Airways	Sud frica
TG	Thai Airways	Tailandia
EK	Emirates	Emiratos µrabes Unidos
QR	Qatar Airways	Catar
ET	Ethiopian Airlines	Etiop¡a
MH	Malaysia Airlines	Malasia
JL	Japan Airlines	Jap¢n
CA	Air China	China
KE	Korean Air	Corea del Sur
NH	All Nippon Airways	Jap¢n
NZ	Air New Zealand	Nueva Zelanda
SV	Saudia	Arabia Saudita
TK	Turkish Airlines	Turqu¡a
AZ	Alitalia	Italia
VA	Virgin Australia	Australia
HU	Hainan Airlines	China
GA	Garuda Indonesia	Indonesia
CM	Copa Airlines	Panam 
\.


--
-- TOC entry 4892 (class 0 OID 16687)
-- Dependencies: 218
-- Data for Name: aeropuertos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aeropuertos (codigo_iata, nombre, ciudad, pais) FROM stdin;
JFK	John F. Kennedy International Airport	Nueva York	Estados Unidos
LAX	Los Angeles International Airport	Los µngeles	Estados Unidos
ORD	Chicago O Hare International Airport	Chicago	Estados Unidos
ATL	Hartsfield-Jackson Atlanta International Airport	Atlanta	Estados Unidos
CDG	Charles de Gaulle Airport	Par¡s	Francia
MAD	Adolfo Su rez Madrid-Barajas Airport	Madrid	Espa¤a
MEX	Aeropuerto Internacional Benito Ju rez	Ciudad de M‚xico	M‚xico
LHR	Heathrow Airport	Londres	Reino Unido
FRA	Frankfurt am Main Airport	Frankfurt	Alemania
DXB	Dubai International Airport	Dub i	Emiratos µrabes Unidos
HND	Tokyo Haneda Airport	Tokio	Jap¢n
SYD	Sydney Kingsford Smith Airport	S¡dney	Australia
AMS	Amsterdam Schiphol Airport	µmsterdam	Pa¡ses Bajos
GRU	SÆo Paulo/Guarulhos-Governador Franco Montoro Airport	SÆo Paulo	Brasil
YYZ	Toronto Pearson International Airport	Toronto	Canad 
HKG	Hong Kong International Airport	Hong Kong	China
SIN	Singapore Changi Airport	Singapur	Singapur
ICN	Incheon International Airport	Se£l	Corea del Sur
BKK	Suvarnabhumi Airport	Bangkok	Tailandia
MIA	Miami International Airport	Miami	Estados Unidos
DUB	Dublin Airport	Dubl¡n	Irlanda
SFO	San Francisco International Airport	San Francisco	Estados Unidos
CUN	Canc£n International Airport	Canc£n	M‚xico
BCN	Barcelona-El Prat Airport	Barcelona	Espa¤a
FCO	Leonardo da Vinci-Fiumicino Airport	Roma	Italia
DOH	Hamad International Airport	Doha	Catar
JNB	O.R. Tambo International Airport	Johannesburgo	Sud frica
SEA	Seattle-Tacoma International Airport	Seattle	Estados Unidos
MUC	Munich Airport	M£nich	Alemania
DEL	Indira Gandhi International Airport	Delhi	India
\.


--
-- TOC entry 4890 (class 0 OID 16672)
-- Dependencies: 216
-- Data for Name: aviones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aviones (matricula, modelo, capacidad, aerolinea_fk) FROM stdin;
N123AA	Boeing 737	180	AA
F456AF	Airbus A320	160	AF
EC789IB	Boeing 777	350	IB
D321LH	Airbus A380	800	LH
M654AM	Embraer 190	100	AM
UA1234	Boeing 747	416	UA
DL5678	Airbus A350	315	DL
BA9012	Boeing 767	261	BA
KL3456	Embraer E175	76	KL
CX7890	Airbus A330	277	CX
QF5671	Boeing 737 MAX	210	QF
AI9013	Boeing 787	242	AI
SA3458	Airbus A340	380	SA
TG7892	Boeing 747-400	416	TG
EK1237	Airbus A380	850	EK
QR2346	Boeing 777	360	QR
ET7890	Airbus A350	306	ET
MH2345	Boeing 737	189	MH
JL4567	Boeing 777	315	JL
CA1238	Airbus A321	200	CA
KE7894	Boeing 737 MAX	230	KE
NH2347	Boeing 787	242	NH
NZ5679	Airbus A320	180	NZ
SV9011	Boeing 747	416	SV
TK3457	Boeing 737	180	TK
AZ7893	Airbus A330	277	AZ
VA1236	Boeing 737	186	VA
HU5670	Airbus A350	315	HU
GA4569	Boeing 737	180	GA
CM3456	Embraer 190	96	CM
\.


--
-- TOC entry 4891 (class 0 OID 16682)
-- Dependencies: 217
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (numero_empleado, nombre, apellido, cargo, tipo_licencia) FROM stdin;
EMP001	Juan	P‚rez	Piloto	A12345
EMP002	Mar¡a	L¢pez	Azafata	\N
EMP003	Carlos	Mart¡nez	Piloto	B67890
EMP004	Ana	G¢mez	Mec nico	\N
EMP005	Javier	S nchez	Piloto	C54321
EMP006	Luc¡a	Hern ndez	Azafata	\N
EMP007	Pedro	Ram¡rez	Mec nico	\N
EMP008	Laura	Fern ndez	Piloto	D12367
EMP009	Daniel	Jim‚nez	Azafato	\N
EMP010	Sof¡a	Castillo	Piloto	E78912
EMP011	Ra£l	Vargas	Azafato	\N
EMP012	Elena	Ortiz	Azafata	\N
EMP013	Luis	Moreno	Mec nico	\N
EMP014	Carla	N£¤ez	Piloto	F65478
EMP015	Adriana	Cruz	Azafata	\N
EMP016	Miguel	Medina	Piloto	G09876
EMP017	Patricia	Navarro	Azafata	\N
EMP018	Francisco	Guti‚rrez	Mec nico	\N
EMP019	Julia	Ramos	Azafata	\N
EMP020	Andr‚s	Mart¡n	Piloto	H56734
EMP021	Gabriela	Flores	Azafata	\N
EMP022	V¡ctor	Silva	Mec nico	\N
EMP023	Natalia	Torres	Azafata	\N
EMP024	C‚sar	Ruiz	Piloto	I90812
EMP025	Diana	Molina	Azafata	\N
EMP026	Rafael	µlvarez	Mec nico	\N
EMP027	Paola	Reyes	Azafata	\N
EMP028	Esteban	Garc¡a	Piloto	J12389
EMP029	Beatriz	Romero	Azafata	\N
EMP030	Roberto	Paredes	Mec nico	\N
\.


--
-- TOC entry 4896 (class 0 OID 16737)
-- Dependencies: 222
-- Data for Name: hoteles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hoteles (id_hotel, nombre, direccion, ciudad, numero_estrellas) FROM stdin;
\.


--
-- TOC entry 4897 (class 0 OID 16742)
-- Dependencies: 223
-- Data for Name: paquetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paquetes (id_paquete, nombre, descripcion, precio, vuelo_fk, hotel_fk) FROM stdin;
\.


--
-- TOC entry 4894 (class 0 OID 16717)
-- Dependencies: 220
-- Data for Name: pasajeros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pasajeros (numero_documento, nombre, apellido, fecha_nacimiento, genero) FROM stdin;
\.


--
-- TOC entry 4895 (class 0 OID 16722)
-- Dependencies: 221
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (codigo_reserva, pasajero_fk, vuelo_fk, asiento, fecha_compra) FROM stdin;
\.


--
-- TOC entry 4893 (class 0 OID 16692)
-- Dependencies: 219
-- Data for Name: vuelos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vuelos (numero_vuelo, origen, destino, fecha_hora_salida, fecha_hora_llegada, avion_fk, aerolinea_fk) FROM stdin;
\.


--
-- TOC entry 4720 (class 2606 OID 16671)
-- Name: aerolineas aerolineas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerolineas
    ADD CONSTRAINT aerolineas_pkey PRIMARY KEY (codigo_iata);


--
-- TOC entry 4726 (class 2606 OID 16691)
-- Name: aeropuertos aeropuertos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeropuertos
    ADD CONSTRAINT aeropuertos_pkey PRIMARY KEY (codigo_iata);


--
-- TOC entry 4722 (class 2606 OID 16676)
-- Name: aviones aviones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviones
    ADD CONSTRAINT aviones_pkey PRIMARY KEY (matricula);


--
-- TOC entry 4724 (class 2606 OID 16686)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (numero_empleado);


--
-- TOC entry 4734 (class 2606 OID 16741)
-- Name: hoteles hoteles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pkey PRIMARY KEY (id_hotel);


--
-- TOC entry 4736 (class 2606 OID 16746)
-- Name: paquetes paquetes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_pkey PRIMARY KEY (id_paquete);


--
-- TOC entry 4730 (class 2606 OID 16721)
-- Name: pasajeros pasajeros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasajeros
    ADD CONSTRAINT pasajeros_pkey PRIMARY KEY (numero_documento);


--
-- TOC entry 4732 (class 2606 OID 16726)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (codigo_reserva);


--
-- TOC entry 4728 (class 2606 OID 16696)
-- Name: vuelos vuelos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_pkey PRIMARY KEY (numero_vuelo);


--
-- TOC entry 4737 (class 2606 OID 16677)
-- Name: aviones aviones_aerolinea_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviones
    ADD CONSTRAINT aviones_aerolinea_fk_fkey FOREIGN KEY (aerolinea_fk) REFERENCES public.aerolineas(codigo_iata);


--
-- TOC entry 4744 (class 2606 OID 16752)
-- Name: paquetes paquetes_hotel_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_hotel_fk_fkey FOREIGN KEY (hotel_fk) REFERENCES public.hoteles(id_hotel);


--
-- TOC entry 4745 (class 2606 OID 16747)
-- Name: paquetes paquetes_vuelo_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_vuelo_fk_fkey FOREIGN KEY (vuelo_fk) REFERENCES public.vuelos(numero_vuelo);


--
-- TOC entry 4742 (class 2606 OID 16727)
-- Name: reservas reservas_pasajero_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pasajero_fk_fkey FOREIGN KEY (pasajero_fk) REFERENCES public.pasajeros(numero_documento);


--
-- TOC entry 4743 (class 2606 OID 16732)
-- Name: reservas reservas_vuelo_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_vuelo_fk_fkey FOREIGN KEY (vuelo_fk) REFERENCES public.vuelos(numero_vuelo);


--
-- TOC entry 4738 (class 2606 OID 16712)
-- Name: vuelos vuelos_aerolinea_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_aerolinea_fk_fkey FOREIGN KEY (aerolinea_fk) REFERENCES public.aerolineas(codigo_iata);


--
-- TOC entry 4739 (class 2606 OID 16707)
-- Name: vuelos vuelos_avion_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_avion_fk_fkey FOREIGN KEY (avion_fk) REFERENCES public.aviones(matricula);


--
-- TOC entry 4740 (class 2606 OID 16702)
-- Name: vuelos vuelos_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_destino_fkey FOREIGN KEY (destino) REFERENCES public.aeropuertos(codigo_iata);


--
-- TOC entry 4741 (class 2606 OID 16697)
-- Name: vuelos vuelos_origen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_origen_fkey FOREIGN KEY (origen) REFERENCES public.aeropuertos(codigo_iata);


-- Completed on 2024-11-28 21:24:25

--
-- PostgreSQL database dump complete
--

