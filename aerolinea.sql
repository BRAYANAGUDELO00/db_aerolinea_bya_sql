--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-29 12:36:33

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
-- TOC entry 215 (class 1259 OID 16791)
-- Name: aerolineas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aerolineas (
    codigo_iata character varying(10) NOT NULL,
    nombre character varying(100) NOT NULL,
    pais_origen character varying(100) NOT NULL
);


ALTER TABLE public.aerolineas OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16811)
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
-- TOC entry 216 (class 1259 OID 16796)
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
-- TOC entry 217 (class 1259 OID 16806)
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
-- TOC entry 222 (class 1259 OID 16861)
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
-- TOC entry 223 (class 1259 OID 16866)
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
-- TOC entry 220 (class 1259 OID 16841)
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
-- TOC entry 221 (class 1259 OID 16846)
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
-- TOC entry 219 (class 1259 OID 16816)
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
-- TOC entry 4835 (class 0 OID 16791)
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
-- TOC entry 4838 (class 0 OID 16811)
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
ADD	Addis Ababa Bole International Airport	Ad¡s Abeba	Etiop¡a
KUL	Kuala Lumpur International Airport	Kuala Lumpur	Malasia
CGK	Soekarno-Hatta International Airport	Yakarta	Indonesia
PTY	Tocumen International Airport	Ciudad de Panam 	Panam 
RUH	King Khalid International Airport	Riad	Arabia Saudita
IST	Istanbul Airport	Estambul	Turqu¡a
NRT	Narita International Airport	Tokio	Jap¢n
AKL	Auckland Airport	Auckland	Nueva Zelanda
MEL	Melbourne Airport	Melbourne	Australia
DPS	Ngurah Rai International Airport	Denpasar	Indonesia
PEK	Beijing Capital International Airport	Pek¡n	China
\.


--
-- TOC entry 4836 (class 0 OID 16796)
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
AA1234	Boeing 737	180	AA
\.


--
-- TOC entry 4837 (class 0 OID 16806)
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
-- TOC entry 4842 (class 0 OID 16861)
-- Dependencies: 222
-- Data for Name: hoteles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hoteles (id_hotel, nombre, direccion, ciudad, numero_estrellas) FROM stdin;
H001	Hotel Central	Av. Principal 123	Madrid	5
H002	Sunset Resort	Playa del Sol 456	Canc£n	4
H003	Grand Palace	Calle Imperial 789	Par¡s	5
H004	Beach Paradise	Avenida Mar¡tima 321	Miami	4
H005	Mountain Inn	Calle Monta¤a 654	Z£rich	3
H006	Skyline Hotel	Boulevard 890	Nueva York	4
H007	Luxury Suites	Paseo de la Reforma 123	Ciudad de M‚xico	5
H008	Ocean Breeze	Avenida Oce nica 456	Dub i	4
H009	City Hotel	Calle Mayor 789	Barcelona	3
H010	Forest Lodge	Ruta Nacional 321	Montreal	3
H011	Paradise Hills	Subida al Cielo 654	San Francisco	5
H012	Urban Stay	Av. Urbana 890	Chicago	3
H013	Royal Palace	Calle Real 123	Londres	5
H014	Cozy Inn	Avenida Tranquila 456	S¡dney	3
H015	Vista al Mar	Paseo del Horizonte 789	Los µngeles	4
H016	Alpine Lodge	Camino Nevado 321	Munich	4
H017	Desert Retreat	Calle Arena 654	Las Vegas	5
H018	Riverside Inn	Calle R¡o 890	Seattle	3
H019	Island Resort	Playa Isla 123	Honolulu	5
H020	Urban Luxe	Av. Ciudad 456	Toronto	4
H021	Ocean View	Calle Oce nica 789	Rio de Janeiro	4
H022	Mountain Escape	Ruta Nacional 321	Denver	3
H023	City Lights	Avenida Nocturna 654	Tokio	4
H024	Jungle Haven	Calle Verde 890	Bangkok	3
H025	Luxury Coast	Playa Dorada 123	Puerto Vallarta	5
H026	Vintage Charm	Calle Antigua 456	Roma	3
H027	Royal Sunset	Paseo Imperial 789	Atenas	4
H028	Snowflake Inn	Avenida Invierno 321	Oslo	3
H029	Seaside Haven	Playa Serena 654	Cartagena	4
H030	Sky Tower	Calle Celestial 890	Santiago	4
\.


--
-- TOC entry 4843 (class 0 OID 16866)
-- Dependencies: 223
-- Data for Name: paquetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paquetes (id_paquete, nombre, descripcion, precio, vuelo_fk, hotel_fk) FROM stdin;
PK001	Paquete Madrid	Vuelo y estancia en Madrid	1500.00	IB3003	H001
PK002	Paquete Canc£n	Sol y playa en Canc£n	1300.00	AM5005	H002
PK003	Paquete Par¡s	Lujo en Par¡s	2500.00	AF2002	H003
PK004	Paquete Miami	Diversi¢n y compras en Miami	1800.00	AA1001	H004
PK005	Paquete Z£rich	Escapada en los Alpes	2200.00	LH4004	H005
PK006	Paquete Nueva York	Ciudad que nunca duerme	2000.00	UA6006	H006
PK007	Paquete Ciudad de M‚xico	Cultura y gastronom¡a	1200.00	AM5005	H007
PK008	Paquete Dub i	Lujo en el desierto	3000.00	EK1515	H008
PK009	Paquete Barcelona	Arte y playas	1600.00	AF2002	H009
PK010	Paquete Montreal	Naturaleza y modernidad	1900.00	LH4004	H010
PK011	Paquete San Francisco	Vistas ic¢nicas y cultura	2100.00	UA6006	H011
PK012	Paquete Chicago	Arquitectura y gastronom¡a	1500.00	DL7007	H012
PK013	Paquete Londres	Historia y tradici¢n	2500.00	BA8008	H013
PK014	Paquete S¡dney	Playas y Opera House	2700.00	QF1111	H014
PK015	Paquete Los µngeles	Cine y entretenimiento	2000.00	CX1010	H015
PK016	Paquete M£nich	Cerveza y castillos	2200.00	LH4004	H016
PK017	Paquete Las Vegas	Juegos y espect culos	2400.00	AA1001	H017
PK018	Paquete Seattle	Caf‚s y tecnolog¡a	1600.00	DL7007	H018
PK019	Paquete Honolulu	Para¡so tropical	3000.00	JL1919	H019
PK020	Paquete Toronto	Multiculturalismo urbano	1700.00	AM5005	H020
PK021	Paquete R¡o de Janeiro	Carnaval y playas	1900.00	LH4004	H021
PK022	Paquete Denver	Monta¤as y naturaleza	1800.00	UA6006	H022
PK023	Paquete Tokio	Tradici¢n y tecnolog¡a	2500.00	NH2222	H023
PK024	Paquete Bangkok	Templos y mercados	1800.00	TG1414	H024
PK025	Paquete Puerto Vallarta	Relax en la costa	1400.00	AM5005	H025
PK026	Paquete Roma	Historia y gastronom¡a	2300.00	AF2002	H026
PK027	Paquete Atenas	Mitolog¡a y cultura	2100.00	EK1515	H027
PK028	Paquete Oslo	Aventura invernal	2200.00	SA1313	H028
PK029	Paquete Santiago	Cultura y vino	1900.00	AM5005	H030
\.


--
-- TOC entry 4840 (class 0 OID 16841)
-- Dependencies: 220
-- Data for Name: pasajeros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pasajeros (numero_documento, nombre, apellido, fecha_nacimiento, genero) FROM stdin;
P0001	Andrea	Gonz lez	1990-05-14	Femenino
P0002	Luis	Mart¡nez	1985-07-23	Masculino
P0003	Mar¡a	Lopez	1992-03-10	Femenino
P0004	Carlos	Hern ndez	1988-09-27	Masculino
P0005	Sof¡a	Ram¡rez	1995-06-05	Femenino
P0006	Javier	S nchez	1991-11-20	Masculino
P0007	Paola	Morales	1993-02-12	Femenino
P0008	Fernando	Cruz	1987-12-15	Masculino
P0009	Gabriela	Vargas	1996-08-08	Femenino
P0010	Diego	P‚rez	1990-04-19	Masculino
P0011	Daniela	Castillo	1994-01-11	Femenino
P0012	Miguel	Ruiz	1989-05-25	Masculino
P0013	Elena	Navarro	1992-10-10	Femenino
P0014	Ricardo	Ortiz	1986-07-30	Masculino
P0015	Luc¡a	Torres	1993-11-18	Femenino
P0016	Alberto	Flores	1991-02-02	Masculino
P0017	Carla	G¢mez	1997-06-21	Femenino
P0018	Esteban	Molina	1988-09-05	Masculino
P0019	Valeria	Rojas	1995-03-29	Femenino
P0020	Ra£l	µlvarez	1989-08-14	Masculino
P0021	Camila	Reyes	1996-01-03	Femenino
P0022	Sebasti n	Guti‚rrez	1990-12-22	Masculino
P0023	Diana	N£¤ez	1994-04-17	Femenino
P0024	Manuel	Luna	1987-10-31	Masculino
P0025	Patricia	Romero	1992-08-09	Femenino
P0026	Jorge	Salinas	1993-05-15	Masculino
P0027	Florencia	Paredes	1996-03-20	Femenino
P0028	Cristian	Medina	1991-09-01	Masculino
P0029	Natalia	Velasco	1994-02-07	Femenino
P0030	H‚ctor	Blanco	1985-07-19	Masculino
\.


--
-- TOC entry 4841 (class 0 OID 16846)
-- Dependencies: 221
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (codigo_reserva, pasajero_fk, vuelo_fk, asiento, fecha_compra) FROM stdin;
R001	P0001	AA1001	12A	2024-11-20
R002	P0002	AF2002	14C	2024-11-21
R003	P0003	IB3003	15B	2024-11-22
R004	P0004	LH4004	3D	2024-11-23
R005	P0005	AM5005	10E	2024-11-24
R006	P0006	UA6006	7F	2024-11-25
R007	P0007	DL7007	18A	2024-11-26
R008	P0008	BA8008	9C	2024-11-27
R009	P0009	KL9009	21B	2024-11-28
R010	P0010	CX1010	4E	2024-11-29
R011	P0011	QF1111	6A	2024-11-30
R012	P0012	AI1212	19C	2024-12-01
R013	P0013	SA1313	11D	2024-12-02
R014	P0014	TG1414	2F	2024-12-03
R015	P0015	EK1515	22A	2024-12-04
R016	P0016	QR1616	8B	2024-12-05
R017	P0017	ET1717	12C	2024-12-06
R018	P0018	MH1818	9A	2024-12-07
R019	P0019	JL1919	3C	2024-12-08
R020	P0020	CA2020	14E	2024-12-09
R021	P0021	KE2121	17F	2024-12-10
R022	P0022	NH2222	20A	2024-12-11
R023	P0023	NZ2323	11B	2024-12-12
R024	P0024	SV2424	8D	2024-12-13
R025	P0025	TK2525	9E	2024-12-14
R026	P0026	AZ2626	13A	2024-12-15
R027	P0027	VA2727	15C	2024-12-16
R028	P0028	HU2828	10F	2024-12-17
R029	P0029	GA2929	7A	2024-12-18
R030	P0030	CM3030	4C	2024-12-19
\.


--
-- TOC entry 4839 (class 0 OID 16816)
-- Dependencies: 219
-- Data for Name: vuelos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vuelos (numero_vuelo, origen, destino, fecha_hora_salida, fecha_hora_llegada, avion_fk, aerolinea_fk) FROM stdin;
AF2002	CDG	MAD	2024-12-02 10:00:00	2024-12-02 12:30:00	F456AF	AF
IB3003	MAD	MEX	2024-12-03 15:00:00	2024-12-03 21:00:00	EC789IB	IB
LH4004	FRA	JFK	2024-12-04 16:00:00	2024-12-04 22:00:00	D321LH	LH
AM5005	MEX	FRA	2024-12-05 18:00:00	2024-12-06 08:00:00	M654AM	AM
UA6006	ORD	LHR	2024-12-07 14:00:00	2024-12-07 20:00:00	UA1234	UA
DL7007	ATL	AMS	2024-12-08 09:00:00	2024-12-08 17:00:00	DL5678	DL
BA8008	LHR	BCN	2024-12-09 07:30:00	2024-12-09 10:00:00	BA9012	BA
KL9009	AMS	SYD	2024-12-10 12:00:00	2024-12-11 06:00:00	KL3456	KL
CX1010	HKG	SIN	2024-12-11 13:00:00	2024-12-11 16:00:00	CX7890	CX
QF1111	SYD	HND	2024-12-12 22:00:00	2024-12-13 06:00:00	QF5671	QF
AI1212	DEL	DXB	2024-12-13 02:00:00	2024-12-13 05:30:00	AI9013	AI
SA1313	JNB	DOH	2024-12-14 10:00:00	2024-12-14 15:00:00	SA3458	SA
TG1414	BKK	ICN	2024-12-15 18:00:00	2024-12-15 22:00:00	TG7892	TG
EK1515	DXB	SIN	2024-12-16 04:00:00	2024-12-16 09:00:00	EK1237	EK
QR1616	DOH	MIA	2024-12-17 08:00:00	2024-12-17 16:00:00	QR2346	QR
ET1717	ADD	FCO	2024-12-18 20:00:00	2024-12-19 03:00:00	ET7890	ET
MH1818	KUL	SYD	2024-12-19 06:00:00	2024-12-19 16:00:00	MH2345	MH
JL1919	HND	SEA	2024-12-20 11:00:00	2024-12-20 19:00:00	JL4567	JL
CA2020	PEK	MUC	2024-12-21 02:00:00	2024-12-21 07:00:00	CA1238	CA
KE2121	ICN	SFO	2024-12-22 13:00:00	2024-12-22 21:00:00	KE7894	KE
NH2222	HND	NRT	2024-12-23 09:00:00	2024-12-23 09:30:00	NH2347	NH
NZ2323	AKL	SYD	2024-12-24 08:00:00	2024-12-24 12:00:00	NZ5679	NZ
SV2424	RUH	DXB	2024-12-25 06:00:00	2024-12-25 09:00:00	SV9011	SV
TK2525	IST	CDG	2024-12-26 05:00:00	2024-12-26 08:00:00	TK3457	TK
AZ2626	FCO	BCN	2024-12-27 15:00:00	2024-12-27 17:00:00	AZ7893	AZ
VA2727	SYD	MEL	2024-12-28 14:00:00	2024-12-28 15:30:00	VA1236	VA
HU2828	PEK	DEL	2024-12-29 02:30:00	2024-12-29 08:00:00	HU5670	HU
GA2929	CGK	DPS	2024-12-30 11:00:00	2024-12-30 13:00:00	GA4569	GA
CM3030	PTY	CUN	2024-12-31 10:00:00	2024-12-31 12:00:00	CM3456	CM
AA1001	JFK	LAX	2024-11-20 08:00:00	2024-11-20 11:00:00	AA1234	AA
\.


--
-- TOC entry 4666 (class 2606 OID 16795)
-- Name: aerolineas aerolineas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aerolineas
    ADD CONSTRAINT aerolineas_pkey PRIMARY KEY (codigo_iata);


--
-- TOC entry 4672 (class 2606 OID 16815)
-- Name: aeropuertos aeropuertos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aeropuertos
    ADD CONSTRAINT aeropuertos_pkey PRIMARY KEY (codigo_iata);


--
-- TOC entry 4668 (class 2606 OID 16800)
-- Name: aviones aviones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviones
    ADD CONSTRAINT aviones_pkey PRIMARY KEY (matricula);


--
-- TOC entry 4670 (class 2606 OID 16810)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (numero_empleado);


--
-- TOC entry 4680 (class 2606 OID 16865)
-- Name: hoteles hoteles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pkey PRIMARY KEY (id_hotel);


--
-- TOC entry 4682 (class 2606 OID 16870)
-- Name: paquetes paquetes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_pkey PRIMARY KEY (id_paquete);


--
-- TOC entry 4676 (class 2606 OID 16845)
-- Name: pasajeros pasajeros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasajeros
    ADD CONSTRAINT pasajeros_pkey PRIMARY KEY (numero_documento);


--
-- TOC entry 4678 (class 2606 OID 16850)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (codigo_reserva);


--
-- TOC entry 4674 (class 2606 OID 16820)
-- Name: vuelos vuelos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_pkey PRIMARY KEY (numero_vuelo);


--
-- TOC entry 4683 (class 2606 OID 16801)
-- Name: aviones aviones_aerolinea_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aviones
    ADD CONSTRAINT aviones_aerolinea_fk_fkey FOREIGN KEY (aerolinea_fk) REFERENCES public.aerolineas(codigo_iata);


--
-- TOC entry 4690 (class 2606 OID 16876)
-- Name: paquetes paquetes_hotel_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_hotel_fk_fkey FOREIGN KEY (hotel_fk) REFERENCES public.hoteles(id_hotel);


--
-- TOC entry 4691 (class 2606 OID 16871)
-- Name: paquetes paquetes_vuelo_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_vuelo_fk_fkey FOREIGN KEY (vuelo_fk) REFERENCES public.vuelos(numero_vuelo);


--
-- TOC entry 4688 (class 2606 OID 16851)
-- Name: reservas reservas_pasajero_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pasajero_fk_fkey FOREIGN KEY (pasajero_fk) REFERENCES public.pasajeros(numero_documento);


--
-- TOC entry 4689 (class 2606 OID 16856)
-- Name: reservas reservas_vuelo_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_vuelo_fk_fkey FOREIGN KEY (vuelo_fk) REFERENCES public.vuelos(numero_vuelo);


--
-- TOC entry 4684 (class 2606 OID 16836)
-- Name: vuelos vuelos_aerolinea_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_aerolinea_fk_fkey FOREIGN KEY (aerolinea_fk) REFERENCES public.aerolineas(codigo_iata);


--
-- TOC entry 4685 (class 2606 OID 16831)
-- Name: vuelos vuelos_avion_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_avion_fk_fkey FOREIGN KEY (avion_fk) REFERENCES public.aviones(matricula);


--
-- TOC entry 4686 (class 2606 OID 16826)
-- Name: vuelos vuelos_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_destino_fkey FOREIGN KEY (destino) REFERENCES public.aeropuertos(codigo_iata);


--
-- TOC entry 4687 (class 2606 OID 16821)
-- Name: vuelos vuelos_origen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_origen_fkey FOREIGN KEY (origen) REFERENCES public.aeropuertos(codigo_iata);


-- Completed on 2024-11-29 12:36:33

--
-- PostgreSQL database dump complete
--

