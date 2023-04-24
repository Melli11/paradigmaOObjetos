# TP 6: Herencia y composición

El objetivo del TP es **refactorizarlo** para eliminar la lógica repetida que existe en el archivo `cosasQueCaen.wlk`.

La idea del juego que ya está implementado es la siguiente:
- Controlamos un personaje que se puede mover a izquierda o derecha, si se sale de pantalla vuelve por el otro lado.
- Hay que esquivar algunos objetos que caen y agarrar otros.
   - Las frutas curan 1 de vida.
   - El dinero suma una cantidad de puntos, y si cae al piso sin que lo agarremos nos hace perder 1 vida.
   - Los explosivos hacen perder 1 vida.
- Diferentes objetos caen de diferentes formas:
   - Las manzanas, monedas y bombas caen en línea recta.
   - Las peras, gemas y dinamita caen haciendo una línea en zigzag.
   - Las uvas, billetes y granadas caen afectadas por el viento (que puede ir variando en intensidad y dirección).

Para probar el juego se puede correr `program.wpgm`, y para verificar que las cosas siguen andando se pueden correr los tests.
