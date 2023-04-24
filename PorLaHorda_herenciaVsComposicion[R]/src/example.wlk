class Personaje{
	var property fuerza 
	var property inteligencia
	var property rol // guerrero, cazador brujo
	var localidad
	
	//punto1
	method potencialOfensivo() = fuerza * 10 + rol.bonus()
	method fuerza() = fuerza
	
	//punto2
	method esGroso() = self.esInteligente() || self.esGrosoParaSuRol()//me sirve para evitar utilizar la referencia en los objects de los roles
	
	method esInteligente() //metodo abstracto
	
	method esGrosoParaSuRol() = rol.esGrosoEnSuRol(self)
}


class Orco inherits Personaje {
	
		//punto1
		override method potencialOfensivo() = super()*1.10
		//punto2
		override method esInteligente() = false
		
}

class Humano inherits Personaje {

		method bonus() = 1
		//punto2
		override method esInteligente() = self.inteligencia() > 50
}

//class Rol{
//	var personaje
//	
//	method fuerza () = personaje.fuerza()
//}

object guerrero {
	const bonus = 100
	
	method bonus() = bonus
	method esGrosoEnSuRol(unPersonaje) = unPersonaje.fuerza() >50
	
}

object Brujo {
	
	method bonus () = 0
	
	method esGrosoEnSuRol(unPersonaje) = true //necesito polimorfismo entre los objects
}

class Cazador {
//declaro como un var para poder instanciar como const pjEjemplo = new Humano(rol = new Cazador(mascota = new Mascota(nombre = Pepa, edad = 14 , fuerza = 57) )	
	var mascota
	
	method bonus() = mascota.bonus()
		
	method esGrosoEnSuRol(unPersonaje) = mascota.esLongeva()
	

}




//Mascota de ejemplo
class Mascota {
	const nombre
	const edad
	const fuerza 
	const tieneGarra = false
	
	method bonus() {
		if (tieneGarra)
			return fuerza*2
		else 
			return fuerza
		}
	
	method esLongeva() = edad > 10
	
}


class Ejercito{
	const invasor = false
	
	const property integrantes = []
	
	
	method invasor() = invasor
	
	method potencialOfensivoTotal() = integrantes.sum{personaje => personaje.potencialOfensivo()}
	
	method invadirZona(unaZona){
		if (unaZona.potencialDefensivo() > unaZona.potencialOfensivoTotal())
			unaZona.ocupadaPor(self)
	}
	
	
}

class Localidad{
	var ejercito 
	
	method ocupadaPor(unEjercito) {
		ejercito = unEjercito
	}
	
	method potencialDefensivo() = ejercito.potencialOfensivoTotal()
	
}

class Aldea inherits Localidad{
	const maxHabitantes
	
	
//	method tamanioEjercito(unEjercito) = unEjercito.size()
	
	override method ocupadaPor(unEjercito){	// tengo que cambiar el ejercito que ocupa la localidad segun un criterio
		if (unEjercito.integrantes().size() > maxHabitantes){
			
			const nuevosHabitantes = unEjercito.integrantes().sortedBy{	unSoldado,otroSoldado =>
					unSoldado.potencialOfensivo() > otroSoldado.potencialOfensivo()	
			}.take(10)
			super(new Ejercito (integrantes = nuevosHabitantes)) // ojo!!! nuevosHabitantes es una lista, por ello hay que instanciar un ejercito nuevo con esta nueva lista 
			unEjercito.integrantes().removeAll(nuevosHabitantes)
				
			}
			else super(unEjercito)
	
	}

}

class Ciudad inherits Localidad{
		override method potencialDefensivo() = super() + 300 // utilizo el metodo de la superclase y le sumo 300.Es igual a tener ejercito.potencialOfensivoTotal() + 300
}


