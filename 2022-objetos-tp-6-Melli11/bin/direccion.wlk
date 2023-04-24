import wollok.game.*

class DireccionHorizontal {
	method trasladarPosicion(posicion, cantidad) {
		return posicion.right(self.sentido() *  cantidad)
	}
	
	method sentido()
}

object izquierda inherits DireccionHorizontal {
	override method sentido() = -1
	
	method opuesta() = derecha
	
	method simbolo() = "<"
}

object derecha inherits DireccionHorizontal {
	override method sentido() = 1
	
	method opuesta() = izquierda
	
	method simbolo() = ">"
}
