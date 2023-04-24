import wollok.game.*
import protagonista.*
import visuales.*
import nube.*
import gameEngine.*
import direccion.*
import viento.*
import nivel.*

object juego {
	var protagonista

	method protagonista() = protagonista

	method inicializarProtagonista(nivel) {
		protagonista = new Protagonista(
			x=game.width().div(2),
			puntos=0,
			vidas=3,
			nivel=nivel
		)
	}

	method jugar() {
		const ancho = 30
		const alto = 30
		game.cellSize(10)
		game.width(ancho)
		game.height(alto)
		const nivel = new Nivel(ancho=ancho + 2, xInicial=-3)
		self.inicializarProtagonista(nivel)
		game.addVisual(protagonista)
		game.onCollideDo(protagonista, {
			algo => protagonista.agarrar(algo)
		})
		self.agregarHUD(protagonista)
		self.configurarContoles(protagonista)
		self.lloverCosas(nivel)
		game.onTick(
			7000,
			"cambiarViento",
			{
				const nuevaIntensidad = (1..3).anyOne()
				const nuevaDireccion = [izquierda, derecha].anyOne()
				viento.soplarHacia(nuevaDireccion, nuevaIntensidad)
			} 
		)


		game.start()
	}

	method hacerAvanzar(cosa) {
		if(gameEngine.hasVisual(cosa)) {
			cosa.avanzar()
		} else {
			gameEngine.removeTick(cosa)
		}
	}

	method lloverCosas(nivel) {
		gameEngine.onRandomTick((1000..2000), "llover", {
			const cosa = nube.lloverCosa(nivel)
			gameEngine.addVisual(cosa)
			gameEngine.onRandomTick(
				200..500,
				cosa,
				{ self.hacerAvanzar(cosa) }
			)
		})
	}

	method sePerdioUnaMoneda() {
		protagonista.sePerdioUnaMoneda()
	}

	method agregarHUD(personaje) {
		game.addVisualIn(
			new VidasVisual(personaje=personaje),
			game.at(1, game.height() - 5)
		)
		game.addVisualIn(
			vientoVisual,
			game.at(1, game.height() - 8)
		)
		game.addVisualIn(
			new PuntajeVisual(personaje=personaje),
			game.at(game.width() - 8, game.height() - 5)
		)
	}

	method configurarContoles(personaje) {
		keyboard.left().onPressDo {
			personaje.moverHaciaIzquierda()
		}
		keyboard.right().onPressDo {
			personaje.moverHaciaDerecha()
		}		
	}
}
