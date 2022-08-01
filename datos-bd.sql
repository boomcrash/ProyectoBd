
SET NAMES 'utf8';
USE sweetdreams;
--
-- Delete data from the table 'valoracion'
--
TRUNCATE TABLE valoracion;
--
-- Delete data from the table 'producto_has_medida'
--
TRUNCATE TABLE producto_has_medida;
--
-- Delete data from the table 'orden_det_producto'
--
TRUNCATE TABLE orden_det_producto;
--
-- Delete data from the table 'negocio'
--
DELETE FROM negocio;
--
-- Delete data from the table 'factura_detalle'
--
TRUNCATE TABLE factura_detalle;
--
-- Delete data from the table 'empresa_detalle'
--
TRUNCATE TABLE empresa_detalle;
--
-- Delete data from the table 'producto_detalle'
--
DELETE FROM producto_detalle;
--
-- Delete data from the table 'factura_det_pago'
--
DELETE FROM factura_det_pago;
--
-- Delete data from the table 'factura_cab'
--
DELETE FROM factura_cab;
--
-- Delete data from the table 'orden_cab'
--
DELETE FROM orden_cab;
--
-- Delete data from the table 'tipo_pago'
--
DELETE FROM tipo_pago;
--
-- Delete data from the table 'producto'
--
DELETE FROM producto;
--
-- Delete data from the table 'entrega_domiclio'
--
DELETE FROM entrega_domiclio;
--
-- Delete data from the table 'tipo'
--
DELETE FROM tipo;
--
-- Delete data from the table 'proveedor'
--
DELETE FROM proveedor;
--
-- Delete data from the table 'precio'
--
DELETE FROM precio;
--
-- Delete data from the table 'medida'
--
DELETE FROM medida;
--
-- Delete data from the table 'industria'
--
DELETE FROM industria;
--
-- Delete data from the table 'empresa'
--
DELETE FROM empresa;
--
-- Delete data from the table 'costo_entrega'
--
DELETE FROM costo_entrega;
--
-- Delete data from the table 'cliente'
--
DELETE FROM cliente;
--
-- Delete data from the table 'clasificacion'
--
DELETE FROM clasificacion;
--
-- Delete data from the table 'categoria'
--
DELETE FROM categoria;

--
-- Inserting data into table categoria
--


--
-- Inserting data into table clasificacion
--


--
-- Inserting data into table cliente
--



--
-- Inserting data into table costo_entrega
--


--
-- Inserting data into table empresa
--


--
-- Inserting data into table industria
--


--
-- Inserting data into table medida
--


--
-- Inserting data into table precio
--


--
-- Inserting data into table proveedor
--


--
-- Inserting data into table tipo
--


--
-- Inserting data into table entrega_domiclio
--


--
-- Inserting data into table producto
--


--
-- Inserting data into table tipo_pago
--


--
-- Inserting data into table orden_cab
--

--
-- Inserting data into table factura_cab
--


--
-- Inserting data into table factura_det_pago
--
INSERT INTO factura_det_pago(pago_id, factura_id, tipo_pago_id, nro_transaccion, fecha_registro, total, estado) VALUES
(1, 1, 9, '30965', '1970-02-10', 40, 'A'),
(2, 2, NULL, '42777', NULL, NULL, NULL),
(3, 3, 10, '97370', '1971-08-28', 11914, 'A'),
(4, 4, 3, '99664', '1975-04-15', 9011, 'A'),
(5, 5, 9, '92609', '1970-01-07', 6, 'A'),
(6, 6, 5, '80014', '2010-07-08', 10917, 'A'),
(7, 7, 9, '83684', '1970-03-04', 62, 'A'),
(8, 8, 1, '10092', '2014-03-22', 15927, 'A'),
(9, 9, 8, '45719', '2001-04-06', 5183, 'A'),
(10, 10, 2, '64471', '1970-03-16', 74, 'A');

--
-- Inserting data into table producto_detalle
--

--
-- Inserting data into table empresa_detalle
--

--
-- Inserting data into table factura_detalle
--
INSERT INTO factura_detalle(factura_detalle, factura_id, pago_cab_id, iva, descuento, precio_total, estado) VALUES
(1, 10, 8, 34, 57, 90, 'A'),
(2, 7, 6, NULL, 88, 108, NULL),
(3, 3, 6, 63, 69, 5917561, 'A'),
(4, 1, 6, 76, 53, 5, 'A'),
(5, 6, 10, 5, 5, 1628117, 'A'),
(6, 1, 5, 30, 46, 5229872, 'A'),
(7, 7, 6, 58, 23, NULL, 'A'),
(8, 10, 9, 35, 99, 196, 'A'),
(9, 8, 1, 76, 1, 7, 'A'),
(10, 7, NULL, 7, NULL, 5741678, 'A');

--
-- Inserting data into table negocio
--


--
-- Inserting data into table orden_det_producto
--
INSERT INTO orden_det_producto(orden_detalle_id, orden_id, producto_id, cantidad, precio) VALUES
(1, NULL, 10, 1, NULL),
(2, 1, 4, 2, 5),
(3, 1, 1, 3, 4),
(4, 6, NULL, 4, 1),
(5, 8, 2, 5, 0),
(6, 1, 5, 6, 5),
(7, 9, 10, 7, 5),
(8, 4, 9, 8, 0),
(9, 8, 3, 9, 3),
(10, 8, 1, 10, 2);

--
-- Inserting data into table producto_has_medida
--
INSERT INTO producto_has_medida(producto_detalle_id, medida_id, fecha_registro) VALUES
(4, 1, '1980-04-07'),
(7, 7, '2000-02-20'),
(6, 9, '1970-01-10'),
(3, 2, '2011-11-15'),
(7, 6, '1970-01-09'),
(2, 6, '2009-07-11'),
(6, 7, '2006-01-20'),
(3, 10, '1978-09-18'),
(6, 7, '1970-02-02');

--
-- Inserting data into table valoracion
--
INSERT INTO valoracion(valoracion_id, titulo, comentario, estrellas, fecha_registro, estado, cliente_id, producto_id) VALUES
(1, 'SK', 'DM9830676SSUZQ958R88J6PF61NC068JDW8CS2WD8N44510LGGDG4WP75G99HLLB8P2ND3K9A63X72317TO244NL0BYOAPHX1H5I', 1, '1977-03-22', 'A', 6, 4),
(2, 'W4CGHZ', '2DG49MW78KT17U95441DIX901', 2, '1976-04-12', 'A', 8, 5),
(3, '6JIR4295V84LW45U', '3SDXO6D32Z73JF59WOT', 0, '2018-03-04', 'A', 3, 2),
(4, 'UV1', '9Y3F88', 1, '1976-02-05', 'A', 3, 4),
(5, '69Y', '243BM5W09LM5', 0, '2011-09-26', 'A', 5, 7),
(6, '190', 'Z649E54NMO50', 0, '2020-07-04', 'A', 4, 4),
(7, 'S5WBN87E4L18', 'ZMA3383VQ3OYF0YRB99FI57K1G2NOC6W37T160R7DLR5CSU4DL043O643JN70920U6T104S94YS2B79', 1, '1977-12-14', 'A', 1, 10),
(8, 'VF', '99TLFO3K', 0, '1970-07-29', 'A', 6, 8),
(9, '3', '9Y0OTEFB13A82IN23HM01V5O', 2, '1986-06-17', 'A', 10, 5),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);