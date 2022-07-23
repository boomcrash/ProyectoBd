/*create database SweetDreams;*/
use SweetDreams;
/* Aqui estara*n los datos generales de la empresa*/
/*MAESTRA*/
create table empresa(
	empresa_id 			int(11) not null auto_increment primary key,
	nombre 				varchar(50) not null,
    ruc 				varchar(50) not null check (length(ruc)=13)
);
/* Aqui estaran los datos especificos de la empresa*/
/*MAESTRA*/
create table empresa_detalle(
	empresa_detalle_id 		int(11) not null auto_increment primary key,
	razon_social 			varchar(50),
    actividad_economica 	varchar(50) not null,
    tipo_contribuyente 		enum('natural','sociedad'),
    subtipo_contribuyente 	int(11),
    clase_contribuyente 	enum('especial','rise','otros'),
    contabilidad 			enum('si','no'),
    fecha_inicio 			date,
    fecha_actualizacion 	date,
    fecha_cese 				date,
    agente_retencion 		enum('si','no'),
    fecha_registro 			date not null,
    estado 					varchar(1) not null check (estado ='A' or estado='I'),
    empresa_id 				int(11),
    foreign key (empresa_id) references empresa(empresa_id)
);
/* Aqui estaran todas los negocios de la empresa(Pueden ser sucursales o matriz)*/
/*MAESTRA*/
create table negocio(
	negocio_id 				int(11) not null auto_increment primary key,
    ruc 					varchar(50) check (length(ruc)=13),
	nombre 					varchar(50) not null,
    pais 					varchar(50),
    canton 					varchar(50),
    ciudad 					varchar(50),
    direccion 				varchar(50),
    fecha_registro 			date not null,
	estado 					varchar(1) not null check (estado ='A' or estado='I'),
    sucursal_id 			int(11),
    empresa_id 				int(11) not null,
	foreign key (empresa_id) 	references empresa(empresa_id),
    foreign key (sucursal_id) 	references negocio(negocio_id)
);
/* Aqui estaran cada medida para un producto*/
/*MAESTRA*/
create table medida(
	medida_id 				int(11) not null auto_increment primary key,
	plaza 					float,
    ancho 					int,
    alto 					int,
	profundidad 			int,
    fecha_registro 			date not null,
	estado 					varchar(1) not null check (estado ='A' or estado='I')
);
/* Aqui estaran todos lo caracteriza el precio para un producto*/
/*MAESTRA*/
create table precio(
	precio_id 				int(11) not null auto_increment primary key,
	precio_normal 			float(11) not null,
    descuento_web 			float(11),
    descuento_especial 		float(11),
    fecha_registro 			date not null,
	estado 					varchar(1) not null check (estado ='A' or estado='I')
);
/* Aqui estaran cada proveedor disponible*/
/*MAESTRA*/

create table proveedor(
	proveedor_id 			int(11) not null auto_increment primary key,
	nombre 					varchar(50) not null,	
    direccion 				varchar(50),
    telefono 				varchar(50),
    fecha_registro 			date not null,
	estado 					varchar(1) not null check (estado ='A' or estado='I')
);
/* Aqui estaran los tipos de productos como : colchon - almohada*/
/*MAESTRA*/
create table tipo(
	tipo_id 				int(11) not null auto_increment primary key,
    tipo 					varchar(50) not null,
    fecha_registro 			date not null,
	estado 					varchar(1) not null check (estado ='A' or estado='I')
);
/* Aqui estaran las categorias de productos como : confort - uso*/
/*MAESTRA*/
create table categoria(
	categoria_id 			int(11) not null auto_increment primary key,
    nombre_categoria 		varchar(50) not null,
    fecha_registro 			date not null,
	estado 					varchar(1) not null check (estado ='A' or estado='I')
);
/* Aqui estaran las subcategorias de productos como : suave - protector de colchon*/
/*MAESTRA*/
create table clasificacion(
	clasificacion_id 		int(11) not null auto_increment primary key,
    nombre_clasificacion 	varchar(50) not null,
    fecha_registro 			date not null,
	estado 					varchar(1) not null check (estado ='A' or estado='I')
);
/* Aqui estaran los productos con toda su informacion general */
/*MAESTRA*/
create table producto(
	producto_id 			int(11) not null auto_increment primary key,
    nombre 					varchar(50) not null,
    stock 					int(11),
    garantia 				int(11),
	empresa_id 				int (11) not null,
	foreign key (empresa_id) references empresa(empresa_id)
);
/* Aqui estara la informacion especifica de cada producto */
/*MAESTRA*/
create table producto_detalle(
	producto_detalle_id 	int(11) not null auto_increment primary key,
    color 					varchar(50),
    nivel_soporte 			int(11),
	fecha_registro 			date not null,
	estado 					varchar(1) not null check (estado ='A' or estado='I'),
    precio_id 				int(11) not null,
    proveedor_id 			int(11) not null,
    tipo_id 				int (11),
    categoria_id 			int (11),
    clasificacion_id 		int (11),
    producto_id 			int(11) not null,
    foreign key (precio_id) 		references precio(precio_id), 
    foreign key (proveedor_id) 		references proveedor(proveedor_id), 
    foreign key (tipo_id) 			references tipo(tipo_id), 
    foreign key (categoria_id) 		references categoria(categoria_id), 
	foreign key (clasificacion_id) 	references clasificacion(clasificacion_id),
    foreign key (producto_id) 		references producto(producto_id)
);
/* Aqui estaran los registros de todas las medidas que existen para un producto*/
/*MAESTRA*/
create table producto_has_medida(
	producto_detalle_id 	int(11) not null,
    medida_id 				int(11) not null,
    fecha_registro 			date not null,
	foreign key (producto_detalle_id) 	references producto_detalle(producto_detalle_id), 
    foreign key (medida_id) 			references medida(medida_id)
);
/* Aqui estaran los registros de todos los proveddores que existen para un producto*/
/*MAESTRA*/
/*create table producto_has_proveedor(
	categoria_id int(11),
    proveedor_id int(11),
    foreign key (categoria_id) references categoria(categoria_id),
    foreign key (proveedor_id) references proveedor(proveedor_id)
	-
);*/

create table cliente(
	cliente_id 				int(11) not null auto_increment primary key,
	nombre 					varchar(50) not null,
    sexo 					varchar(1) not null,    
    telefono 				varchar(50),
    direccion_domicilio 	varchar(50),
    cedula 					varchar(10) not null,
    fecha_registro 			date not null,
    estado 					varchar(1) not null 
);

create table valoracion(
	valoracion_id 			int(11) not null auto_increment primary key,
    titulo 					varchar(30),
    comentario 				varchar(100),
    estrellas 				int(1) not null check (estrellas >0 and estrellas<6),
    fecha_registro 			date not null,
    estado 					varchar(1) not null check (estado ='A' or estado='I'),
    cliente_id 				int(11),
    producto_id 			int(11) not null,
    foreign key (cliente_id) 	references cliente(cliente_id),
    foreign key (producto_id) 	references producto(producto_id)
);

create table banco(
	banco_id 				int(11) not null auto_increment primary key,
	nombre 					varchar(50) not null,
    fecha_registro 			date not null,
    estado 					varchar(1) not null
);

create table tipo_tarjeta(
	tipo_tarjeta_id			int(11) not null auto_increment primary key,
	nombre 					varchar(50) not null,
    fecha_registro 			date not null,
    estado 					varchar(1) not null,
    banco_id 				int(11) not null,
    foreign key (banco_id) 	references banco(banco_id)
);

create table tipo_pago(
	tipo_pago_id 			int(11) not null auto_increment primary key,
	tipo_pago 				varchar(50) not null,
    fecha_registro 			date not null,
    cuotas_pago 			int(11) not null check (cuotas_pago >0 or cuotas_pago<12),
    estado 					varchar(1) not null
);

create table costo_entrega(
	costo_entrega_id 	int(11) not null auto_increment PRIMARY KEY,
    codigo_postal 		varchar(5) not null,
    ciudad 				varchar(20) not null,
    parroquia 			varchar(20) not null,
    precio 				float not null,
    fecha_registro 		date not null,
    estado 				varchar(1)  not null check (estado ='A' or estado='I')
);

create table entrega_domiclio(
	entrega_domiclio_id 	int(11) not null auto_increment PRIMARY KEY,
    direccion_entrega 		varchar(50) not null,
    fecha_registro 			date not null,
    estado 					varchar(1) not null check (estado ='A' or estado='I'),
    costo_entrega_id 		int(11) not null,
	foreign key (costo_entrega_id) references costo_entrega(costo_entrega_id)
);

create table orden_cab(
	orden_id 				int(11) not null auto_increment primary key,
    fecha_registro 			date not null,
    estado 					varchar(1) not null check (estado ='A' or estado='I'),
	cliente_id 				int(11) not null,
    entrega_domiclio_id		int(11),
    foreign key (cliente_id) 			references cliente(cliente_id),    
	foreign key (entrega_domiclio_id) 	references entrega_domiclio(entrega_domiclio_id)    
);

create table orden_det_producto(
	orden_detalle_id 		int(11) not null auto_increment primary key,
    orden_id 				int(11) not null,
    producto_id 			int(11) not null,
	cantidad 				int(11) not null,
    precio 					float not null,	
	foreign key (orden_id) 		references orden_cab(orden_id),
    foreign key (producto_id) 	references producto(producto_id)
);

create table factura_cab(
	factura_id 				int(11) not null auto_increment primary key,
	orden_id 				int(11) not null,
	nro_comprobante 		varchar(50) not null,
    entrega_domiclio_id		int(11),
    fecha_registro 			date not null,
    estado 					varchar(20) not null,
    foreign key (orden_id) 				references orden_cab(orden_id)
);

create table pago_cab(	
	pago_cab_id				int(11) not null auto_increment primary key,    
    fecha_registro 			date not null,     
	estado 					varchar(1) not null check (estado ='A' or estado='I')	
);


create table pago_det(	
	pago_det_id				int(11) not null auto_increment primary key,
    factura_id				int(11) not null,
    tipo_pago_id			int(11) not null,
    tipo_tarjeta_id			int(11),
    pago_cab_id				int(11) not null,
    fecha_registro 			date not null,
    total 					float,    
	estado 					varchar(1) not null check (estado ='A' or estado='I'),
    foreign key (pago_cab_id) 		references pago_cab(pago_cab_id),
	foreign key (tipo_pago_id) 		references tipo_pago(tipo_pago_id),
    foreign key (tipo_tarjeta_id) 	references tipo_tarjeta(tipo_tarjeta_id)    
);

create table factura_detalle(
	factura_detalle 		int(11) not null auto_increment primary key,
	factura_id 				int(11) not null,
    pago_cab_id 			int(11) not null,
    iva 					float,
    descuento 				float,
    precio_total 			float,
    estado 					varchar(1) not null check (estado ='A' or estado='I'),
    foreign key (factura_id) 	references 	factura_cab(factura_id),
    FOREIGN KEY (pago_cab_id) 	REFERENCES pago_cab(pago_cab_id) ON DELETE RESTRICT
);



