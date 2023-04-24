class Empleado{
	var tareas = [] //pueden ser varias
	var rol
	var property estamina
	var property contadorDeTareaRealizada = 0
	var property herramientas = []
	
	method incrementarContadorDeTarea(){
		contadorDeTareaRealizada = contadorDeTareaRealizada  + 1
	}
	
	method tieneUnaHerramienta(herramienta) = herramientas.contains(herramienta)
	
	method consumirEstamina(complejidad){
		estamina = estamina - complejidad
	}
	
	method comerFruta(fruta){
		self.recuperarEstamina(fruta)
		
	}
	
	method recuperarEstamina(fruta){
		estamina = estamina + fruta.cantidadQueRecupera()
	}
	
	method fuerza() = estamina/2 +2 + rol.bonusDeFuerza()
	
	method puedeDefenderSector() = rol.puedeDefenderSector()
	
	method conFuerzaMayorAlGradoDeAmenaza(valor) = self.fuerza() >= valor
	
	method perderMitadEstamina() = rol.perderMitadEstamina(self)
	
	method esMucama() = rol.esMucama()
	
	method dificultadParaDefender(amenaza)
	
	method realizarTareasAsignadas() = tareas.forEach{tarea => tarea.esRealizada(self)}
	
	method puedeHacerTodasLasTareas() = tareas.all{tarea => tarea.puedeRealizarla(self)}
	
	method experienciaConseguida() = self.contadorDeTareaRealizada()* self.dificultadDeLasTareasAsignadas() 
		
	method dificultadDeLasTareasAsignadas() = tareas.sum{tarea => tarea.dificultad(self)}
}

//FRUTAS

object banana{
	method cantidadQueRecupera() = 10
}

object manzana{
	method cantidadQueRecupera() = 5
}

object uva{
	method cantidadQueRecupera() = 1
}


// RAZAS

class Biclope inherits Empleado{
	const property ojos = 2
	
	override method estamina(cantidad){
		estamina = 10.min(cantidad)
	}
	
	override method dificultadParaDefender(amenaza) = amenaza
}

class Ciclope inherits Empleado{
	const property ojos = 1
	
	override method fuerza() = (estamina+ rol.bonusDeFuerza())/2 
	
	override method dificultadParaDefender(amenaza) = amenaza *2
}

class Arma{
	var property usar = false
	
}


// ROLES

object soldado{
	var property arma
	var property danioQueCausa = 0
	var practica = 0
	
		method defenderSector() {
			
		if(self.usarArma())
			self.incrementarDanio(2)
			practica = practica + 2
		return true
	}
	
	method asignarArma(armaSeleccionada){
		arma = armaSeleccionada
	}
	
	method incrementarDanio(cantidad){
		danioQueCausa = danioQueCausa + cantidad
	}
	
	method usarArma() = arma.usar(true)
	
	method puedeDefenderSector() = true
	
	method esMucama() = false
	
	method perderMitadEstamina(empleado){}
	
}

object obrero{
	var property herramientas = [] //herramientas
	
 	method puedeDefenderSector() = true
	
	
	method perderMitadEstamina(empleado) {
		empleado.consumirEstamina(empleado.estamina( )/2)
	}
	
	method esMucama() = false
}

object mucama{
	
	method puedeDefenderSector() = false
	
	method esMucama() = true
	
	method perderMitadEstamina(empleado){}
	
}

object capataz{
	var subordinados = #{}
	var tareas = []
	
	method ningunSubordinadoPuedeHacerla() = subordinados.all{int => not int.puedeHacerTodasLasTareas(tareas)}
	
	method realizarTarea() = tareas.forEach{tar => tar.puedeRealizarla(self)}
	
	method delegarTareas(){
		var losQuePuedenRealizarLaTarea = subordinados.filter{ int => int.puedeHacerTodasLasTareas(tareas)}
		var elMasExperimentado = losQuePuedenRealizarLaTarea.max{empleado => empleado.experienciaConseguida()}
	}
}


class Herramienta{
	
}

class ArreglarUnaMaquina {
	
	var complejidad	
	var requiereHerramientas = []
	
	method tieneEstaminaNecesaria(empleado) = empleado.estamina() >= complejidad 
	
	method tieneLasHerramientas(empleado) = empleado.herramientas().all{herr => empleado.tieneUnaHerramienta(herr)}
	
	method puedeRealizarla(empleado) = self.tieneEstaminaNecesaria(empleado) && self.tieneLasHerramientas(empleado) 
	
	method tieneLoNecesarioParaArreglarla(empleado){
		if( !self.puedeRealizarla(empleado) )
				self.error("No tiene lo necesario para repararla")
	}
	
	method esRealizada(empleado) { //puntoDeEntrada
		self.tieneLoNecesarioParaArreglarla(empleado)
		empleado.consumirEstamina(complejidad)
		empleado.incrementarContadorDeTarea()	
		}
	method dificultad(unTrabajador) = complejidad*2
}

class DefenderSector {
	var property amenaza //puedo referenciar un numero como un object, o asociar la referencia a una instancia y modelizar una amenanza mas compleja
	
	method puedeRealizarla(empleado) = empleado.puedeDefenderSector() && empleado.conFuerzaMayorAlGradoDeAmenaza(amenaza)

	
	method esRealizada(empleado){ //puntoDeEntrada
		if(!self.puedeRealizarla(empleado))
			self.error("No tiene lo necesario para defender el sector")
			empleado.perderMitadEstamina()
			empleado.incrementarContadorDeTarea()
	}
	
	method dificultad(empleado) = amenaza.loQueLeCuestaDefenderlo(empleado)
	
}

class TipoDeAmenaza{
	var gradoAmenaza
	
	method loQueLeCuestaDefenderlo(empleado) = empleado.dificultadParaDefender(gradoAmenaza)
}

class LimpiarSector {
	var property grande = false	

	method estaminaNecesaria() = if (self.grande()) 4 else 1
	
	method dificultad(empleado) = 10
	
	method tieneLaEstaminaNecesaria(empleado) =  empleado.estamina() >= self.estaminaNecesaria()
	
	method puedeRealizarla(empleado) = self.tieneLaEstaminaNecesaria(empleado) || empleado.esMucama()
	
	method esRealizada(empleado){//puntoDeEntrada
		if(!self.puedeRealizarla(empleado) )
			self.error("no tiene lo necesario para limpiarlo")
		if (!empleado.esMucama()){
			empleado.consumirEstamina(self.estaminaNecesaria())
			empleado.incrementarContadorDeTarea()	
		}
		else{
			empleado.consumirEstamina(0)
			empleado.incrementarContadorDeTarea()	
			}
			
	}
	
}
