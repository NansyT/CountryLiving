--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-06-08 08:42:45

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
-- TOC entry 2874 (class 1262 OID 16393)
-- Name: landlyst; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE landlyst WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Danish_Denmark.1252' LC_CTYPE = 'Danish_Denmark.1252';


ALTER DATABASE landlyst OWNER TO postgres;

\connect landlyst

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
-- TOC entry 2 (class 3079 OID 16459)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 16802)
-- Name: additional_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.additional_services (
    pk_supplement_id integer NOT NULL,
    description character varying,
    price numeric(18,2)
);


ALTER TABLE public.additional_services OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16773)
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    pk_reservation_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    fk_room_id integer,
    fk_customer_email character varying,
    chek_in_date date NOT NULL,
    check_out_date date NOT NULL
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16752)
-- Name: citycode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citycode (
    pk_zip_code integer NOT NULL,
    city character varying NOT NULL
);


ALTER TABLE public.citycode OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16760)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    pk_email character varying NOT NULL,
    fullname character varying NOT NULL,
    address character varying NOT NULL,
    zip_code integer NOT NULL,
    phone_nr integer NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16768)
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    pk_room_id integer NOT NULL,
    price numeric(18,2),
    "Status" integer
);


ALTER TABLE public.room OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16810)
-- Name: roomservices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roomservices (
    pk_fk_room_id integer NOT NULL,
    pk_fk_supplement_id integer NOT NULL
);


ALTER TABLE public.roomservices OWNER TO postgres;

--
-- TOC entry 2867 (class 0 OID 16802)
-- Dependencies: 207
-- Data for Name: additional_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.additional_services VALUES (1, 'Altan', 150.00);
INSERT INTO public.additional_services VALUES (2, 'Dobbeltseng', 200.00);
INSERT INTO public.additional_services VALUES (3, '2 Enkeltsenge', 200.00);
INSERT INTO public.additional_services VALUES (4, 'Badekar', 50.00);
INSERT INTO public.additional_services VALUES (5, 'Jacuzzi', 175.00);
INSERT INTO public.additional_services VALUES (6, 'Eget køkken', 350.00);


--
-- TOC entry 2866 (class 0 OID 16773)
-- Dependencies: 206
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2863 (class 0 OID 16752)
-- Dependencies: 203
-- Data for Name: citycode; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.citycode VALUES (555, 'Scanning');
INSERT INTO public.citycode VALUES (783, 'Facility');
INSERT INTO public.citycode VALUES (800, 'Høje Taastrup');
INSERT INTO public.citycode VALUES (877, 'København C');
INSERT INTO public.citycode VALUES (892, 'Sjælland USF P');
INSERT INTO public.citycode VALUES (893, 'Sjælland USF B');
INSERT INTO public.citycode VALUES (894, 'Udbetaling');
INSERT INTO public.citycode VALUES (899, 'Kommuneservice');
INSERT INTO public.citycode VALUES (900, 'København C');
INSERT INTO public.citycode VALUES (910, 'København C');
INSERT INTO public.citycode VALUES (913, 'Københavns Pakkecenter');
INSERT INTO public.citycode VALUES (914, 'Københavns Pakkecenter');
INSERT INTO public.citycode VALUES (917, 'Københavns Pakkecenter');
INSERT INTO public.citycode VALUES (918, 'Københavns Pakke BRC');
INSERT INTO public.citycode VALUES (919, 'Returprint BRC');
INSERT INTO public.citycode VALUES (929, 'København C');
INSERT INTO public.citycode VALUES (960, 'Internationalt Postcenter');
INSERT INTO public.citycode VALUES (999, 'København C');
INSERT INTO public.citycode VALUES (1001, 'København K');
INSERT INTO public.citycode VALUES (1002, 'København K');
INSERT INTO public.citycode VALUES (1003, 'København K');
INSERT INTO public.citycode VALUES (1004, 'København K');
INSERT INTO public.citycode VALUES (1005, 'København K');
INSERT INTO public.citycode VALUES (1006, 'København K');
INSERT INTO public.citycode VALUES (1007, 'København K');
INSERT INTO public.citycode VALUES (1008, 'København K');
INSERT INTO public.citycode VALUES (1009, 'København K');
INSERT INTO public.citycode VALUES (1010, 'København K');
INSERT INTO public.citycode VALUES (1011, 'København K');
INSERT INTO public.citycode VALUES (1012, 'København K');
INSERT INTO public.citycode VALUES (1013, 'København K');
INSERT INTO public.citycode VALUES (1014, 'København K');
INSERT INTO public.citycode VALUES (1015, 'København K');
INSERT INTO public.citycode VALUES (1016, 'København K');
INSERT INTO public.citycode VALUES (1017, 'København K');
INSERT INTO public.citycode VALUES (1018, 'København K');
INSERT INTO public.citycode VALUES (1019, 'København K');
INSERT INTO public.citycode VALUES (1020, 'København K');
INSERT INTO public.citycode VALUES (1021, 'København K');
INSERT INTO public.citycode VALUES (1022, 'København K');
INSERT INTO public.citycode VALUES (1023, 'København K');
INSERT INTO public.citycode VALUES (1024, 'København K');
INSERT INTO public.citycode VALUES (1025, 'København K');
INSERT INTO public.citycode VALUES (1026, 'København K');
INSERT INTO public.citycode VALUES (1045, 'København K');
INSERT INTO public.citycode VALUES (1050, 'København K');
INSERT INTO public.citycode VALUES (1051, 'København K');
INSERT INTO public.citycode VALUES (1052, 'København K');
INSERT INTO public.citycode VALUES (1053, 'København K');
INSERT INTO public.citycode VALUES (1054, 'København K');
INSERT INTO public.citycode VALUES (1055, 'København K');
INSERT INTO public.citycode VALUES (1056, 'København K');
INSERT INTO public.citycode VALUES (1057, 'København K');
INSERT INTO public.citycode VALUES (1058, 'København K');
INSERT INTO public.citycode VALUES (1059, 'København K');
INSERT INTO public.citycode VALUES (1060, 'København K');
INSERT INTO public.citycode VALUES (1061, 'København K');
INSERT INTO public.citycode VALUES (1062, 'København K');
INSERT INTO public.citycode VALUES (1063, 'København K');
INSERT INTO public.citycode VALUES (1064, 'København K');
INSERT INTO public.citycode VALUES (1065, 'København K');
INSERT INTO public.citycode VALUES (1066, 'København K');
INSERT INTO public.citycode VALUES (1067, 'København K');
INSERT INTO public.citycode VALUES (1068, 'København K');
INSERT INTO public.citycode VALUES (1069, 'København K');
INSERT INTO public.citycode VALUES (1070, 'København K');
INSERT INTO public.citycode VALUES (1071, 'København K');
INSERT INTO public.citycode VALUES (1072, 'København K');
INSERT INTO public.citycode VALUES (1073, 'København K');
INSERT INTO public.citycode VALUES (1074, 'København K');
INSERT INTO public.citycode VALUES (1092, 'København K');
INSERT INTO public.citycode VALUES (1093, 'København K');
INSERT INTO public.citycode VALUES (1095, 'København K');
INSERT INTO public.citycode VALUES (1098, 'København K');
INSERT INTO public.citycode VALUES (1100, 'København K');
INSERT INTO public.citycode VALUES (1101, 'København K');
INSERT INTO public.citycode VALUES (1102, 'København K');
INSERT INTO public.citycode VALUES (1103, 'København K');
INSERT INTO public.citycode VALUES (1104, 'København K');
INSERT INTO public.citycode VALUES (1105, 'København K');
INSERT INTO public.citycode VALUES (1106, 'København K');
INSERT INTO public.citycode VALUES (1107, 'København K');
INSERT INTO public.citycode VALUES (1110, 'København K');
INSERT INTO public.citycode VALUES (1111, 'København K');
INSERT INTO public.citycode VALUES (1112, 'København K');
INSERT INTO public.citycode VALUES (1113, 'København K');
INSERT INTO public.citycode VALUES (1114, 'København K');
INSERT INTO public.citycode VALUES (1115, 'København K');
INSERT INTO public.citycode VALUES (1116, 'København K');
INSERT INTO public.citycode VALUES (1117, 'København K');
INSERT INTO public.citycode VALUES (1118, 'København K');
INSERT INTO public.citycode VALUES (1119, 'København K');
INSERT INTO public.citycode VALUES (1120, 'København K');
INSERT INTO public.citycode VALUES (1121, 'København K');
INSERT INTO public.citycode VALUES (1122, 'København K');
INSERT INTO public.citycode VALUES (1123, 'København K');
INSERT INTO public.citycode VALUES (1124, 'København K');
INSERT INTO public.citycode VALUES (1125, 'København K');
INSERT INTO public.citycode VALUES (1126, 'København K');
INSERT INTO public.citycode VALUES (1127, 'København K');
INSERT INTO public.citycode VALUES (1128, 'København K');
INSERT INTO public.citycode VALUES (1129, 'København K');
INSERT INTO public.citycode VALUES (1130, 'København K');
INSERT INTO public.citycode VALUES (1131, 'København K');
INSERT INTO public.citycode VALUES (1140, 'København K');
INSERT INTO public.citycode VALUES (1147, 'København K');
INSERT INTO public.citycode VALUES (1148, 'København K');
INSERT INTO public.citycode VALUES (1150, 'København K');
INSERT INTO public.citycode VALUES (1151, 'København K');
INSERT INTO public.citycode VALUES (1152, 'København K');
INSERT INTO public.citycode VALUES (1153, 'København K');
INSERT INTO public.citycode VALUES (1154, 'København K');
INSERT INTO public.citycode VALUES (1155, 'København K');
INSERT INTO public.citycode VALUES (1156, 'København K');
INSERT INTO public.citycode VALUES (1157, 'København K');
INSERT INTO public.citycode VALUES (1158, 'København K');
INSERT INTO public.citycode VALUES (1159, 'København K');
INSERT INTO public.citycode VALUES (1160, 'København K');
INSERT INTO public.citycode VALUES (1161, 'København K');
INSERT INTO public.citycode VALUES (1162, 'København K');
INSERT INTO public.citycode VALUES (1164, 'København K');
INSERT INTO public.citycode VALUES (1165, 'København K');
INSERT INTO public.citycode VALUES (1166, 'København K');
INSERT INTO public.citycode VALUES (1167, 'København K');
INSERT INTO public.citycode VALUES (1168, 'København K');
INSERT INTO public.citycode VALUES (1169, 'København K');
INSERT INTO public.citycode VALUES (1170, 'København K');
INSERT INTO public.citycode VALUES (1171, 'København K');
INSERT INTO public.citycode VALUES (1172, 'København K');
INSERT INTO public.citycode VALUES (1173, 'København K');
INSERT INTO public.citycode VALUES (1174, 'København K');
INSERT INTO public.citycode VALUES (1175, 'København K');
INSERT INTO public.citycode VALUES (1200, 'København K');
INSERT INTO public.citycode VALUES (1201, 'København K');
INSERT INTO public.citycode VALUES (1202, 'København K');
INSERT INTO public.citycode VALUES (1203, 'København K');
INSERT INTO public.citycode VALUES (1204, 'København K');
INSERT INTO public.citycode VALUES (1205, 'København K');
INSERT INTO public.citycode VALUES (1206, 'København K');
INSERT INTO public.citycode VALUES (1207, 'København K');
INSERT INTO public.citycode VALUES (1208, 'København K');
INSERT INTO public.citycode VALUES (1209, 'København K');
INSERT INTO public.citycode VALUES (1210, 'København K');
INSERT INTO public.citycode VALUES (1211, 'København K');
INSERT INTO public.citycode VALUES (1212, 'København K');
INSERT INTO public.citycode VALUES (1213, 'København K');
INSERT INTO public.citycode VALUES (1214, 'København K');
INSERT INTO public.citycode VALUES (1215, 'København K');
INSERT INTO public.citycode VALUES (1216, 'København K');
INSERT INTO public.citycode VALUES (1217, 'København K');
INSERT INTO public.citycode VALUES (1218, 'København K');
INSERT INTO public.citycode VALUES (1219, 'København K');
INSERT INTO public.citycode VALUES (1220, 'København K');
INSERT INTO public.citycode VALUES (1221, 'København K');
INSERT INTO public.citycode VALUES (1240, 'København K');
INSERT INTO public.citycode VALUES (1250, 'København K');
INSERT INTO public.citycode VALUES (1251, 'København K');
INSERT INTO public.citycode VALUES (1252, 'København K');
INSERT INTO public.citycode VALUES (1253, 'København K');
INSERT INTO public.citycode VALUES (1254, 'København K');
INSERT INTO public.citycode VALUES (1255, 'København K');
INSERT INTO public.citycode VALUES (1256, 'København K');
INSERT INTO public.citycode VALUES (1257, 'København K');
INSERT INTO public.citycode VALUES (1260, 'København K');
INSERT INTO public.citycode VALUES (1261, 'København K');
INSERT INTO public.citycode VALUES (1263, 'København K');
INSERT INTO public.citycode VALUES (1264, 'København K');
INSERT INTO public.citycode VALUES (1265, 'København K');
INSERT INTO public.citycode VALUES (1266, 'København K');
INSERT INTO public.citycode VALUES (1267, 'København K');
INSERT INTO public.citycode VALUES (1268, 'København K');
INSERT INTO public.citycode VALUES (1270, 'København K');
INSERT INTO public.citycode VALUES (1271, 'København K');
INSERT INTO public.citycode VALUES (1300, 'København K');
INSERT INTO public.citycode VALUES (1301, 'København K');
INSERT INTO public.citycode VALUES (1302, 'København K');
INSERT INTO public.citycode VALUES (1303, 'København K');
INSERT INTO public.citycode VALUES (1304, 'København K');
INSERT INTO public.citycode VALUES (1306, 'København K');
INSERT INTO public.citycode VALUES (1307, 'København K');
INSERT INTO public.citycode VALUES (1308, 'København K');
INSERT INTO public.citycode VALUES (1309, 'København K');
INSERT INTO public.citycode VALUES (1310, 'København K');
INSERT INTO public.citycode VALUES (1311, 'København K');
INSERT INTO public.citycode VALUES (1312, 'København K');
INSERT INTO public.citycode VALUES (1313, 'København K');
INSERT INTO public.citycode VALUES (1314, 'København K');
INSERT INTO public.citycode VALUES (1315, 'København K');
INSERT INTO public.citycode VALUES (1316, 'København K');
INSERT INTO public.citycode VALUES (1317, 'København K');
INSERT INTO public.citycode VALUES (1318, 'København K');
INSERT INTO public.citycode VALUES (1319, 'København K');
INSERT INTO public.citycode VALUES (1320, 'København K');
INSERT INTO public.citycode VALUES (1321, 'København K');
INSERT INTO public.citycode VALUES (1322, 'København K');
INSERT INTO public.citycode VALUES (1323, 'København K');
INSERT INTO public.citycode VALUES (1324, 'København K');
INSERT INTO public.citycode VALUES (1325, 'København K');
INSERT INTO public.citycode VALUES (1326, 'København K');
INSERT INTO public.citycode VALUES (1327, 'København K');
INSERT INTO public.citycode VALUES (1328, 'København K');
INSERT INTO public.citycode VALUES (1329, 'København K');
INSERT INTO public.citycode VALUES (1350, 'København K');
INSERT INTO public.citycode VALUES (1352, 'København K');
INSERT INTO public.citycode VALUES (1353, 'København K');
INSERT INTO public.citycode VALUES (1354, 'København K');
INSERT INTO public.citycode VALUES (1355, 'København K');
INSERT INTO public.citycode VALUES (1356, 'København K');
INSERT INTO public.citycode VALUES (1357, 'København K');
INSERT INTO public.citycode VALUES (1358, 'København K');
INSERT INTO public.citycode VALUES (1359, 'København K');
INSERT INTO public.citycode VALUES (1360, 'København K');
INSERT INTO public.citycode VALUES (1361, 'København K');
INSERT INTO public.citycode VALUES (1362, 'København K');
INSERT INTO public.citycode VALUES (1363, 'København K');
INSERT INTO public.citycode VALUES (1364, 'København K');
INSERT INTO public.citycode VALUES (1365, 'København K');
INSERT INTO public.citycode VALUES (1366, 'København K');
INSERT INTO public.citycode VALUES (1367, 'København K');
INSERT INTO public.citycode VALUES (1368, 'København K');
INSERT INTO public.citycode VALUES (1369, 'København K');
INSERT INTO public.citycode VALUES (1370, 'København K');
INSERT INTO public.citycode VALUES (1371, 'København K');
INSERT INTO public.citycode VALUES (1400, 'København K');
INSERT INTO public.citycode VALUES (1401, 'København K');
INSERT INTO public.citycode VALUES (1402, 'København K');
INSERT INTO public.citycode VALUES (1403, 'København K');
INSERT INTO public.citycode VALUES (1406, 'København K');
INSERT INTO public.citycode VALUES (1407, 'København K');
INSERT INTO public.citycode VALUES (1408, 'København K');
INSERT INTO public.citycode VALUES (1409, 'København K');
INSERT INTO public.citycode VALUES (1410, 'København K');
INSERT INTO public.citycode VALUES (1411, 'København K');
INSERT INTO public.citycode VALUES (1412, 'København K');
INSERT INTO public.citycode VALUES (1413, 'København K');
INSERT INTO public.citycode VALUES (1414, 'København K');
INSERT INTO public.citycode VALUES (1415, 'København K');
INSERT INTO public.citycode VALUES (1416, 'København K');
INSERT INTO public.citycode VALUES (1417, 'København K');
INSERT INTO public.citycode VALUES (1418, 'København K');
INSERT INTO public.citycode VALUES (1419, 'København K');
INSERT INTO public.citycode VALUES (1420, 'København K');
INSERT INTO public.citycode VALUES (1421, 'København K');
INSERT INTO public.citycode VALUES (1422, 'København K');
INSERT INTO public.citycode VALUES (1423, 'København K');
INSERT INTO public.citycode VALUES (1424, 'København K');
INSERT INTO public.citycode VALUES (1425, 'København K');
INSERT INTO public.citycode VALUES (1426, 'København K');
INSERT INTO public.citycode VALUES (1427, 'København K');
INSERT INTO public.citycode VALUES (1428, 'København K');
INSERT INTO public.citycode VALUES (1429, 'København K');
INSERT INTO public.citycode VALUES (1430, 'København K');
INSERT INTO public.citycode VALUES (1432, 'København K');
INSERT INTO public.citycode VALUES (1433, 'København K');
INSERT INTO public.citycode VALUES (1434, 'København K');
INSERT INTO public.citycode VALUES (1435, 'København K');
INSERT INTO public.citycode VALUES (1436, 'København K');
INSERT INTO public.citycode VALUES (1437, 'København K');
INSERT INTO public.citycode VALUES (1438, 'København K');
INSERT INTO public.citycode VALUES (1439, 'København K');
INSERT INTO public.citycode VALUES (1440, 'København K');
INSERT INTO public.citycode VALUES (1441, 'København K');
INSERT INTO public.citycode VALUES (1448, 'København K');
INSERT INTO public.citycode VALUES (1450, 'København K');
INSERT INTO public.citycode VALUES (1451, 'København K');
INSERT INTO public.citycode VALUES (1452, 'København K');
INSERT INTO public.citycode VALUES (1453, 'København K');
INSERT INTO public.citycode VALUES (1454, 'København K');
INSERT INTO public.citycode VALUES (1455, 'København K');
INSERT INTO public.citycode VALUES (1456, 'København K');
INSERT INTO public.citycode VALUES (1457, 'København K');
INSERT INTO public.citycode VALUES (1458, 'København K');
INSERT INTO public.citycode VALUES (1459, 'København K');
INSERT INTO public.citycode VALUES (1460, 'København K');
INSERT INTO public.citycode VALUES (1461, 'København K');
INSERT INTO public.citycode VALUES (1462, 'København K');
INSERT INTO public.citycode VALUES (1463, 'København K');
INSERT INTO public.citycode VALUES (1464, 'København K');
INSERT INTO public.citycode VALUES (1465, 'København K');
INSERT INTO public.citycode VALUES (1466, 'København K');
INSERT INTO public.citycode VALUES (1467, 'København K');
INSERT INTO public.citycode VALUES (1468, 'København K');
INSERT INTO public.citycode VALUES (1470, 'København K');
INSERT INTO public.citycode VALUES (1471, 'København K');
INSERT INTO public.citycode VALUES (1472, 'København K');
INSERT INTO public.citycode VALUES (1473, 'København K');
INSERT INTO public.citycode VALUES (1500, 'København V');
INSERT INTO public.citycode VALUES (1501, 'København V');
INSERT INTO public.citycode VALUES (1502, 'København V');
INSERT INTO public.citycode VALUES (1503, 'København V');
INSERT INTO public.citycode VALUES (1504, 'København V');
INSERT INTO public.citycode VALUES (1505, 'København V');
INSERT INTO public.citycode VALUES (1506, 'København V');
INSERT INTO public.citycode VALUES (1507, 'København V');
INSERT INTO public.citycode VALUES (1508, 'København V');
INSERT INTO public.citycode VALUES (1509, 'København V');
INSERT INTO public.citycode VALUES (1510, 'København V');
INSERT INTO public.citycode VALUES (1512, 'Returpost');
INSERT INTO public.citycode VALUES (1513, 'Flytninger og Nejtak');
INSERT INTO public.citycode VALUES (1532, 'København V');
INSERT INTO public.citycode VALUES (1533, 'København V');
INSERT INTO public.citycode VALUES (1550, 'København V');
INSERT INTO public.citycode VALUES (1551, 'København V');
INSERT INTO public.citycode VALUES (1552, 'København V');
INSERT INTO public.citycode VALUES (1553, 'København V');
INSERT INTO public.citycode VALUES (1554, 'København V');
INSERT INTO public.citycode VALUES (1555, 'København V');
INSERT INTO public.citycode VALUES (1556, 'København V');
INSERT INTO public.citycode VALUES (1557, 'København V');
INSERT INTO public.citycode VALUES (1558, 'København V');
INSERT INTO public.citycode VALUES (1559, 'København V');
INSERT INTO public.citycode VALUES (1560, 'København V');
INSERT INTO public.citycode VALUES (1561, 'København V');
INSERT INTO public.citycode VALUES (1562, 'København V');
INSERT INTO public.citycode VALUES (1563, 'København V');
INSERT INTO public.citycode VALUES (1564, 'København V');
INSERT INTO public.citycode VALUES (1567, 'København V');
INSERT INTO public.citycode VALUES (1568, 'København V');
INSERT INTO public.citycode VALUES (1569, 'København V');
INSERT INTO public.citycode VALUES (1570, 'København V');
INSERT INTO public.citycode VALUES (1571, 'København V');
INSERT INTO public.citycode VALUES (1572, 'København V');
INSERT INTO public.citycode VALUES (1573, 'København V');
INSERT INTO public.citycode VALUES (1574, 'København V');
INSERT INTO public.citycode VALUES (1575, 'København V');
INSERT INTO public.citycode VALUES (1576, 'København V');
INSERT INTO public.citycode VALUES (1577, 'København V');
INSERT INTO public.citycode VALUES (1592, 'København V');
INSERT INTO public.citycode VALUES (1599, 'København V');
INSERT INTO public.citycode VALUES (1600, 'København V');
INSERT INTO public.citycode VALUES (1601, 'København V');
INSERT INTO public.citycode VALUES (1602, 'København V');
INSERT INTO public.citycode VALUES (1603, 'København V');
INSERT INTO public.citycode VALUES (1604, 'København V');
INSERT INTO public.citycode VALUES (1605, 'København V');
INSERT INTO public.citycode VALUES (1606, 'København V');
INSERT INTO public.citycode VALUES (1607, 'København V');
INSERT INTO public.citycode VALUES (1608, 'København V');
INSERT INTO public.citycode VALUES (1609, 'København V');
INSERT INTO public.citycode VALUES (1610, 'København V');
INSERT INTO public.citycode VALUES (1611, 'København V');
INSERT INTO public.citycode VALUES (1612, 'København V');
INSERT INTO public.citycode VALUES (1613, 'København V');
INSERT INTO public.citycode VALUES (1614, 'København V');
INSERT INTO public.citycode VALUES (1615, 'København V');
INSERT INTO public.citycode VALUES (1616, 'København V');
INSERT INTO public.citycode VALUES (1617, 'København V');
INSERT INTO public.citycode VALUES (1618, 'København V');
INSERT INTO public.citycode VALUES (1619, 'København V');
INSERT INTO public.citycode VALUES (1620, 'København V');
INSERT INTO public.citycode VALUES (1621, 'København V');
INSERT INTO public.citycode VALUES (1622, 'København V');
INSERT INTO public.citycode VALUES (1623, 'København V');
INSERT INTO public.citycode VALUES (1624, 'København V');
INSERT INTO public.citycode VALUES (1630, 'København V');
INSERT INTO public.citycode VALUES (1631, 'København V');
INSERT INTO public.citycode VALUES (1632, 'København V');
INSERT INTO public.citycode VALUES (1633, 'København V');
INSERT INTO public.citycode VALUES (1634, 'København V');
INSERT INTO public.citycode VALUES (1635, 'København V');
INSERT INTO public.citycode VALUES (1650, 'København V');
INSERT INTO public.citycode VALUES (1651, 'København V');
INSERT INTO public.citycode VALUES (1652, 'København V');
INSERT INTO public.citycode VALUES (1653, 'København V');
INSERT INTO public.citycode VALUES (1654, 'København V');
INSERT INTO public.citycode VALUES (1655, 'København V');
INSERT INTO public.citycode VALUES (1656, 'København V');
INSERT INTO public.citycode VALUES (1657, 'København V');
INSERT INTO public.citycode VALUES (1658, 'København V');
INSERT INTO public.citycode VALUES (1659, 'København V');
INSERT INTO public.citycode VALUES (1660, 'København V');
INSERT INTO public.citycode VALUES (1661, 'København V');
INSERT INTO public.citycode VALUES (1662, 'København V');
INSERT INTO public.citycode VALUES (1663, 'København V');
INSERT INTO public.citycode VALUES (1664, 'København V');
INSERT INTO public.citycode VALUES (1665, 'København V');
INSERT INTO public.citycode VALUES (1666, 'København V');
INSERT INTO public.citycode VALUES (1667, 'København V');
INSERT INTO public.citycode VALUES (1668, 'København V');
INSERT INTO public.citycode VALUES (1669, 'København V');
INSERT INTO public.citycode VALUES (1670, 'København V');
INSERT INTO public.citycode VALUES (1671, 'København V');
INSERT INTO public.citycode VALUES (1672, 'København V');
INSERT INTO public.citycode VALUES (1673, 'København V');
INSERT INTO public.citycode VALUES (1674, 'København V');
INSERT INTO public.citycode VALUES (1675, 'København V');
INSERT INTO public.citycode VALUES (1676, 'København V');
INSERT INTO public.citycode VALUES (1677, 'København V');
INSERT INTO public.citycode VALUES (1699, 'København V');
INSERT INTO public.citycode VALUES (1700, 'København V');
INSERT INTO public.citycode VALUES (1701, 'København V');
INSERT INTO public.citycode VALUES (1702, 'København V');
INSERT INTO public.citycode VALUES (1703, 'København V');
INSERT INTO public.citycode VALUES (1704, 'København V');
INSERT INTO public.citycode VALUES (1705, 'København V');
INSERT INTO public.citycode VALUES (1706, 'København V');
INSERT INTO public.citycode VALUES (1707, 'København V');
INSERT INTO public.citycode VALUES (1708, 'København V');
INSERT INTO public.citycode VALUES (1709, 'København V');
INSERT INTO public.citycode VALUES (1710, 'København V');
INSERT INTO public.citycode VALUES (1711, 'København V');
INSERT INTO public.citycode VALUES (1712, 'København V');
INSERT INTO public.citycode VALUES (1714, 'København V');
INSERT INTO public.citycode VALUES (1715, 'København V');
INSERT INTO public.citycode VALUES (1716, 'København V');
INSERT INTO public.citycode VALUES (1717, 'København V');
INSERT INTO public.citycode VALUES (1718, 'København V');
INSERT INTO public.citycode VALUES (1719, 'København V');
INSERT INTO public.citycode VALUES (1720, 'København V');
INSERT INTO public.citycode VALUES (1721, 'København V');
INSERT INTO public.citycode VALUES (1722, 'København V');
INSERT INTO public.citycode VALUES (1723, 'København V');
INSERT INTO public.citycode VALUES (1724, 'København V');
INSERT INTO public.citycode VALUES (1725, 'København V');
INSERT INTO public.citycode VALUES (1726, 'København V');
INSERT INTO public.citycode VALUES (1727, 'København V');
INSERT INTO public.citycode VALUES (1728, 'København V');
INSERT INTO public.citycode VALUES (1729, 'København V');
INSERT INTO public.citycode VALUES (1730, 'København V');
INSERT INTO public.citycode VALUES (1731, 'København V');
INSERT INTO public.citycode VALUES (1732, 'København V');
INSERT INTO public.citycode VALUES (1733, 'København V');
INSERT INTO public.citycode VALUES (1734, 'København V');
INSERT INTO public.citycode VALUES (1735, 'København V');
INSERT INTO public.citycode VALUES (1736, 'København V');
INSERT INTO public.citycode VALUES (1737, 'København V');
INSERT INTO public.citycode VALUES (1738, 'København V');
INSERT INTO public.citycode VALUES (1739, 'København V');
INSERT INTO public.citycode VALUES (1749, 'København V');
INSERT INTO public.citycode VALUES (1750, 'København V');
INSERT INTO public.citycode VALUES (1751, 'København V');
INSERT INTO public.citycode VALUES (1752, 'København V');
INSERT INTO public.citycode VALUES (1753, 'København V');
INSERT INTO public.citycode VALUES (1754, 'København V');
INSERT INTO public.citycode VALUES (1755, 'København V');
INSERT INTO public.citycode VALUES (1756, 'København V');
INSERT INTO public.citycode VALUES (1757, 'København V');
INSERT INTO public.citycode VALUES (1758, 'København V');
INSERT INTO public.citycode VALUES (1759, 'København V');
INSERT INTO public.citycode VALUES (1760, 'København V');
INSERT INTO public.citycode VALUES (1761, 'København V');
INSERT INTO public.citycode VALUES (1762, 'København V');
INSERT INTO public.citycode VALUES (1763, 'København V');
INSERT INTO public.citycode VALUES (1764, 'København V');
INSERT INTO public.citycode VALUES (1765, 'København V');
INSERT INTO public.citycode VALUES (1766, 'København V');
INSERT INTO public.citycode VALUES (1770, 'København V');
INSERT INTO public.citycode VALUES (1771, 'København V');
INSERT INTO public.citycode VALUES (1772, 'København V');
INSERT INTO public.citycode VALUES (1773, 'København V');
INSERT INTO public.citycode VALUES (1774, 'København V');
INSERT INTO public.citycode VALUES (1775, 'København V');
INSERT INTO public.citycode VALUES (1777, 'København V');
INSERT INTO public.citycode VALUES (1780, 'København V');
INSERT INTO public.citycode VALUES (1782, 'København V');
INSERT INTO public.citycode VALUES (1785, 'København V');
INSERT INTO public.citycode VALUES (1786, 'København V');
INSERT INTO public.citycode VALUES (1787, 'København V');
INSERT INTO public.citycode VALUES (1790, 'København V');
INSERT INTO public.citycode VALUES (1799, 'København V');
INSERT INTO public.citycode VALUES (1800, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1801, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1802, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1803, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1804, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1805, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1806, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1807, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1808, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1809, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1810, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1811, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1812, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1813, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1814, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1815, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1816, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1817, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1818, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1819, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1820, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1822, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1823, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1824, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1825, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1826, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1827, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1828, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1829, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1835, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1850, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1851, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1852, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1853, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1854, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1855, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1856, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1857, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1860, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1861, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1862, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1863, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1864, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1865, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1866, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1867, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1868, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1870, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1871, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1872, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1873, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1874, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1875, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1876, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1877, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1878, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1879, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1900, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1901, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1902, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1903, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1904, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1905, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1906, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1908, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1909, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1910, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1911, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1912, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1913, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1914, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1915, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1916, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1917, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1920, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1921, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1922, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1923, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1924, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1925, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1926, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1927, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1928, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1931, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1950, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1951, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1952, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1953, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1954, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1955, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1956, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1957, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1958, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1959, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1960, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1961, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1962, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1963, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1964, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1965, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1966, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1967, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1970, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1971, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1972, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1973, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (1974, 'Frederiksberg C');
INSERT INTO public.citycode VALUES (2000, 'Frederiksberg');
INSERT INTO public.citycode VALUES (2100, 'København Ø');
INSERT INTO public.citycode VALUES (2150, 'Nordhavn');
INSERT INTO public.citycode VALUES (2200, 'København ');
INSERT INTO public.citycode VALUES (2300, 'København S');
INSERT INTO public.citycode VALUES (2400, 'København NV');
INSERT INTO public.citycode VALUES (2412, 'Grønland');
INSERT INTO public.citycode VALUES (2450, 'København SV');
INSERT INTO public.citycode VALUES (2500, 'Valby');
INSERT INTO public.citycode VALUES (2600, 'Glostrup');
INSERT INTO public.citycode VALUES (2605, 'Brøndby');
INSERT INTO public.citycode VALUES (2610, 'Rødovre');
INSERT INTO public.citycode VALUES (2620, 'Albertslund');
INSERT INTO public.citycode VALUES (2625, 'Vallensbæk');
INSERT INTO public.citycode VALUES (2630, 'Taastrup');
INSERT INTO public.citycode VALUES (2635, 'Ishøj');
INSERT INTO public.citycode VALUES (2640, 'Hedehusene');
INSERT INTO public.citycode VALUES (2650, 'Hvidovre');
INSERT INTO public.citycode VALUES (2660, 'Brøndby Strand');
INSERT INTO public.citycode VALUES (2665, 'Vallensbæk Strand');
INSERT INTO public.citycode VALUES (2670, 'Greve');
INSERT INTO public.citycode VALUES (2680, 'Solrød Strand');
INSERT INTO public.citycode VALUES (2690, 'Karlslunde');
INSERT INTO public.citycode VALUES (2700, 'Brønshøj');
INSERT INTO public.citycode VALUES (2720, 'Vanløse');
INSERT INTO public.citycode VALUES (2730, 'Herlev');
INSERT INTO public.citycode VALUES (2740, 'Skovlunde');
INSERT INTO public.citycode VALUES (2750, 'Ballerup');
INSERT INTO public.citycode VALUES (2760, 'Måløv');
INSERT INTO public.citycode VALUES (2765, 'Smørum');
INSERT INTO public.citycode VALUES (2770, 'Kastrup');
INSERT INTO public.citycode VALUES (2791, 'Dragør');
INSERT INTO public.citycode VALUES (2800, 'Kongens Lyngby');
INSERT INTO public.citycode VALUES (2820, 'Gentofte');
INSERT INTO public.citycode VALUES (2830, 'Virum');
INSERT INTO public.citycode VALUES (2840, 'Holte');
INSERT INTO public.citycode VALUES (2850, 'Nærum');
INSERT INTO public.citycode VALUES (2860, 'Søborg');
INSERT INTO public.citycode VALUES (2870, 'Dyssegård');
INSERT INTO public.citycode VALUES (2880, 'Bagsværd');
INSERT INTO public.citycode VALUES (2900, 'Hellerup');
INSERT INTO public.citycode VALUES (2920, 'Charlottenlund');
INSERT INTO public.citycode VALUES (2930, 'Klampenborg');
INSERT INTO public.citycode VALUES (2942, 'Skodsborg');
INSERT INTO public.citycode VALUES (2950, 'Vedbæk');
INSERT INTO public.citycode VALUES (2960, 'Rungsted Kyst');
INSERT INTO public.citycode VALUES (2970, 'Hørsholm');
INSERT INTO public.citycode VALUES (2980, 'Kokkedal');
INSERT INTO public.citycode VALUES (2990, 'Nivå');
INSERT INTO public.citycode VALUES (3000, 'Helsingør');
INSERT INTO public.citycode VALUES (3050, 'Humlebæk');
INSERT INTO public.citycode VALUES (3060, 'Espergærde');
INSERT INTO public.citycode VALUES (3070, 'Snekkersten');
INSERT INTO public.citycode VALUES (3080, 'Tikøb');
INSERT INTO public.citycode VALUES (3100, 'Hornbæk');
INSERT INTO public.citycode VALUES (3120, 'Dronningmølle');
INSERT INTO public.citycode VALUES (3140, 'Ålsgårde');
INSERT INTO public.citycode VALUES (3150, 'Hellebæk');
INSERT INTO public.citycode VALUES (3200, 'Helsinge');
INSERT INTO public.citycode VALUES (3210, 'Vejby');
INSERT INTO public.citycode VALUES (3220, 'Tisvildeleje');
INSERT INTO public.citycode VALUES (3230, 'Græsted');
INSERT INTO public.citycode VALUES (3250, 'Gilleleje');
INSERT INTO public.citycode VALUES (3300, 'Frederiksværk');
INSERT INTO public.citycode VALUES (3310, 'Ølsted');
INSERT INTO public.citycode VALUES (3320, 'Skævinge');
INSERT INTO public.citycode VALUES (3330, 'Gørløse');
INSERT INTO public.citycode VALUES (3360, 'Liseleje');
INSERT INTO public.citycode VALUES (3370, 'Melby');
INSERT INTO public.citycode VALUES (3390, 'Hundested');
INSERT INTO public.citycode VALUES (3400, 'Hillerød');
INSERT INTO public.citycode VALUES (3450, 'Allerød');
INSERT INTO public.citycode VALUES (3460, 'Birkerød');
INSERT INTO public.citycode VALUES (3480, 'Fredensborg');
INSERT INTO public.citycode VALUES (3490, 'Kvistgård');
INSERT INTO public.citycode VALUES (3500, 'Værløse');
INSERT INTO public.citycode VALUES (3520, 'Farum');
INSERT INTO public.citycode VALUES (3540, 'Lynge');
INSERT INTO public.citycode VALUES (3550, 'Slangerup');
INSERT INTO public.citycode VALUES (3600, 'Frederikssund');
INSERT INTO public.citycode VALUES (3630, 'Jægerspris');
INSERT INTO public.citycode VALUES (3650, 'Ølstykke');
INSERT INTO public.citycode VALUES (3660, 'Stenløse');
INSERT INTO public.citycode VALUES (3670, 'Veksø Sjælland');
INSERT INTO public.citycode VALUES (3700, 'Rønne');
INSERT INTO public.citycode VALUES (3720, 'Aakirkeby');
INSERT INTO public.citycode VALUES (3730, 'Nexø');
INSERT INTO public.citycode VALUES (3740, 'Svaneke');
INSERT INTO public.citycode VALUES (3751, 'Østermarie');
INSERT INTO public.citycode VALUES (3760, 'Gudhjem');
INSERT INTO public.citycode VALUES (3770, 'Allinge');
INSERT INTO public.citycode VALUES (3782, 'Klemensker');
INSERT INTO public.citycode VALUES (3790, 'Hasle');
INSERT INTO public.citycode VALUES (4000, 'Roskilde');
INSERT INTO public.citycode VALUES (4030, 'Tune');
INSERT INTO public.citycode VALUES (4040, 'Jyllinge');
INSERT INTO public.citycode VALUES (4050, 'Skibby');
INSERT INTO public.citycode VALUES (4060, 'Kirke Såby');
INSERT INTO public.citycode VALUES (4070, 'Kirke Hyllinge');
INSERT INTO public.citycode VALUES (4100, 'Ringsted');
INSERT INTO public.citycode VALUES (4129, 'Ringsted');
INSERT INTO public.citycode VALUES (4130, 'Viby Sjælland');
INSERT INTO public.citycode VALUES (4140, 'Borup');
INSERT INTO public.citycode VALUES (4160, 'Herlufmagle');
INSERT INTO public.citycode VALUES (4171, 'Glumsø');
INSERT INTO public.citycode VALUES (4173, 'Fjenneslev');
INSERT INTO public.citycode VALUES (4174, 'Jystrup Midtsj');
INSERT INTO public.citycode VALUES (4180, 'Sorø');
INSERT INTO public.citycode VALUES (4190, 'Munke Bjergby');
INSERT INTO public.citycode VALUES (4200, 'Slagelse');
INSERT INTO public.citycode VALUES (4220, 'Korsør');
INSERT INTO public.citycode VALUES (4230, 'Skælskør');
INSERT INTO public.citycode VALUES (4241, 'Vemmelev');
INSERT INTO public.citycode VALUES (4242, 'Boeslunde');
INSERT INTO public.citycode VALUES (4243, 'Rude');
INSERT INTO public.citycode VALUES (4244, 'Agersø');
INSERT INTO public.citycode VALUES (4245, 'Omø');
INSERT INTO public.citycode VALUES (4250, 'Fuglebjerg');
INSERT INTO public.citycode VALUES (4261, 'Dalmose');
INSERT INTO public.citycode VALUES (4262, 'Sandved');
INSERT INTO public.citycode VALUES (4270, 'Høng');
INSERT INTO public.citycode VALUES (4281, 'Gørlev');
INSERT INTO public.citycode VALUES (4291, 'Ruds Vedby');
INSERT INTO public.citycode VALUES (4293, 'Dianalund');
INSERT INTO public.citycode VALUES (4295, 'Stenlille');
INSERT INTO public.citycode VALUES (4296, 'Nyrup');
INSERT INTO public.citycode VALUES (4300, 'Holbæk');
INSERT INTO public.citycode VALUES (4305, 'Orø');
INSERT INTO public.citycode VALUES (4320, 'Lejre');
INSERT INTO public.citycode VALUES (4330, 'Hvalsø');
INSERT INTO public.citycode VALUES (4340, 'Tølløse');
INSERT INTO public.citycode VALUES (4350, 'Ugerløse');
INSERT INTO public.citycode VALUES (4360, 'Kirke Eskilstrup');
INSERT INTO public.citycode VALUES (4370, 'Store Merløse');
INSERT INTO public.citycode VALUES (4390, 'Vipperød');
INSERT INTO public.citycode VALUES (4400, 'Kalundborg');
INSERT INTO public.citycode VALUES (4420, 'Regstrup');
INSERT INTO public.citycode VALUES (4440, 'Mørkøv');
INSERT INTO public.citycode VALUES (4450, 'Jyderup');
INSERT INTO public.citycode VALUES (4460, 'Snertinge');
INSERT INTO public.citycode VALUES (4470, 'Svebølle');
INSERT INTO public.citycode VALUES (4480, 'Store Fuglede');
INSERT INTO public.citycode VALUES (4490, 'Jerslev Sjælland');
INSERT INTO public.citycode VALUES (4500, 'Nykøbing Sj');
INSERT INTO public.citycode VALUES (4520, 'Svinninge');
INSERT INTO public.citycode VALUES (4532, 'Gislinge');
INSERT INTO public.citycode VALUES (4534, 'Hørve');
INSERT INTO public.citycode VALUES (4540, 'Fårevejle');
INSERT INTO public.citycode VALUES (4550, 'Asnæs');
INSERT INTO public.citycode VALUES (4560, 'Vig');
INSERT INTO public.citycode VALUES (4571, 'Grevinge');
INSERT INTO public.citycode VALUES (4572, 'Nørre Asmindrup');
INSERT INTO public.citycode VALUES (4573, 'Højby');
INSERT INTO public.citycode VALUES (4581, 'Rørvig');
INSERT INTO public.citycode VALUES (4583, 'Sjællands Odde');
INSERT INTO public.citycode VALUES (4591, 'Føllenslev');
INSERT INTO public.citycode VALUES (4592, 'Sejerø');
INSERT INTO public.citycode VALUES (4593, 'Eskebjerg');
INSERT INTO public.citycode VALUES (4600, 'Køge');
INSERT INTO public.citycode VALUES (4621, 'Gadstrup');
INSERT INTO public.citycode VALUES (4622, 'Havdrup');
INSERT INTO public.citycode VALUES (4623, 'Lille Skensved');
INSERT INTO public.citycode VALUES (4632, 'Bjæverskov');
INSERT INTO public.citycode VALUES (4640, 'Faxe');
INSERT INTO public.citycode VALUES (4652, 'Hårlev');
INSERT INTO public.citycode VALUES (4653, 'Karise');
INSERT INTO public.citycode VALUES (4654, 'Faxe Ladeplads');
INSERT INTO public.citycode VALUES (4660, 'Store Heddinge');
INSERT INTO public.citycode VALUES (4671, 'Strøby');
INSERT INTO public.citycode VALUES (4672, 'Klippinge');
INSERT INTO public.citycode VALUES (4673, 'Rødvig Stevns');
INSERT INTO public.citycode VALUES (4681, 'Herfølge');
INSERT INTO public.citycode VALUES (4682, 'Tureby');
INSERT INTO public.citycode VALUES (4683, 'Rønnede');
INSERT INTO public.citycode VALUES (4684, 'Holmegaard');
INSERT INTO public.citycode VALUES (4690, 'Haslev');
INSERT INTO public.citycode VALUES (4700, 'Næstved');
INSERT INTO public.citycode VALUES (4720, 'Præstø');
INSERT INTO public.citycode VALUES (4733, 'Tappernøje');
INSERT INTO public.citycode VALUES (4735, 'Mern');
INSERT INTO public.citycode VALUES (4736, 'Karrebæksminde');
INSERT INTO public.citycode VALUES (4750, 'Lundby');
INSERT INTO public.citycode VALUES (4760, 'Vordingborg');
INSERT INTO public.citycode VALUES (4771, 'Kalvehave');
INSERT INTO public.citycode VALUES (4772, 'Langebæk');
INSERT INTO public.citycode VALUES (4773, 'Stensved');
INSERT INTO public.citycode VALUES (4780, 'Stege');
INSERT INTO public.citycode VALUES (4791, 'Borre');
INSERT INTO public.citycode VALUES (4792, 'Askeby');
INSERT INTO public.citycode VALUES (4793, 'Bogø By');
INSERT INTO public.citycode VALUES (4800, 'Nykøbing F');
INSERT INTO public.citycode VALUES (4840, 'Nørre Alslev');
INSERT INTO public.citycode VALUES (4850, 'Stubbekøbing');
INSERT INTO public.citycode VALUES (4862, 'Guldborg');
INSERT INTO public.citycode VALUES (4863, 'Eskilstrup');
INSERT INTO public.citycode VALUES (4871, 'Horbelev');
INSERT INTO public.citycode VALUES (4872, 'Idestrup');
INSERT INTO public.citycode VALUES (4873, 'Væggerløse');
INSERT INTO public.citycode VALUES (4874, 'Gedser');
INSERT INTO public.citycode VALUES (4880, 'Nysted');
INSERT INTO public.citycode VALUES (4891, 'Toreby L');
INSERT INTO public.citycode VALUES (4892, 'Kettinge');
INSERT INTO public.citycode VALUES (4894, 'Øster Ulslev');
INSERT INTO public.citycode VALUES (4895, 'Errindlev');
INSERT INTO public.citycode VALUES (4900, 'Nakskov');
INSERT INTO public.citycode VALUES (4912, 'Harpelunde');
INSERT INTO public.citycode VALUES (4913, 'Horslunde');
INSERT INTO public.citycode VALUES (4920, 'Søllested');
INSERT INTO public.citycode VALUES (4930, 'Maribo');
INSERT INTO public.citycode VALUES (4941, 'Bandholm');
INSERT INTO public.citycode VALUES (4942, 'Askø og Lilleø');
INSERT INTO public.citycode VALUES (4943, 'Torrig L');
INSERT INTO public.citycode VALUES (4944, 'Fejø');
INSERT INTO public.citycode VALUES (4945, 'Femø');
INSERT INTO public.citycode VALUES (4951, 'Nørreballe');
INSERT INTO public.citycode VALUES (4952, 'Stokkemarke');
INSERT INTO public.citycode VALUES (4953, 'Vesterborg');
INSERT INTO public.citycode VALUES (4960, 'Holeby');
INSERT INTO public.citycode VALUES (4970, 'Rødby');
INSERT INTO public.citycode VALUES (4983, 'Dannemare');
INSERT INTO public.citycode VALUES (4990, 'Sakskøbing');
INSERT INTO public.citycode VALUES (4992, 'Midtsjælland USF P');
INSERT INTO public.citycode VALUES (5000, 'Odense C');
INSERT INTO public.citycode VALUES (5029, 'Odense C');
INSERT INTO public.citycode VALUES (5100, 'Odense C');
INSERT INTO public.citycode VALUES (5200, 'Odense V');
INSERT INTO public.citycode VALUES (5210, 'Odense NV');
INSERT INTO public.citycode VALUES (5220, 'Odense SØ');
INSERT INTO public.citycode VALUES (5230, 'Odense M');
INSERT INTO public.citycode VALUES (5240, 'Odense NØ');
INSERT INTO public.citycode VALUES (5250, 'Odense SV');
INSERT INTO public.citycode VALUES (5260, 'Odense S');
INSERT INTO public.citycode VALUES (5270, 'Odense ');
INSERT INTO public.citycode VALUES (5290, 'Marslev');
INSERT INTO public.citycode VALUES (5300, 'Kerteminde');
INSERT INTO public.citycode VALUES (5320, 'Agedrup');
INSERT INTO public.citycode VALUES (5330, 'Munkebo');
INSERT INTO public.citycode VALUES (5350, 'Rynkeby');
INSERT INTO public.citycode VALUES (5370, 'Mesinge');
INSERT INTO public.citycode VALUES (5380, 'Dalby');
INSERT INTO public.citycode VALUES (5390, 'Martofte');
INSERT INTO public.citycode VALUES (5400, 'Bogense');
INSERT INTO public.citycode VALUES (5450, 'Otterup');
INSERT INTO public.citycode VALUES (5462, 'Morud');
INSERT INTO public.citycode VALUES (5463, 'Harndrup');
INSERT INTO public.citycode VALUES (5464, 'Brenderup Fyn');
INSERT INTO public.citycode VALUES (5466, 'Asperup');
INSERT INTO public.citycode VALUES (5471, 'Søndersø');
INSERT INTO public.citycode VALUES (5474, 'Veflinge');
INSERT INTO public.citycode VALUES (5485, 'Skamby');
INSERT INTO public.citycode VALUES (5491, 'Blommenslyst');
INSERT INTO public.citycode VALUES (5492, 'Vissenbjerg');
INSERT INTO public.citycode VALUES (5500, 'Middelfart');
INSERT INTO public.citycode VALUES (5540, 'Ullerslev');
INSERT INTO public.citycode VALUES (5550, 'Langeskov');
INSERT INTO public.citycode VALUES (5560, 'Aarup');
INSERT INTO public.citycode VALUES (5580, 'Nørre Aaby');
INSERT INTO public.citycode VALUES (5591, 'Gelsted');
INSERT INTO public.citycode VALUES (5592, 'Ejby');
INSERT INTO public.citycode VALUES (5600, 'Faaborg');
INSERT INTO public.citycode VALUES (5601, 'Lyø');
INSERT INTO public.citycode VALUES (5602, 'Avernakø');
INSERT INTO public.citycode VALUES (5603, 'Bjørnø');
INSERT INTO public.citycode VALUES (5610, 'Assens');
INSERT INTO public.citycode VALUES (5620, 'Glamsbjerg');
INSERT INTO public.citycode VALUES (5631, 'Ebberup');
INSERT INTO public.citycode VALUES (5642, 'Millinge');
INSERT INTO public.citycode VALUES (5672, 'Broby');
INSERT INTO public.citycode VALUES (5683, 'Haarby');
INSERT INTO public.citycode VALUES (5690, 'Tommerup');
INSERT INTO public.citycode VALUES (5700, 'Svendborg');
INSERT INTO public.citycode VALUES (5750, 'Ringe');
INSERT INTO public.citycode VALUES (5762, 'Vester Skerninge');
INSERT INTO public.citycode VALUES (5771, 'Stenstrup');
INSERT INTO public.citycode VALUES (5772, 'Kværndrup');
INSERT INTO public.citycode VALUES (5792, 'Årslev');
INSERT INTO public.citycode VALUES (5800, 'Nyborg');
INSERT INTO public.citycode VALUES (5853, 'Ørbæk');
INSERT INTO public.citycode VALUES (5854, 'Gislev');
INSERT INTO public.citycode VALUES (5856, 'Ryslinge');
INSERT INTO public.citycode VALUES (5863, 'Ferritslev Fyn');
INSERT INTO public.citycode VALUES (5871, 'Frørup');
INSERT INTO public.citycode VALUES (5874, 'Hesselager');
INSERT INTO public.citycode VALUES (5881, 'Skårup Fyn');
INSERT INTO public.citycode VALUES (5882, 'Vejstrup');
INSERT INTO public.citycode VALUES (5883, 'Oure');
INSERT INTO public.citycode VALUES (5884, 'Gudme');
INSERT INTO public.citycode VALUES (5892, 'Gudbjerg Sydfyn');
INSERT INTO public.citycode VALUES (5900, 'Rudkøbing');
INSERT INTO public.citycode VALUES (5932, 'Humble');
INSERT INTO public.citycode VALUES (5935, 'Bagenkop');
INSERT INTO public.citycode VALUES (5943, 'Strynø');
INSERT INTO public.citycode VALUES (5953, 'Tranekær');
INSERT INTO public.citycode VALUES (5960, 'Marstal');
INSERT INTO public.citycode VALUES (5965, 'Birkholm');
INSERT INTO public.citycode VALUES (5970, 'Ærøskøbing');
INSERT INTO public.citycode VALUES (5985, 'Søby Ærø');
INSERT INTO public.citycode VALUES (6000, 'Kolding');
INSERT INTO public.citycode VALUES (6040, 'Egtved');
INSERT INTO public.citycode VALUES (6051, 'Almind');
INSERT INTO public.citycode VALUES (6052, 'Viuf');
INSERT INTO public.citycode VALUES (6064, 'Jordrup');
INSERT INTO public.citycode VALUES (6070, 'Christiansfeld');
INSERT INTO public.citycode VALUES (6091, 'Bjert');
INSERT INTO public.citycode VALUES (6092, 'Sønder Stenderup');
INSERT INTO public.citycode VALUES (6093, 'Sjølund');
INSERT INTO public.citycode VALUES (6094, 'Hejls');
INSERT INTO public.citycode VALUES (6100, 'Haderslev');
INSERT INTO public.citycode VALUES (6200, 'Aabenraa');
INSERT INTO public.citycode VALUES (6210, 'Barsø');
INSERT INTO public.citycode VALUES (6230, 'Rødekro');
INSERT INTO public.citycode VALUES (6240, 'Løgumkloster');
INSERT INTO public.citycode VALUES (6261, 'Bredebro');
INSERT INTO public.citycode VALUES (6270, 'Tønder');
INSERT INTO public.citycode VALUES (6280, 'Højer');
INSERT INTO public.citycode VALUES (6300, 'Gråsten');
INSERT INTO public.citycode VALUES (6310, 'Broager');
INSERT INTO public.citycode VALUES (6320, 'Egernsund');
INSERT INTO public.citycode VALUES (6330, 'Padborg');
INSERT INTO public.citycode VALUES (6340, 'Kruså');
INSERT INTO public.citycode VALUES (6360, 'Tinglev');
INSERT INTO public.citycode VALUES (6372, 'Bylderup-Bov');
INSERT INTO public.citycode VALUES (6392, 'Bolderslev');
INSERT INTO public.citycode VALUES (6400, 'Sønderborg');
INSERT INTO public.citycode VALUES (6430, 'Nordborg');
INSERT INTO public.citycode VALUES (6440, 'Augustenborg');
INSERT INTO public.citycode VALUES (6470, 'Sydals');
INSERT INTO public.citycode VALUES (6500, 'Vojens');
INSERT INTO public.citycode VALUES (6510, 'Gram');
INSERT INTO public.citycode VALUES (6520, 'Toftlund');
INSERT INTO public.citycode VALUES (6534, 'Agerskov');
INSERT INTO public.citycode VALUES (6535, 'Branderup J');
INSERT INTO public.citycode VALUES (6541, 'Bevtoft');
INSERT INTO public.citycode VALUES (6560, 'Sommersted');
INSERT INTO public.citycode VALUES (6580, 'Vamdrup');
INSERT INTO public.citycode VALUES (6600, 'Vejen');
INSERT INTO public.citycode VALUES (6621, 'Gesten');
INSERT INTO public.citycode VALUES (6622, 'Bække');
INSERT INTO public.citycode VALUES (6623, 'Vorbasse');
INSERT INTO public.citycode VALUES (6630, 'Rødding');
INSERT INTO public.citycode VALUES (6640, 'Lunderskov');
INSERT INTO public.citycode VALUES (6650, 'Brørup');
INSERT INTO public.citycode VALUES (6660, 'Lintrup');
INSERT INTO public.citycode VALUES (6670, 'Holsted');
INSERT INTO public.citycode VALUES (6682, 'Hovborg');
INSERT INTO public.citycode VALUES (6683, 'Føvling');
INSERT INTO public.citycode VALUES (6690, 'Gørding');
INSERT INTO public.citycode VALUES (6700, 'Esbjerg');
INSERT INTO public.citycode VALUES (6701, 'Esbjerg');
INSERT INTO public.citycode VALUES (6705, 'Esbjerg Ø');
INSERT INTO public.citycode VALUES (6710, 'Esbjerg V');
INSERT INTO public.citycode VALUES (6715, 'Esbjerg ');
INSERT INTO public.citycode VALUES (6720, 'Fanø');
INSERT INTO public.citycode VALUES (6731, 'Tjæreborg');
INSERT INTO public.citycode VALUES (6740, 'Bramming');
INSERT INTO public.citycode VALUES (6752, 'Glejbjerg');
INSERT INTO public.citycode VALUES (6753, 'Agerbæk');
INSERT INTO public.citycode VALUES (6760, 'Ribe');
INSERT INTO public.citycode VALUES (6771, 'Gredstedbro');
INSERT INTO public.citycode VALUES (6780, 'Skærbæk');
INSERT INTO public.citycode VALUES (6792, 'Rømø');
INSERT INTO public.citycode VALUES (6800, 'Varde');
INSERT INTO public.citycode VALUES (6818, 'Årre');
INSERT INTO public.citycode VALUES (6823, 'Ansager');
INSERT INTO public.citycode VALUES (6830, 'Nørre Nebel');
INSERT INTO public.citycode VALUES (6840, 'Oksbøl');
INSERT INTO public.citycode VALUES (6851, 'Janderup Vestj');
INSERT INTO public.citycode VALUES (6852, 'Billum');
INSERT INTO public.citycode VALUES (6853, 'Vejers Strand');
INSERT INTO public.citycode VALUES (6854, 'Henne');
INSERT INTO public.citycode VALUES (6855, 'Outrup');
INSERT INTO public.citycode VALUES (6857, 'Blåvand');
INSERT INTO public.citycode VALUES (6862, 'Tistrup');
INSERT INTO public.citycode VALUES (6870, 'Ølgod');
INSERT INTO public.citycode VALUES (6880, 'Tarm');
INSERT INTO public.citycode VALUES (6893, 'Hemmet');
INSERT INTO public.citycode VALUES (6900, 'Skjern');
INSERT INTO public.citycode VALUES (6920, 'Videbæk');
INSERT INTO public.citycode VALUES (6933, 'Kibæk');
INSERT INTO public.citycode VALUES (6940, 'Lem St');
INSERT INTO public.citycode VALUES (6950, 'Ringkøbing');
INSERT INTO public.citycode VALUES (6960, 'Hvide Sande');
INSERT INTO public.citycode VALUES (6971, 'Spjald');
INSERT INTO public.citycode VALUES (6973, 'Ørnhøj');
INSERT INTO public.citycode VALUES (6980, 'Tim');
INSERT INTO public.citycode VALUES (6990, 'Ulfborg');
INSERT INTO public.citycode VALUES (7000, 'Fredericia');
INSERT INTO public.citycode VALUES (7007, 'Fredericia');
INSERT INTO public.citycode VALUES (7017, 'Taulov Pakkecenter');
INSERT INTO public.citycode VALUES (7018, 'Pakker TLP');
INSERT INTO public.citycode VALUES (7029, 'Fredericia');
INSERT INTO public.citycode VALUES (7080, 'Børkop');
INSERT INTO public.citycode VALUES (7100, 'Vejle');
INSERT INTO public.citycode VALUES (7120, 'Vejle Øst');
INSERT INTO public.citycode VALUES (7130, 'Juelsminde');
INSERT INTO public.citycode VALUES (7140, 'Stouby');
INSERT INTO public.citycode VALUES (7150, 'Barrit');
INSERT INTO public.citycode VALUES (7160, 'Tørring');
INSERT INTO public.citycode VALUES (7171, 'Uldum');
INSERT INTO public.citycode VALUES (7173, 'Vonge');
INSERT INTO public.citycode VALUES (7182, 'Bredsten');
INSERT INTO public.citycode VALUES (7183, 'Randbøl');
INSERT INTO public.citycode VALUES (7184, 'Vandel');
INSERT INTO public.citycode VALUES (7190, 'Billund');
INSERT INTO public.citycode VALUES (7200, 'Grindsted');
INSERT INTO public.citycode VALUES (7250, 'Hejnsvig');
INSERT INTO public.citycode VALUES (7260, 'Sønder Omme');
INSERT INTO public.citycode VALUES (7270, 'Stakroge');
INSERT INTO public.citycode VALUES (7280, 'Sønder Felding');
INSERT INTO public.citycode VALUES (7300, 'Jelling');
INSERT INTO public.citycode VALUES (7321, 'Gadbjerg');
INSERT INTO public.citycode VALUES (7323, 'Give');
INSERT INTO public.citycode VALUES (7330, 'Brande');
INSERT INTO public.citycode VALUES (7361, 'Ejstrupholm');
INSERT INTO public.citycode VALUES (7362, 'Hampen');
INSERT INTO public.citycode VALUES (7400, 'Herning');
INSERT INTO public.citycode VALUES (7429, 'Herning');
INSERT INTO public.citycode VALUES (7430, 'Ikast');
INSERT INTO public.citycode VALUES (7441, 'Bording');
INSERT INTO public.citycode VALUES (7442, 'Engesvang');
INSERT INTO public.citycode VALUES (7451, 'Sunds');
INSERT INTO public.citycode VALUES (7470, 'Karup J');
INSERT INTO public.citycode VALUES (7480, 'Vildbjerg');
INSERT INTO public.citycode VALUES (7490, 'Aulum');
INSERT INTO public.citycode VALUES (7500, 'Holstebro');
INSERT INTO public.citycode VALUES (7540, 'Haderup');
INSERT INTO public.citycode VALUES (7550, 'Sørvad');
INSERT INTO public.citycode VALUES (7560, 'Hjerm');
INSERT INTO public.citycode VALUES (7570, 'Vemb');
INSERT INTO public.citycode VALUES (7600, 'Struer');
INSERT INTO public.citycode VALUES (7620, 'Lemvig');
INSERT INTO public.citycode VALUES (7650, 'Bøvlingbjerg');
INSERT INTO public.citycode VALUES (7660, 'Bækmarksbro');
INSERT INTO public.citycode VALUES (7673, 'Harboøre');
INSERT INTO public.citycode VALUES (7680, 'Thyborøn');
INSERT INTO public.citycode VALUES (7700, 'Thisted');
INSERT INTO public.citycode VALUES (7730, 'Hanstholm');
INSERT INTO public.citycode VALUES (7741, 'Frøstrup');
INSERT INTO public.citycode VALUES (7742, 'Vesløs');
INSERT INTO public.citycode VALUES (7752, 'Snedsted');
INSERT INTO public.citycode VALUES (7755, 'Bedsted Thy');
INSERT INTO public.citycode VALUES (7760, 'Hurup Thy');
INSERT INTO public.citycode VALUES (7770, 'Vestervig');
INSERT INTO public.citycode VALUES (7790, 'Thyholm');
INSERT INTO public.citycode VALUES (7800, 'Skive');
INSERT INTO public.citycode VALUES (7830, 'Vinderup');
INSERT INTO public.citycode VALUES (7840, 'Højslev');
INSERT INTO public.citycode VALUES (7850, 'Stoholm Jyll');
INSERT INTO public.citycode VALUES (7860, 'Spøttrup');
INSERT INTO public.citycode VALUES (7870, 'Roslev');
INSERT INTO public.citycode VALUES (7884, 'Fur');
INSERT INTO public.citycode VALUES (7900, 'Nykøbing M');
INSERT INTO public.citycode VALUES (7950, 'Erslev');
INSERT INTO public.citycode VALUES (7960, 'Karby');
INSERT INTO public.citycode VALUES (7970, 'Redsted M');
INSERT INTO public.citycode VALUES (7980, 'Vils');
INSERT INTO public.citycode VALUES (7990, 'Øster Assels');
INSERT INTO public.citycode VALUES (7992, 'Sydjylland/Fyn USF P');
INSERT INTO public.citycode VALUES (7993, 'Sydjylland/Fyn USF B');
INSERT INTO public.citycode VALUES (7996, 'Fakturaservice');
INSERT INTO public.citycode VALUES (7997, 'Fakturascanning');
INSERT INTO public.citycode VALUES (7998, 'Statsservice');
INSERT INTO public.citycode VALUES (7999, 'Kommunepost');
INSERT INTO public.citycode VALUES (8000, 'Aarhus C');
INSERT INTO public.citycode VALUES (8100, 'Aarhus C');
INSERT INTO public.citycode VALUES (8200, 'Aarhus ');
INSERT INTO public.citycode VALUES (8210, 'Aarhus V');
INSERT INTO public.citycode VALUES (8220, 'Brabrand');
INSERT INTO public.citycode VALUES (8229, 'Risskov Ø');
INSERT INTO public.citycode VALUES (8230, 'Åbyhøj');
INSERT INTO public.citycode VALUES (8240, 'Risskov');
INSERT INTO public.citycode VALUES (8245, 'Risskov Ø');
INSERT INTO public.citycode VALUES (8250, 'Egå');
INSERT INTO public.citycode VALUES (8260, 'Viby J');
INSERT INTO public.citycode VALUES (8270, 'Højbjerg');
INSERT INTO public.citycode VALUES (8300, 'Odder');
INSERT INTO public.citycode VALUES (8305, 'Samsø');
INSERT INTO public.citycode VALUES (8310, 'Tranbjerg J');
INSERT INTO public.citycode VALUES (8320, 'Mårslet');
INSERT INTO public.citycode VALUES (8330, 'Beder');
INSERT INTO public.citycode VALUES (8340, 'Malling');
INSERT INTO public.citycode VALUES (8350, 'Hundslund');
INSERT INTO public.citycode VALUES (8355, 'Solbjerg');
INSERT INTO public.citycode VALUES (8361, 'Hasselager');
INSERT INTO public.citycode VALUES (8362, 'Hørning');
INSERT INTO public.citycode VALUES (8370, 'Hadsten');
INSERT INTO public.citycode VALUES (8380, 'Trige');
INSERT INTO public.citycode VALUES (8381, 'Tilst');
INSERT INTO public.citycode VALUES (8382, 'Hinnerup');
INSERT INTO public.citycode VALUES (8400, 'Ebeltoft');
INSERT INTO public.citycode VALUES (8410, 'Rønde');
INSERT INTO public.citycode VALUES (8420, 'Knebel');
INSERT INTO public.citycode VALUES (8444, 'Balle');
INSERT INTO public.citycode VALUES (8450, 'Hammel');
INSERT INTO public.citycode VALUES (8462, 'Harlev J');
INSERT INTO public.citycode VALUES (8464, 'Galten');
INSERT INTO public.citycode VALUES (8471, 'Sabro');
INSERT INTO public.citycode VALUES (8472, 'Sporup');
INSERT INTO public.citycode VALUES (8500, 'Grenaa');
INSERT INTO public.citycode VALUES (8520, 'Lystrup');
INSERT INTO public.citycode VALUES (8530, 'Hjortshøj');
INSERT INTO public.citycode VALUES (8541, 'Skødstrup');
INSERT INTO public.citycode VALUES (8543, 'Hornslet');
INSERT INTO public.citycode VALUES (8544, 'Mørke');
INSERT INTO public.citycode VALUES (8550, 'Ryomgård');
INSERT INTO public.citycode VALUES (8560, 'Kolind');
INSERT INTO public.citycode VALUES (8570, 'Trustrup');
INSERT INTO public.citycode VALUES (8581, 'Nimtofte');
INSERT INTO public.citycode VALUES (8585, 'Glesborg');
INSERT INTO public.citycode VALUES (8586, 'Ørum Djurs');
INSERT INTO public.citycode VALUES (8592, 'Anholt');
INSERT INTO public.citycode VALUES (8600, 'Silkeborg');
INSERT INTO public.citycode VALUES (8620, 'Kjellerup');
INSERT INTO public.citycode VALUES (8632, 'Lemming');
INSERT INTO public.citycode VALUES (8641, 'Sorring');
INSERT INTO public.citycode VALUES (8643, 'Ans By');
INSERT INTO public.citycode VALUES (8653, 'Them');
INSERT INTO public.citycode VALUES (8654, 'Bryrup');
INSERT INTO public.citycode VALUES (8660, 'Skanderborg');
INSERT INTO public.citycode VALUES (8670, 'Låsby');
INSERT INTO public.citycode VALUES (8680, 'Ry');
INSERT INTO public.citycode VALUES (8700, 'Horsens');
INSERT INTO public.citycode VALUES (8721, 'Daugård');
INSERT INTO public.citycode VALUES (8722, 'Hedensted');
INSERT INTO public.citycode VALUES (8723, 'Løsning');
INSERT INTO public.citycode VALUES (8732, 'Hovedgård');
INSERT INTO public.citycode VALUES (8740, 'Brædstrup');
INSERT INTO public.citycode VALUES (8751, 'Gedved');
INSERT INTO public.citycode VALUES (8752, 'Østbirk');
INSERT INTO public.citycode VALUES (8762, 'Flemming');
INSERT INTO public.citycode VALUES (8763, 'Rask Mølle');
INSERT INTO public.citycode VALUES (8765, 'Klovborg');
INSERT INTO public.citycode VALUES (8766, 'Nørre Snede');
INSERT INTO public.citycode VALUES (8781, 'Stenderup');
INSERT INTO public.citycode VALUES (8783, 'Hornsyld');
INSERT INTO public.citycode VALUES (8789, 'Endelave');
INSERT INTO public.citycode VALUES (8799, 'Tunø');
INSERT INTO public.citycode VALUES (8800, 'Viborg');
INSERT INTO public.citycode VALUES (8830, 'Tjele');
INSERT INTO public.citycode VALUES (8831, 'Løgstrup');
INSERT INTO public.citycode VALUES (8832, 'Skals');
INSERT INTO public.citycode VALUES (8840, 'Rødkærsbro');
INSERT INTO public.citycode VALUES (8850, 'Bjerringbro');
INSERT INTO public.citycode VALUES (8860, 'Ulstrup');
INSERT INTO public.citycode VALUES (8870, 'Langå');
INSERT INTO public.citycode VALUES (8881, 'Thorsø');
INSERT INTO public.citycode VALUES (8882, 'Fårvang');
INSERT INTO public.citycode VALUES (8883, 'Gjern');
INSERT INTO public.citycode VALUES (8900, 'Randers C');
INSERT INTO public.citycode VALUES (8920, 'Randers NV');
INSERT INTO public.citycode VALUES (8930, 'Randers NØ');
INSERT INTO public.citycode VALUES (8940, 'Randers SV');
INSERT INTO public.citycode VALUES (8950, 'Ørsted');
INSERT INTO public.citycode VALUES (8960, 'Randers SØ');
INSERT INTO public.citycode VALUES (8961, 'Allingåbro');
INSERT INTO public.citycode VALUES (8963, 'Auning');
INSERT INTO public.citycode VALUES (8970, 'Havndal');
INSERT INTO public.citycode VALUES (8981, 'Spentrup');
INSERT INTO public.citycode VALUES (8983, 'Gjerlev J');
INSERT INTO public.citycode VALUES (8990, 'Fårup');
INSERT INTO public.citycode VALUES (9000, 'Aalborg');
INSERT INTO public.citycode VALUES (9029, 'Aalborg');
INSERT INTO public.citycode VALUES (9100, 'Aalborg');
INSERT INTO public.citycode VALUES (9200, 'Aalborg SV');
INSERT INTO public.citycode VALUES (9210, 'Aalborg SØ');
INSERT INTO public.citycode VALUES (9220, 'Aalborg Øst');
INSERT INTO public.citycode VALUES (9230, 'Svenstrup J');
INSERT INTO public.citycode VALUES (9240, 'Nibe');
INSERT INTO public.citycode VALUES (9260, 'Gistrup');
INSERT INTO public.citycode VALUES (9270, 'Klarup');
INSERT INTO public.citycode VALUES (9280, 'Storvorde');
INSERT INTO public.citycode VALUES (9293, 'Kongerslev');
INSERT INTO public.citycode VALUES (9300, 'Sæby');
INSERT INTO public.citycode VALUES (9310, 'Vodskov');
INSERT INTO public.citycode VALUES (9320, 'Hjallerup');
INSERT INTO public.citycode VALUES (9330, 'Dronninglund');
INSERT INTO public.citycode VALUES (9340, 'Asaa');
INSERT INTO public.citycode VALUES (9352, 'Dybvad');
INSERT INTO public.citycode VALUES (9362, 'Gandrup');
INSERT INTO public.citycode VALUES (9370, 'Hals');
INSERT INTO public.citycode VALUES (9380, 'Vestbjerg');
INSERT INTO public.citycode VALUES (9381, 'Sulsted');
INSERT INTO public.citycode VALUES (9382, 'Tylstrup');
INSERT INTO public.citycode VALUES (9400, 'Nørresundby');
INSERT INTO public.citycode VALUES (9430, 'Vadum');
INSERT INTO public.citycode VALUES (9440, 'Aabybro');
INSERT INTO public.citycode VALUES (9460, 'Brovst');
INSERT INTO public.citycode VALUES (9480, 'Løkken');
INSERT INTO public.citycode VALUES (9490, 'Pandrup');
INSERT INTO public.citycode VALUES (9492, 'Blokhus');
INSERT INTO public.citycode VALUES (9493, 'Saltum');
INSERT INTO public.citycode VALUES (9500, 'Hobro');
INSERT INTO public.citycode VALUES (9510, 'Arden');
INSERT INTO public.citycode VALUES (9520, 'Skørping');
INSERT INTO public.citycode VALUES (9530, 'Støvring');
INSERT INTO public.citycode VALUES (9541, 'Suldrup');
INSERT INTO public.citycode VALUES (9550, 'Mariager');
INSERT INTO public.citycode VALUES (9560, 'Hadsund');
INSERT INTO public.citycode VALUES (9574, 'Bælum');
INSERT INTO public.citycode VALUES (9575, 'Terndrup');
INSERT INTO public.citycode VALUES (9600, 'Aars');
INSERT INTO public.citycode VALUES (9610, 'Nørager');
INSERT INTO public.citycode VALUES (9620, 'Aalestrup');
INSERT INTO public.citycode VALUES (9631, 'Gedsted');
INSERT INTO public.citycode VALUES (9632, 'Møldrup');
INSERT INTO public.citycode VALUES (9640, 'Farsø');
INSERT INTO public.citycode VALUES (9670, 'Løgstør');
INSERT INTO public.citycode VALUES (9681, 'Ranum');
INSERT INTO public.citycode VALUES (9690, 'Fjerritslev');
INSERT INTO public.citycode VALUES (9700, 'Brønderslev');
INSERT INTO public.citycode VALUES (9740, 'Jerslev J');
INSERT INTO public.citycode VALUES (9750, 'Østervrå');
INSERT INTO public.citycode VALUES (9760, 'Vrå');
INSERT INTO public.citycode VALUES (9800, 'Hjørring');
INSERT INTO public.citycode VALUES (9830, 'Tårs');
INSERT INTO public.citycode VALUES (9850, 'Hirtshals');
INSERT INTO public.citycode VALUES (9870, 'Sindal');
INSERT INTO public.citycode VALUES (9881, 'Bindslev');
INSERT INTO public.citycode VALUES (9900, 'Frederikshavn');
INSERT INTO public.citycode VALUES (9940, 'Læsø');
INSERT INTO public.citycode VALUES (9970, 'Strandby');
INSERT INTO public.citycode VALUES (9981, 'Jerup');
INSERT INTO public.citycode VALUES (9982, 'Ålbæk');
INSERT INTO public.citycode VALUES (9990, 'Skagen');
INSERT INTO public.citycode VALUES (9992, 'Jylland USF P');
INSERT INTO public.citycode VALUES (9993, 'Jylland USF B');
INSERT INTO public.citycode VALUES (9996, 'Fakturaservice');
INSERT INTO public.citycode VALUES (9997, 'Fakturascanning');
INSERT INTO public.citycode VALUES (9998, 'Borgerservice');


--
-- TOC entry 2864 (class 0 OID 16760)
-- Dependencies: 204
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2865 (class 0 OID 16768)
-- Dependencies: 205
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.room VALUES (100, 695.00, 1);
INSERT INTO public.room VALUES (101, 695.00, 1);
INSERT INTO public.room VALUES (102, 695.00, 1);
INSERT INTO public.room VALUES (103, 695.00, 1);
INSERT INTO public.room VALUES (104, 695.00, 1);
INSERT INTO public.room VALUES (105, 695.00, 1);
INSERT INTO public.room VALUES (106, 695.00, 1);
INSERT INTO public.room VALUES (107, 695.00, 1);
INSERT INTO public.room VALUES (108, 695.00, 1);
INSERT INTO public.room VALUES (109, 695.00, 1);
INSERT INTO public.room VALUES (110, 695.00, 1);
INSERT INTO public.room VALUES (200, 695.00, 1);
INSERT INTO public.room VALUES (201, 695.00, 1);
INSERT INTO public.room VALUES (202, 695.00, 1);
INSERT INTO public.room VALUES (203, 695.00, 1);
INSERT INTO public.room VALUES (204, 695.00, 1);
INSERT INTO public.room VALUES (205, 695.00, 1);
INSERT INTO public.room VALUES (206, 695.00, 1);
INSERT INTO public.room VALUES (207, 695.00, 1);
INSERT INTO public.room VALUES (208, 695.00, 1);
INSERT INTO public.room VALUES (209, 695.00, 1);
INSERT INTO public.room VALUES (300, 695.00, 1);
INSERT INTO public.room VALUES (301, 695.00, 1);
INSERT INTO public.room VALUES (302, 695.00, 1);
INSERT INTO public.room VALUES (303, 695.00, 1);
INSERT INTO public.room VALUES (304, 695.00, 1);
INSERT INTO public.room VALUES (305, 695.00, 1);
INSERT INTO public.room VALUES (306, 695.00, 1);
INSERT INTO public.room VALUES (307, 695.00, 1);
INSERT INTO public.room VALUES (308, 695.00, 1);
INSERT INTO public.room VALUES (309, 695.00, 1);
INSERT INTO public.room VALUES (400, 695.00, 1);
INSERT INTO public.room VALUES (401, 695.00, 1);
INSERT INTO public.room VALUES (402, 695.00, 1);
INSERT INTO public.room VALUES (403, 695.00, 1);
INSERT INTO public.room VALUES (404, 695.00, 1);
INSERT INTO public.room VALUES (405, 695.00, 1);
INSERT INTO public.room VALUES (406, 695.00, 1);
INSERT INTO public.room VALUES (407, 695.00, 1);
INSERT INTO public.room VALUES (408, 695.00, 1);
INSERT INTO public.room VALUES (409, 695.00, 1);
INSERT INTO public.room VALUES (500, 695.00, 1);
INSERT INTO public.room VALUES (501, 695.00, 1);
INSERT INTO public.room VALUES (502, 695.00, 1);
INSERT INTO public.room VALUES (503, 695.00, 1);
INSERT INTO public.room VALUES (504, 695.00, 1);
INSERT INTO public.room VALUES (506, 695.00, 1);
INSERT INTO public.room VALUES (507, 695.00, 1);
INSERT INTO public.room VALUES (508, 695.00, 1);
INSERT INTO public.room VALUES (509, 695.00, 1);
INSERT INTO public.room VALUES (510, 695.00, 1);


--
-- TOC entry 2868 (class 0 OID 16810)
-- Dependencies: 208
-- Data for Name: roomservices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roomservices VALUES (301, 3);
INSERT INTO public.roomservices VALUES (304, 3);
INSERT INTO public.roomservices VALUES (501, 3);
INSERT INTO public.roomservices VALUES (100, 2);
INSERT INTO public.roomservices VALUES (100, 4);
INSERT INTO public.roomservices VALUES (101, 2);
INSERT INTO public.roomservices VALUES (102, 2);
INSERT INTO public.roomservices VALUES (102, 4);
INSERT INTO public.roomservices VALUES (103, 2);
INSERT INTO public.roomservices VALUES (103, 4);
INSERT INTO public.roomservices VALUES (104, 2);
INSERT INTO public.roomservices VALUES (104, 4);
INSERT INTO public.roomservices VALUES (105, 2);
INSERT INTO public.roomservices VALUES (105, 4);
INSERT INTO public.roomservices VALUES (106, 2);
INSERT INTO public.roomservices VALUES (106, 4);
INSERT INTO public.roomservices VALUES (107, 2);
INSERT INTO public.roomservices VALUES (107, 4);
INSERT INTO public.roomservices VALUES (108, 2);
INSERT INTO public.roomservices VALUES (108, 4);
INSERT INTO public.roomservices VALUES (109, 2);
INSERT INTO public.roomservices VALUES (110, 2);
INSERT INTO public.roomservices VALUES (110, 4);
INSERT INTO public.roomservices VALUES (200, 1);
INSERT INTO public.roomservices VALUES (200, 2);
INSERT INTO public.roomservices VALUES (200, 5);
INSERT INTO public.roomservices VALUES (201, 2);
INSERT INTO public.roomservices VALUES (201, 4);
INSERT INTO public.roomservices VALUES (202, 2);
INSERT INTO public.roomservices VALUES (202, 4);
INSERT INTO public.roomservices VALUES (203, 2);
INSERT INTO public.roomservices VALUES (203, 4);
INSERT INTO public.roomservices VALUES (204, 2);
INSERT INTO public.roomservices VALUES (204, 4);
INSERT INTO public.roomservices VALUES (205, 1);
INSERT INTO public.roomservices VALUES (205, 2);
INSERT INTO public.roomservices VALUES (205, 5);
INSERT INTO public.roomservices VALUES (205, 6);
INSERT INTO public.roomservices VALUES (206, 2);
INSERT INTO public.roomservices VALUES (206, 4);
INSERT INTO public.roomservices VALUES (207, 2);
INSERT INTO public.roomservices VALUES (207, 4);
INSERT INTO public.roomservices VALUES (208, 2);
INSERT INTO public.roomservices VALUES (208, 4);
INSERT INTO public.roomservices VALUES (209, 2);
INSERT INTO public.roomservices VALUES (209, 4);
INSERT INTO public.roomservices VALUES (209, 5);
INSERT INTO public.roomservices VALUES (300, 1);
INSERT INTO public.roomservices VALUES (300, 2);
INSERT INTO public.roomservices VALUES (300, 5);
INSERT INTO public.roomservices VALUES (301, 4);
INSERT INTO public.roomservices VALUES (302, 2);
INSERT INTO public.roomservices VALUES (302, 4);
INSERT INTO public.roomservices VALUES (303, 2);
INSERT INTO public.roomservices VALUES (303, 4);
INSERT INTO public.roomservices VALUES (304, 4);
INSERT INTO public.roomservices VALUES (305, 1);
INSERT INTO public.roomservices VALUES (305, 2);
INSERT INTO public.roomservices VALUES (305, 5);
INSERT INTO public.roomservices VALUES (305, 6);
INSERT INTO public.roomservices VALUES (306, 2);
INSERT INTO public.roomservices VALUES (306, 4);
INSERT INTO public.roomservices VALUES (307, 2);
INSERT INTO public.roomservices VALUES (307, 4);
INSERT INTO public.roomservices VALUES (308, 2);
INSERT INTO public.roomservices VALUES (308, 4);
INSERT INTO public.roomservices VALUES (309, 2);
INSERT INTO public.roomservices VALUES (309, 4);
INSERT INTO public.roomservices VALUES (309, 5);
INSERT INTO public.roomservices VALUES (400, 1);
INSERT INTO public.roomservices VALUES (400, 2);
INSERT INTO public.roomservices VALUES (400, 5);
INSERT INTO public.roomservices VALUES (401, 1);
INSERT INTO public.roomservices VALUES (401, 4);
INSERT INTO public.roomservices VALUES (402, 2);
INSERT INTO public.roomservices VALUES (402, 4);
INSERT INTO public.roomservices VALUES (403, 2);
INSERT INTO public.roomservices VALUES (403, 4);
INSERT INTO public.roomservices VALUES (404, 4);
INSERT INTO public.roomservices VALUES (405, 1);
INSERT INTO public.roomservices VALUES (405, 2);
INSERT INTO public.roomservices VALUES (405, 5);
INSERT INTO public.roomservices VALUES (405, 6);
INSERT INTO public.roomservices VALUES (406, 1);
INSERT INTO public.roomservices VALUES (407, 1);
INSERT INTO public.roomservices VALUES (409, 2);
INSERT INTO public.roomservices VALUES (409, 4);
INSERT INTO public.roomservices VALUES (409, 5);
INSERT INTO public.roomservices VALUES (500, 1);
INSERT INTO public.roomservices VALUES (500, 2);
INSERT INTO public.roomservices VALUES (500, 5);
INSERT INTO public.roomservices VALUES (501, 4);
INSERT INTO public.roomservices VALUES (502, 2);
INSERT INTO public.roomservices VALUES (502, 4);
INSERT INTO public.roomservices VALUES (503, 2);
INSERT INTO public.roomservices VALUES (503, 4);
INSERT INTO public.roomservices VALUES (504, 4);
INSERT INTO public.roomservices VALUES (506, 1);
INSERT INTO public.roomservices VALUES (506, 2);
INSERT INTO public.roomservices VALUES (506, 4);
INSERT INTO public.roomservices VALUES (507, 2);
INSERT INTO public.roomservices VALUES (507, 4);
INSERT INTO public.roomservices VALUES (508, 2);
INSERT INTO public.roomservices VALUES (508, 4);
INSERT INTO public.roomservices VALUES (509, 2);
INSERT INTO public.roomservices VALUES (509, 4);
INSERT INTO public.roomservices VALUES (510, 2);
INSERT INTO public.roomservices VALUES (510, 4);


--
-- TOC entry 2730 (class 2606 OID 16809)
-- Name: additional_services additional_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.additional_services
    ADD CONSTRAINT additional_services_pkey PRIMARY KEY (pk_supplement_id);


--
-- TOC entry 2728 (class 2606 OID 16781)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (pk_reservation_id);


--
-- TOC entry 2722 (class 2606 OID 16759)
-- Name: citycode citycode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citycode
    ADD CONSTRAINT citycode_pkey PRIMARY KEY (pk_zip_code);


--
-- TOC entry 2724 (class 2606 OID 16767)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (pk_email);


--
-- TOC entry 2726 (class 2606 OID 16772)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (pk_room_id);


--
-- TOC entry 2732 (class 2606 OID 16814)
-- Name: roomservices roomservices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomservices
    ADD CONSTRAINT roomservices_pkey PRIMARY KEY (pk_fk_room_id, pk_fk_supplement_id);


--
-- TOC entry 2734 (class 2606 OID 16787)
-- Name: booking booking_fk_customer_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_fk_customer_email_fkey FOREIGN KEY (fk_customer_email) REFERENCES public.customer(pk_email);


--
-- TOC entry 2733 (class 2606 OID 16782)
-- Name: booking booking_fk_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_fk_room_id_fkey FOREIGN KEY (fk_room_id) REFERENCES public.room(pk_room_id);


--
-- TOC entry 2735 (class 2606 OID 16815)
-- Name: roomservices roomservices_pk_fk_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomservices
    ADD CONSTRAINT roomservices_pk_fk_room_id_fkey FOREIGN KEY (pk_fk_room_id) REFERENCES public.room(pk_room_id);


--
-- TOC entry 2736 (class 2606 OID 16820)
-- Name: roomservices roomservices_pk_fk_supplement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roomservices
    ADD CONSTRAINT roomservices_pk_fk_supplement_id_fkey FOREIGN KEY (pk_fk_supplement_id) REFERENCES public.additional_services(pk_supplement_id);


-- Completed on 2020-06-08 08:42:47

--
-- PostgreSQL database dump complete
--

