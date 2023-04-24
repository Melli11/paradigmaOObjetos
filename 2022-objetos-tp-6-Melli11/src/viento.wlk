import direccion.*

object viento {
	var intensidad = 1
	var direccion = izquierda
	
	method comoString() =
		(1..intensidad).map { n => direccion.simbolo() }.join("")

	method trasladarPosicion(posicion) {
		return direccion.trasladarPosicion(posicion, intensidad)
	}

	method soplarHacia(unaDireccion, unaIntensidad) {
		direccion = unaDireccion
		intensidad = unaIntensidad
	}
 
	method soplarHaciaIzquierdaConIntensidad(unaIntensidad) {
		self.soplarHacia(izquierda, unaIntensidad)
	}
	
	method soplarHaciaDerechaConIntensidad(unaIntensidad) {
		self.soplarHacia(derecha, unaIntensidad)
	}
}
