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
select * from empresa;
create table cliente(
	cliente_id int
);

