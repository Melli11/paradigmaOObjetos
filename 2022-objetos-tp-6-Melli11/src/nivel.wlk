import wollok.game.*

class Nivel {
	const xInicial = 0
	const ancho
	
	method extremoDerecho() = self.maxX()
	method extremoIzquierdo() = self.minX()
	method maxX() = xInicial + ancho - 1
	method minX() = xInicial
	
	method posicionAlMoverseA(posicionDestino) {
		return game.at(self.xAlMoverseA(posicionDestino.x()), posicionDestino.y())
	}
	
	method xAlMoverseA(xDestino) {
		if(xDestino > self.maxX()) {
			return self.xAlMoverseA(self.minX() + ((self.maxX() - xDestino).abs() - 1))
		} else if(xDestino < self.minX()) {
			return self.xAlMoverseA(self.maxX() - ((self.minX() - xDestino).abs() - 1))
		} else {
			return xDestino
		}
	}
}
