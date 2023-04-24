import wollok.game.*

class Protagonista {
	var x = 0
	var vidas = 3
	var puntos
	var nivel
	
	method x() = x
	method moverHaciaDerecha() {
		x = nivel.xAlMoverseA(x + 1) 
	}
	method moverHaciaIzquierda() {
		x = nivel.xAlMoverseA(x - 1)
	}

	method text() = "^_^"
	method position() = game.at(x, 0)	
	
	method vidas() = vidas
	method ganarUnaVida() {
		vidas += 1
	}
	method perderUnaVida() {
		vidas -= 1
	}
	
	method puntos() = puntos
	method ganarPuntos(cantidad) {
		puntos += cantidad
	}

	method agarrar(algo) {
		algo.afectar(self)
		algo.desaparecer()
	}
	
	method sePerdioUnaMoneda() {
		vidas -= 1
	}
}
