/** First Wollok example */
class Persona{
	var tipoDePersona = 0 //mas adelante
	const property profesion = null //alguna
	var property sueniosPendientes = #{}
	var property sueniosCumplidos = #{}
	var property quiereEstudiar = null//setear carrera
	var property remuneracionPretendida = 0
	var property tieneHijos = false
	var property lugaresQueDeseaViajar = []
	var property felicidad = 0
	
	method agregarSuenio(suenio){
		sueniosPendientes.add(suenio)
	}
	
	method agregarSuenioCumplido(suenio){
		sueniosCumplidos.add(suenio)
	}
	
	method cumplirSuenio(suenio){
		if(!suenio.puedeSerCumplidoPor(self)){	
			self.agregarSuenio(suenio) //suenio pendiente
//			self.error("no se puede cumplir el sueño")	
		}
		felicidad = felicidad + suenio.felicidonios()
		self.agregarSuenioCumplido(suenio)
	
	}
	
	method deseaViajar(destino) = lugaresQueDeseaViajar.any{lugares=> lugares == destino}
	
	method realizarSuenios(){
		var suenioSeleccionado = tipoDePersona.prioridad(self.sueniosPendientes())
		self.cumplirSuenio(suenioSeleccionado)
	}
	
	method esFeliz() = self.felicidad() > self.felicidoniosSueniosPendientes() 
	
	method felicidoniosSueniosPendientes() = sueniosPendientes.sum{s => s.felicidonios()}
	
	method esAmbicioso() = 
	sueniosPendientes.count{s => s.felicidonios() >100 }  
	+ sueniosCumplidos.count{s => s.felicidonios() >100 } 
	>3
}


class Suenio{
	const property felicidonios = 10
}

class RecibirseDe inherits Suenio{
	var property carrera = null
	
	method puedeSerCumplidoPor(persona) = persona.quiereEstudiar() == self.carrera() and persona.profesion() != self.carrera() 
}
class ConseguirTrabajo inherits Suenio{
	var property remuneracion
	
	method puedeSerCumplidoPor(persona) = self.remuneracion() >= persona.remuneracionPretendida()
}


class TenerUnHijo inherits Suenio{
	
	method puedeSerCumplidoPor(persona) = persona.tieneHijos(true)
}

class TenerHijoAdoptivo inherits Suenio{
	const cantidad
	
	method puedeSerCumplidoPor(persona) = not persona.tieneHijos()
}

class ViajarA inherits Suenio{
	const destino = "casa"
	
	method puedeSerCumplidoPor(persona) = persona.deseaViajar(destino)
}


//PUNTO 2
const suenioMultiple = [new ViajarA (destino = "cataratas"), new TenerUnHijo(), new ConseguirTrabajo(remuneracion = 10000)]

//PUNTO 3

object realista{
	method prioridad(sueniosPendientes) = sueniosPendientes.max{s => s.felicidonios()}
}

object alocado{
	method prioridad(sueniosPendientes) = sueniosPendientes.anyOne()
}

object obsesivos{
	method prioridad(sueniosPendientes) = sueniosPendientes.first()
}
