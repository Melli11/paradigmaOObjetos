object condicionesClimaticas{
	var property mmLLuviaCaidos = 10
	var property intensidadDelViento = 10
}


class Ruta{
	
	var property tipoDeRuta = tierra
	const property extension = 100
	var property velMaximaDeCirculacion = 0
	
	method velMaximaDeCirculacion() = tipoDeRuta.velMaximaDeCirculacion()
	

	method esRecorridaPor(vehiculo){
		vehiculo.ruta(self)
		var cantidad = tipoDeRuta.calcularDesgaste(vehiculo)
		
		if (vehiculo.esVehiculoDeCarga())
			vehiculo.aplicarDesgaste(cantidad*2)
		else
			vehiculo.aplicarDesgaste(cantidad)
	}
	

	method mejorarRuta(){
		tipoDeRuta = tipoDeRuta.mejorar()
	}
	
	method tiempoQueTardaEnRecorrerla(auto) = self.extension()/auto.velocidadFinal()
	
}


object tierra inherits Ruta{
	
	var cantLluvia = condicionesClimaticas.mmLLuviaCaidos()
	
	override method velMaximaDeCirculacion() = 10.max(60-cantLluvia)
	
	method calcularDesgaste(auto) = auto.velocidadFinal()/10
	
	method mejorar() = ripio
	
}

object ripio inherits Ruta{
	
	override method velMaximaDeCirculacion() = 80
		
	method calcularDesgaste(auto) = auto.velocidadFinal()/10

	method mejorar() = asfalto
}

object asfalto inherits Ruta{
	var property maxima = 0
	override method velMaximaDeCirculacion() = maxima
	
	method calcularDesgaste(auto) = self.tiempoQueTardaEnRecorrerla(auto)

	method mejorar(){
		maxima = maxima + 5
	}
}

class Rueda{
	var property desgaste = 0
	
	method incrementarDesgaste(cantidad){
		if(self.desgaste() > 100)
			throw new DomainException(message = "La rueda alcanzó su desgaste maximo")
		desgaste = desgaste + cantidad
	}
}

class Vehiculo {

	var property camino = []//CONJUNTO DE RUTAS
	var property ruta = null
	var property desgaste = []
	
	method agregarRueda(unaRueda){ //aux para resolver punto 3
		desgaste.add(unaRueda)
	}
	
	method velocidad() = self.velocidadBase() - condicionesClimaticas.intensidadDelViento()

	method velocidadFinal() = ruta.velMaximaDeCirculacion().min(self.velocidad())

	method velocidadBase()	
		
	method realizarCamino(){ //punto de entrada 3
		camino.forEach{rut => rut.esRecorridaPor(self)}
	}
	
	method aplicarDesgaste(cantidad){
		desgaste.forEach{rued => rued.incrementarDesgaste(cantidad)}
	}

	method tiempoQueTardaParaUnCamino() = camino.sum{rut=> rut.tiempoQueTardaEnRecorrerla(self)}
	}



class AutoParticular inherits Vehiculo{
	var velocidadAutomotor
	
	override method velocidadBase() = velocidadAutomotor
	
	
}

class VehiculoDeCarga inherits Vehiculo{
	const carga
	
	
	method esVehiculoDeCarga() = true 
	
	override method velocidadBase() = if (carga<40) 80 else 60

}

class VehiculoDeTransporte inherits Vehiculo{
	const pasajerosQueSube
	
	override method velocidadBase() = 120.min(120-pasajerosQueSube)
	
	
}