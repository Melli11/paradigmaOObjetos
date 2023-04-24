## Consigna TP 4

Nos contactaron de una cadena de supermercados para implementar un sistema de compra online.
Necesitan que un cliente pueda:
- Agregar productos a su carrito de compras. Un producto tiene asociado un código de producto y un precio. Por ejemplo: "grog_pack_x_6" que sale $300, o "pack_figuritas_mundial" que sale $15000.
- Consultar el total a pagar de su carrito.
- Sacar productos del mismo. 
- Limpiar el carrito, lo cual lo deja sin ningún producto.
- Realizar la compra con su carrito.

Al realizar la compra pasan dos cosas:
- El supermercado registra una venta con la información del total facturado y los productos vendidos
- El cliente ahora tiene un carrito vacío.

Además, del supermercado quieren poder conocer lo siguiente:
- Cuál es el total facturado hasta el momento (el total de todas las ventas).
- Cuál es el código del producto que más veces se vendió.

## BONUS
Sabiendo que el precio de un producto puede ir variando a lo largo del tiempo, implementar lo que sea necesario para que el supermercado pueda saber, para un producto en particular, cuánto aumento tuvo, que se puede calcular como la diferencia entre lo más barato y lo más caro que se vendió.
Por ejemplo, si el precio de "grog_pack_x_6" estuvo en alguna venta en la que costó 100, en otra venta en la que costó 300 y en otra venta en la que costó 500, su aumento fue de 400 (500 - 100)
