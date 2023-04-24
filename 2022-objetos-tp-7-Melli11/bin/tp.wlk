

class Cuenta{
	var saldo = 0
	var contadorDeTransaccion = 0
	var permisoDeTransaccion = false
	var registroDeTransacciones = []
	
	
	method saldo() = saldo
	
	method incrementarSaldo(cantidad){
		saldo += cantidad
	}
	
	method restarSaldo(cantidad){
		saldo -= cantidad
	}
	
	method contadorDeTransaccion () = contadorDeTransaccion
	
	method incrementarContadorDeTransaccion() {
		contadorDeTransaccion += 1
	}
	
	method informarAlBanco() = !permisoDeTransaccion
	
	method evaluarCondicionDeExtraccion(cantidad){
		if(self.saldo()< cantidad )
			self.error("La cuenta no posee fondos suficientes")
		}
		
	method evaluarCondicionDeTransaccion() { 
		if (self.contadorDeTransaccion() >=6 && !self.informarAlBanco())
			self.error("No es posible realizar la operación, la cuenta no esta autorizada")
	}	
	method depositar(cantidad,fechaTransaccion) { //ingresar dinero a la cuenta
			self.evaluarCondicionDeTransaccion()
			
			self.incrementarSaldo(cantidad)
			self.incrementarContadorDeTransaccion()
	}
	
	method retirar(cantidad,fechaTransaccion){
		self.evaluarCondicionDeTransaccion()
		self.evaluarCondicionDeExtraccion(cantidad)
		self.restarSaldo(cantidad)
		self.incrementarContadorDeTransaccion() 
		
	}
	
	method transferir(cantidad,cuentaDestino,fechaTransaccion) {
		self.retirar(cantidad,fechaTransaccion)
		cuentaDestino.depositar(cantidad,fechaTransaccion)
		self.incrementarContadorDeTransaccion() 
		
	}
	
	
//	method consultarCantidadDeDepositos() = lista.filter(cuenta => )
}

//const fechaActual = new Date() //toma la fecha del dia actual

//const unDiaCualquiera = new Date(day = 24, month = 11, year = 2017)
        // se ingresa en formato día, mes y año