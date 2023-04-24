# Consigna TP-2

## Bloques - Balanza

1- Definir un objeto `balanza` que pueda decirnos si un objeto es mayor a otro según algún criterio.
Y que también nos sepa decir si dos objetos son iguales según un criterio.

2- Definir los siguientes objetos que saben contestar su peso y su volumen:
- kilo de plomo, que pesa 1 kilo y ocupa 0.00009 metros cubicos
- kilo de plumas, que pesa 1 kilo y ocupa 0.4 metros cubicos

3- Hacer tests usando la balanza para los siguientes casos (si ya los habías hecho por hacer TDD genial, pueden pasar al 4 `:)`):
- un kilo de plomo no es mayor a un kilo de plumas según su peso.
- un kilo de plumas no es mayor a un kilo de plomo según su peso.
- un kilo de plumas es igual a un kilo de plomo segun su peso.
- un kilo de plumas es igual a un kilo de plomo según su peso.
- un kilo de plumas es mayor a un kilo de plomo según su volumen.

4- Agregar una caja de madera, que puede contener algo y que su peso se calcula como 0.2 kilos + el peso de lo que lleve adentro y su volumen se calcula como 1 metro cúbico.

5-
- Hacer un test que chequee que algún objeto es menor según su peso que el mismo objeto dentro de la caja.
- Hacer un test chequeando que el peso de la caja vacía es de 0.2 kilos.
