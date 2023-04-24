class Maestro {
//	var poder = 0 // referencio a valor nulo
	
	var property habilidad = 0 // referencio a valor nulo

	method poder() // metodo abstracto
	
	method esGroso() = return self.poder() > 1000 and self.habilidad()> 5
	
}

class MaestroAgua inherits Maestro{
	
	const luna
	
	override method poder() = self.habilidad() + 5*luna.intensidadDeLuna() 

	method esPeligroso() = return self.poder()>100
   
}


class Luna{
	
	const intensidad = 0 //valor por defecto
	
	method intensidadDeLuna() = intensidad
}

//const unaLunita = new Luna(intensidad = 250) // como la luna es siempre la misma, instancio un objeto de la clase luna


class MaestroFuego inherits Maestro{
	var rabia
	var nivelDeLocura
		
	method rabia () = rabia
	method nivelDeLocura ()= nivelDeLocura
		
	override method poder() = self.rabia() / self.nivelDeLocura()

}

class MaestroAire inherits Maestro{
	
	var ligereza
	const mascota // como la referencia es constante una vez que le asigne una mascota no podrá cambiarla
	
	method mascota() = mascota
	
	method ligereza () = ligereza
	override method poder() = mascota.poder() * self.ligereza()
}

class Mascota{ 
	var poder
	method poder() = poder
}

class MaestroSangre inherits MaestroAgua {
	
  override method esPeligroso() = true
  
  override method poder() = super()*2 // super() para utilizar la implementación del metodo de la clase "padre"
  
}


