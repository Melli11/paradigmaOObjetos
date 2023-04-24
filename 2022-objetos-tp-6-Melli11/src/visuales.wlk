import viento.*

class VidasVisual {
	const personaje

	method text() = "Vidas: " + personaje.vidas().toString()
	method textColor() = color.negro()
}

class PuntajeVisual {
	const personaje
	
	method text() = "Puntos: " + personaje.puntos().toString()
	method textColor() = color.negro()
}

object color {
	method negro() = "000000"
	method verde() = "00FF00"
	method rojo() = "FF0000"
	method gris() = "333333"
	method grisClaro() = "AAAAAA"
}

object vientoVisual {
	method text() = "Viento: " + viento.comoString()
	method textColor() = color.grisClaro()
}
