-- En este documento se encuentran todas las líneas de código SQL necesarias para crear la base de datos planteada en el ejercicio de este exámen

show databases;

create database PizzaFiesta;

use PizzaFiesta;

create table clientes(
    idCliente int primary key,
    nombreCliente varchar(50) not null,
    telefonoCliente varchar(50) not null,
    direccionCliente varchar(50) not null
);

create table pedidos(
    idPedido int primary key,
    fechaPedido date,
    horaRecogida time,
    estado enum("Pendiente", "En preparación", "Listo para recoger", "Recogido") default "Pendiente",
    totalPago int,
    fechaPago date,
    metodoPago enum("Efectivo", "Tarjeta", "Otro") default "Efectivo",
    idCliente int,
    foreign key (idCliente) references cliente(idCliente)
);

create table productos(
    idProducto int primary key,
    nombreProducto varchar(50) not null,
    tipoProducto enum("Pizza", "Bebida", "Combo") default "Pizza",
    descripcionProducto varchar(50) not null,
    precioBaseProducto int
);

create table ingredientes(
    idIngrediente int primary key,
    nombreIngrediente varchar(50) not null,
    precioExtra int,
    descripcionIngrediente varchar(50) not null
);

create table ingredientesPedido(
    idPedido int,
    idIngrediente int,
    foreign key (idPedido) references pedidos(idPedidos),
    foreign key (idIngrediente) references ingredientes(idIngredientes),
    primary key(idPedido, idIngrediente)
);

create table productosPedido(
    idPedido int,
    idProducto int,
    cantidadProducto int,
    foreign key (idPedido) references pedidos(idPedido),
    foreign key (idProducto) references productos(idProducto),
    primary key (idPedido, idProducto)
);

create table pizzas(
    idPizza int primary key,
    nombrePizza varchar(50) not null,
    tamanoPizza enum("Pequena", "Mediana", "Grande") default "Mediana",
    precioPequena int,
    precioMediana int,
    precioGrande int,
    idProducto int,
    foreign key (idProducto) references productos(idProducto)
);

create table ingredientesPizza(
    idPizza int,
    idIngrediente int,
    cantidadIngrediente float,
    foreign key(idPizza) references pizzas(idPizza),
    foreign key (idIngrediente) references ingredientes(idIngrediente),
    primary key(idPizza, idIngrediente)
);

create table bebidas(
    idBebida int primary key,
    nombreBebida varchar(50) not null,
    precioBebida int,
    idProducto int,
    foreign key (idProducto) references productos(idProducto)
);

create table combos(
    idCombo int primary key,
    nombreCombo varchar(50) not null,
    descripcionCombo varchar(50) not null,
    precioCombo int
);

create table productosCombos(
    idCombo int,
    idProducto int,
    foreign key (idCombo) references combos(idCombo),
    foreign key (idProducto) references productos(idProducto),
    primary key(idCombo, idProducto)
);