import wollok.game.*
import cosasQueCaen.*

object nube {
	method lloverCosa(nivel) {
		const x = (0..game.width()).anyOne()
		return self.cosaAlAzar(game.at(x, game.height()), nivel)	
	}
	
	method cosaAlAzar(posicion, nivel) = [
		{ new Granada(posicion=posicion, nivel=nivel) },
		{ new Dinamita(posicion=posicion, nivel=nivel) },
		{ new Bomba(posicion=posicion, nivel=nivel) },

		{ new Moneda(valor=1, posicion=posicion, nivel=nivel)},
		{ new Gema(valor=3, posicion=posicion, nivel=nivel)},
		{ new Billete(valor=3, posicion=posicion, nivel=nivel)},
		
		{ new Manzana(posicion=posicion, nivel=nivel) },		
		{ new Pera(posicion=posicion, nivel=nivel) },
		{ new Uvas(posicion=posicion, nivel=nivel) }
	].anyOne().apply()
}
