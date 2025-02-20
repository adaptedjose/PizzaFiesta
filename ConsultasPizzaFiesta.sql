-- Consultas base de datos Pizza Fiesta
-- En este documento se encuentran las primeras quince consultas/inserciones planteadas en el documento de este exámen, también algunas inserciones necesarias para el correcto funcionamiento de otras

-- Inserción necesaria
insert into productos(idProducto, nombreProducto, tipoProducto, descripcionProducto, precioBaseProducto) values (1, "Coca-Cola", "Bebida", "Gaseosa Coca-Cola", 4500);

-- Consulta # 1
insert into clientes(idCliente, nombreCliente, telefonoCliente, direccionCliente) values (1, "Gonzalo Acosta", "3163551471", "Carrera 35 #12-27");

-- Consulta # 2
insert into pizzas(idPizza, nombrePizza, tamanoPizza, precioPequena, precioMediana, precioGrande) values (1, "Carnes", "Mediana", "14000", "28000", "50000");

-- Consulta # 3
insert into bebidas(idBebida, nombreBebida, precioBebida, idProducto) values (1, "Coca-cola", 4500, 1);

-- Consulta # 4
insert into ingredientes(idIngrediente, nombreIngrediente, precioExtra, descripcionIngrediente) values (1, "Pimienta", 1500, "Especia");

-- Consulta # 5
insert into pedidos(idPedido, fechaPedido, horaRecogida, estado, totalPago, fechaPago, metodoPago, idCliente) values (1, "2025-02-19", "20:00:00", "Recogido", 32500, "2025-02-19", "Efectivo", 1);

-- Consulta # 6
alter table productosPedido modify column cantidadProducto = 2 where idPedido = 1;

-- Consulta # 7
alter table ingredientesPedido add column idIngrediente = 1 where idPedido = 1; 

-- Consulta # 8
select p.idPedido, pr.NombreProducto, pp.CantidadProducto, i.nombreIngrediente, ip.cantidadIngredientesExtra from pedidos p join productosPedido pp on p.idPedido = pp.idPedido join productos pr on pp.idProducto = pr.idProducto left join ingredientesPedido ip on p.idPedido = ip.idPedido where p.idPedido = 1;

-- Consulta # 9
update pizzas set precioMediana = 8500 where idPizza = 1;

-- Consulta # 10 
update clientes set direccionCliente = "Carrera 29 #94-03" where idCliente = 1;

-- Consulta # 11
delete from bebidas where idBebida = 1;

-- Consulta # 12
delete from ingredientes where idIngrediente = 1;

-- Consulta # 13
select * from pedidos where idCliente = 1;

-- Consulta # 14
select "Pizza" as tipo, nombrePizza as nombre, precioMediana as precio from pizzas union select "Bebida", nombreBebida, precioBebida from bebidas;

-- Consulta # 15 
select nombreIngrediente, precioExtra from ingredientes;