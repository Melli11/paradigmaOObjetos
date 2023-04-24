import wollok.game.*

// delegando en gameEngine en vez de directamente en wollok.game
// puedo cambiar quien recibe los mensajes.
// En este caso lo voy a usar para reemplazar a game por un
// objeto polimorfico que voy a usar en los tests.

// de paso lo uso para agregar comportamiento que no exisste
// en game
object gameEngine {
	var engine = game
	var ticks = []
	method ticks() = ticks
	
	method configurarParaTests() {
		engine = gameFalso
	}
	method addVisual(visual) {
		engine.addVisual(visual)
	}
	method removeVisual(visual) {
		engine.removeVisual(visual)
	}
	method hasVisual(visual) = engine.hasVisual(visual)
	method at(x, y) = engine.at(x, y)
	
	method removeTick(tick) {
		ticks.remove(tick)
	}
	
	method onRandomTick(rangoDeMilisegundos, clave, accion) {
		ticks.add(clave)
		self.runOnRandomTick(rangoDeMilisegundos, clave, accion)
	}
	
	// metodo auxiliar para que separar el ejecutar recursivamente
	// con el poder anotar en 'ticks' que cosas hay que seguir
	// corriendo y cuales dejar de correr
	method runOnRandomTick(rangoDeMilisegundos, clave, accion) {
		const bloqueConPasoRecursivo = {
			accion.apply()
			self.runOnRandomTick(rangoDeMilisegundos, clave, accion)
		}

		// mientras exista 'clave' en ticks, se va a correr la accion
		if(ticks.contains(clave)) {
			engine.schedule(
				rangoDeMilisegundos.anyOne(),
				bloqueConPasoRecursivo
			)
		}
	}
}


// objeto usado para los tests
object gameFalso {
	const visuals = []
	method addVisual(visual) {
		visuals.add(visual)
	}
	method removeVisual(visual) {
		visuals.remove(visual)
	}
	method hasVisual(visual) = visuals.contains(visual)
	method at(x, y) = new Position(x=x, y=y)
	method schedule(milliseconds, action) {
		//no hace nada
	}
}
