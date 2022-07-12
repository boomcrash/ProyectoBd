/*create database SweetDreams;*/
use SweetDreams;
/* Aqui estara*n los datos generales de la empresa*/
/*MAESTRA*/
create table empresa(
	empresa_id int(11) not null auto_increment PRIMARY KEY,
	nombre varchar(50),
    ruc varchar(50)
);
/* Aqui estaran los datos especificos de la empresa*/
/*MAESTRA*/
create table empresa_detalle(
	empresa_detalle_id int(11) not null auto_increment PRIMARY KEY,
	razon_social varchar(50),
    actividad_economica varchar(50),
    tipo_contribuyente enum('natural','sociedad'),
    subtipo_contribuyente int(11),
    clase_contribuyente enum('especial','rise','otros'),
    contabilidad enum('si','no'),
    fecha_inicio date,
    fecha_actualizacion date,
    fecha_cese date,
    agente_retencion enum('si','no'),
    fecha_registro date,
    estado varchar(1),
    empresa_id int(11),
    foreign key (empresa_id) references empresa(empresa_id)
);
/* Aqui estaran todas las sucursales de la empresa*/
/*MAESTRA*/
create table matriz(
	matriz_id int(11) not null auto_increment PRIMARY KEY,
	nombre varchar(50),
    pais varchar(50),
    canton varchar(50),
    ciudad varchar(50),
    direccion varchar(50),
    fecha_registro date,
	estado varchar(1),
    empresa_id int(11),
	foreign key (empresa_id) references empresa(empresa_id)
);
/* Aqui estaran cada medida para un producto*/
/*MAESTRA*/
create table medida(
	medida_id int(11) not null auto_increment PRIMARY KEY,
	plaza float,
    ancho int,
    alto int,
	profundidad int,
    fecha_registro date,
    estado varchar(1)
);
/* Aqui estaran todos lo caracteriza el precio para un producto*/
/*MAESTRA*/
create table precio(
	precio_id int(11) not null auto_increment PRIMARY KEY,
	precio_normal float(11),
    descuento_web float(11),
    descuento_especial float(11),
    fecha_registro date,
    estado int(11)
);
/* Aqui estaran cada proveedor disponible*/
/*MAESTRA*/

create table proveedor(
	proveedor_id int(11) not null auto_increment PRIMARY KEY,
	nombre varchar(50),	
    direccion varchar(50),
    telefono varchar(50),
    fecha_registro date,
    estado varchar(1)
);
/* Aqui estaran los tipos de productos como : colchon - almohada*/
/*MAESTRA*/
create table tipo(
	tipo_id int(11) not null auto_increment PRIMARY KEY,
    tipo varchar(50),
    fecha_registro date,
    estado varchar(1)
);
/* Aqui estaran las categorias de productos como : confort - uso*/
/*MAESTRA*/
create table categoria(
	categoria_id int(11) not null auto_increment PRIMARY KEY,
    nombre_categoria varchar(50),
    fecha_registro date,
    estado varchar(1)
);
/* Aqui estaran las subcategorias de productos como : suave - protector de colchon*/
/*MAESTRA*/
create table clasificacion(
	clasificacion_id int(11) not null auto_increment PRIMARY KEY,
    nombre_clasificacion varchar(50),
    fecha_registro date,
    estado varchar(1)
);
/* Aqui estaran los productos con toda su informacion general */
/*MAESTRA*/
create table producto(
	producto_id int(11) not null auto_increment PRIMARY KEY,
    nombre varchar(50),
    stock int(11),
    garantia int(11),
	empresa_id int (11),
	foreign key (empresa_id) references empresa(empresa_id)
);
/* Aqui estara la informacion especifica de cada producto */
/*MAESTRA*/
create table producto_detalle(
	producto_detalle_id int(11) not null auto_increment PRIMARY KEY,
    color varchar(50),
    nivel_soporte int(11),
	fecha_registro date,
    estado  varchar(1),
    precio_id int(11),
    proveedor_id int(11),
    tipo_id int (11),
    categoria_id int (11),
    clasificacion_id int (11),
    producto_id int(11),
    foreign key (precio_id) references precio(precio_id), 
    foreign key (proveedor_id) references proveedor(proveedor_id), 
    foreign key (tipo_id) references tipo(tipo_id), 
    foreign key (categoria_id) references categoria(categoria_id), 
	foreign key (clasificacion_id) references clasificacion(clasificacion_id),
    foreign key (producto_id) references producto(producto_id)
);
/* Aqui estaran los registros de todas las medidas que existen para un producto*/
/*MAESTRA*/
create table producto_has_medida(
	producto_detalle_id int(11),
    medida_id int(11),
	foreign key (producto_detalle_id) references producto_detalle(producto_detalle_id), 
    foreign key (medida_id) references medida(medida_id)
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



