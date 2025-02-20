# Pizza Fiesta

## 1. Descripción General del Proyecto

El sistema de base de datos para la pizzería *Pizza Fiesta* está diseñado para gestionar eficientemente las operaciones diarias del negocio. El sistema permite registrar y administrar información sobre clientes, productos (pizzas, bebidas e ingredientes), y pedidos. Los clientes podrán personalizar sus pizzas seleccionando los ingredientes disponibles y eligiendo el tamaño (pequeña, mediana, grande), y el sistema controlará el inventario de ingredientes y precios según el tamaño de la pizza. Los pedidos solo serán preparados después de confirmar el pago, y se gestionará la hora de recogida del pedido.

Este sistema automatiza el proceso de pedidos y el control de inventarios, mejorando la experiencia del cliente al permitirles personalizar sus pedidos y gestionando el flujo de pagos y recogidas de manera más eficiente.

### 1.1. Características Principales

- **Gestión de Clientes**: Permite registrar información detallada de los clientes, como nombre, número de contacto y dirección.
- **Gestión de Productos**: Permite registrar diferentes tipos de pizzas (pequeñas, medianas y grandes) y bebidas. 
- **Gestión de Ingredientes**: Los clientes pueden personalizar sus pizzas añadiendo ingredientes adicionales, con un costo adicional por cada ingrediente extra.
- **Gestión de Pedidos**: Los pedidos se procesan después de la confirmación del pago, y el cliente indica la hora de recogida al realizar el pedido.
- **Detalles de Pedido**: Se puede detallar el proceso de preparación de las pizzas y visualizar los costos en función de los ingredientes y el tamaño seleccionado.
- **Pagos y Recogida**: El sistema asegura que los pedidos solo se comiencen a preparar una vez confirmado el pago, sin costos adicionales, ya que los clientes deben recoger su pedido personalmente.

---

## 2. Instrucciones para Ejecutar Archivos SQL

Para ejecutar los archivos SQL y crear o manipular la base de datos, siga los siguientes pasos:


 ### 2.1. **Crear la Base de Datos**:
   - Para crear la base de datos use el comando:
     create database pizza_fiesta;

 ### 2.2. **Importar el archivo SQL**:
   - Dentro de un IDE para SQL como "DBeaver" abra el archivo "PizzaFiesta.sql"

 ### 2.3. **Ejecutar las consultas SQL**:
   - Una vez importado el archivo con las consultas, ejecute las consultas con la combinación de teclas "Ctrl + Enter" al final de cada línea de código separada por un ";"

---
     
## 3. Consultas SQL

-- **Inserción necesaria**
insert into productos(idProducto, nombreProducto, tipoProducto, descripcionProducto, precioBaseProducto) values (1, "Coca-Cola", "Bebida", "Gaseosa Coca-Cola", 4500);

-- **Consulta # 1**
insert into clientes(idCliente, nombreCliente, telefonoCliente, direccionCliente) values (1, "Gonzalo Acosta", "3163551471", "Carrera 35 #12-27");

-- **Consulta # 2**
insert into pizzas(idPizza, nombrePizza, tamanoPizza, precioPequena, precioMediana, precioGrande) values (1, "Carnes", "Mediana", "14000", "28000", "50000");

-- **Consulta # 3**
insert into bebidas(idBebida, nombreBebida, precioBebida, idProducto) values (1, "Coca-cola", 4500, 1);

-- **Consulta # 4**
insert into ingredientes(idIngrediente, nombreIngrediente, precioExtra, descripcionIngrediente) values (1, "Pimienta", 1500, "Especia");

-- **Consulta # 5**
insert into pedidos(idPedido, fechaPedido, horaRecogida, estado, totalPago, fechaPago, metodoPago, idCliente) values (1, "2025-02-19", "20:00:00", "Recogido", 32500, "2025-02-19", "Efectivo", 1);

-- **Consulta # 6**
alter table productosPedido modify column cantidadProducto = 2 where idPedido = 1;

-- **Consulta # 7**
alter table ingredientesPedido add column idIngrediente = 1 where idPedido = 1; 

-- **Consulta # 8**
select p.idPedido, pr.NombreProducto, pp.CantidadProducto, i.nombreIngrediente, ip.cantidadIngredientesExtra from pedidos p join productosPedido pp on p.idPedido = pp.idPedido join productos pr on pp.idProducto = pr.idProducto left join ingredientesPedido ip on p.idPedido = ip.idPedido where p.idPedido = 1;

-- **Consulta # 9**
update pizzas set precioMediana = 8500 where idPizza = 1;

-- **Consulta # 10**
update clientes set direccionCliente = "Carrera 29 #94-03" where idCliente = 1;

-- **Consulta # 11**
delete from bebidas where idBebida = 1;

-- **Consulta # 12**
delete from ingredientes where idIngrediente = 1;

-- **Consulta # 13**
select * from pedidos where idCliente = 1;

-- **Consulta # 14**
select "Pizza" as tipo, nombrePizza as nombre, precioMediana as precio from pizzas union select "Bebida", nombreBebida, precioBebida from bebidas;

-- **Consulta # 15**
select nombreIngrediente, precioExtra from ingredientes;

---

## 3.1. Observaciones para las Consultas SQL

Para ejecutar correctamente las consultas SQL recién entregadas es necesario tener en cuenta ciertos puntos como:

Anotaciones:
-estado de “pedidos” es un enum(“Pendiente”, “En preparación”, “Listo para recoger”, “Recogido”)
-metodo de “pedidos” es un enum(“Efectivo”, “Tarjeta”, “Otro”)
-tipo de “producto” es un enum(“Pizza”, “Bebida”, “Combo”)
-tamano de “pizza” es un enum(“Pequena”, “Mediana”, “Grande”)



