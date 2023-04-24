/** First Wollok example */


class Expedicion{
	var destino = #{} // puede haber mas de un destino en la expedicion
	var ejercito = #{}
	
	method ejercito() = ejercito
	
	method subirAVikingo(unVikingo) {
		if(!unVikingo.puedeSubirA(self)){
			self.error("No es posible subir al vikingo, no cumple las condiciones")
		}
		self.agregarVikingoAExpedicion(unVikingo)
 	}
	
	method agregarVikingoAExpedicion(unVikingo){
		ejercito.add(unVikingo)
	}
	method valeLaPena() = destino.all{lugar => lugar.valeLaPena(self.tamanioDelEjercito())}
	
	method tamanioDelEjercito() = ejercito.size()
	
	method realizarExpedicion() = 
	destino.forEach{lugar => lugar.esInvadidoPor(self)}
	
	method repartirBotin(botin) {
	ejercito.forEach{integrante 
		=> integrante.ganarOro(botin/self.tamanioDelEjercito())
	}
		
	}
	
}

class Vikingo{
	var property casta
	var property oro = 0
	method puedeSubirA(unaExpedicion) = 
		self.esProductivo() && casta.puedeSubirA(self,unaExpedicion)
	
	method esProductivo()
	
	method ganarOro(cantidadGanada) {
		oro = oro + cantidadGanada
	}
	
	method ascender(){
		casta.ascender(self)
	}
	

}

//PROFESIONES
class Soldado inherits Vikingo{
	var property cantidadDeArmas
	var property asesino
	
	override method esProductivo() = asesino > 20 && cantidadDeArmas >0
	
	method recompensarAscenso(){	
		cantidadDeArmas = self.cantidadDeArmas() + 10
	}
}

class Granjero inherits Vikingo{
	var property cantidadDeHijos
	var property cantidadDeHectareasQueTiene
	
	override method esProductivo() = (cantidadDeHectareasQueTiene/ cantidadDeHijos) >= 2
	
	method recompensarAscenso(){	
		cantidadDeHijos += 2
		cantidadDeHectareasQueTiene += 2
	}
	
}

//JERARQUIAS

class Jerarquia{
	
	method puedeSubirA(vikingo,unaExpedicion) = true 
	
}
class Thrall inherits Jerarquia{
	
	method ascender(vikingo) {} //entiende el mensaje pero no produce efecto
	
}

class Karl inherits Jerarquia{
	
	method ascender(vikingo) {
	
	vikingo.casta(new Thrall())
	}
	
}

class Jarl inherits Jerarquia{
	
	method ascender(vikingo) {
	
	vikingo.casta(new Karl())
	vikingo.recompensarAscenso()
		
	}
	
	method puedeSubirA(vikingo,unaExpedicion) = vikingo.cantidadDeArmas() <= 0
}


//DESTINOS

class Lugar{
	
	method valeLaPena(cantInvasores)
	
	method botin(cantInvasores)
	
	method esInvadidoPor(unaExpedicion) {
		unaExpedicion.repartirBotin(self.botin(unaExpedicion.tamanioDelEjercito()))
		//
	}
}

class Aldea inherits Lugar{
	var property monedas
	var property crucifijos
	
	
	override method valeLaPena(cantInvasores) = (self.botin(cantInvasores) - self.sedDeSaqueos())>= 15
	
	override method botin(cantInvasores) = crucifijos //el botin son las monedas de oro que se obtienen
	
	method sedDeSaqueos() = monedas 
	
}

class AldeaAmurallada inherits Aldea{
	var property vikingosComitiva
	
	override method valeLaPena(cantInvasores) = super(cantInvasores) && self.vikingosComitiva()<=cantInvasores
}

class Capital inherits Lugar{
	const nombre
	var property defensores
	var property factorDeRiqueza
	
	override method valeLaPena(cantInvasores) = (self.botin(cantInvasores)/cantInvasores) >= 3
	
	override method botin(cantInvasores) = self.defensoresDerrotados(cantInvasores)*self.factorDeRiqueza() //el botin son las monedas de oro que se obtienen

	method defensoresDerrotados(cantInvasores) {
		return defensores.min(cantInvasores) //si hay 50 invasores y 40 defensores retorno 40.
	}	
	
}

//PREGUNTA TEORICA 4
// SI SE PUEDEN AGREGAR SI LOS CREAMOS COMO UNA NUEVA CLASE
// DERIVADA DE LA CLASE LUGAR YA QUE HEREDARIA LOS MISMOS COMPORTAMIENTOS
// TENDRIA QUE INCORPORAR EL CODIGO NECESARIA PARA ESCRIBIR EL METODO BOTIN

