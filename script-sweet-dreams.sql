create database SweetDreams;
create table empresa(
	empresa_id int(11) not null auto_increment PRIMARY KEY,
	nombre varchar(50),
    ruc varchar(50),
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
    estado varchar(1)
);

create table matriz(
	matriz_id int(11) not null auto_increment PRIMARY KEY,
	nombre varchar(50),
    direccion varchar(50),
    fecha_registro date,
	estado varchar(1),
    empresa_id int(11),
    foreign key (empresa_id) references empresa(empresa_id)
);
Select * from matriz;

create table confort(
	confort_id int(11) not null auto_increment PRIMARY KEY,
    nombre  varchar(50),
    fecha_registro date,
    estado varchar(1)
);

create table medidas(
	medidas_id int(11) not null auto_increment PRIMARY KEY,
	plaza float,
    ancho float,
    alto float,
    fecha_registro date,
    estado varchar(1)
);

create table colchon(
	colchon_id int(11) not null auto_increment PRIMARY KEY,
    nombre_colchon varchar(50),
    descripcion varchar(50),
	confort_id int(11),
    medidas_id int (11),
    producto_id int (11),
	foreign key (confort_id) references confort(confort_id),
    foreign key (medidas_id) references medidas(medidas_id),
    foreign key (producto_id) references producto(producto_id)
);

create table producto(
	producto_id int(11) not null auto_increment PRIMARY KEY,
	fecha_registro date,
    estado  varchar(1),
    precio_id int(11),
    proveedor_id int(11),
    categoria_id int (11),
	empresa_id int (11),
    foreign key (proveedor_id) references proveedor(proveedor_id), 
	foreign key (categoria_id) references categoria(categoria_id),
    foreign key (empresa_id) references empresa(empresa_id)
);

create table precio(
	precio_id int(11) not null auto_increment PRIMARY KEY,
	precio_normal int(11),
    descuento_web int(11),
    fecha_registro int(11),
    estado int(11)
);

create table proveedor(
	proveedor_id int(11),
	nombre varchar(50),	
    direccion varchar(50),
    telefono varchar(50),
    fecha_registro date,
    estado varchar(1)
);
create table categoria(
	categoria_id int(11) not null auto_increment PRIMARY KEY,
    nombre_categoria varchar(50),
    fecha_registro date,
    estado varchar(1)
);

create table producto_has_proveedor(
	categoria_id int(11),
    proveedor_id int(11),
    foreign key (categoria_id) references categoria(categoria_id),
    foreign key (proveedor_id) references proveedor(proveedor_id)
    

);

