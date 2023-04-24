
object pepe{
	var property categoria = otraCategoria
	var property bono = nulo // inicializado con el bono nulo
	var property falto = 0 // por defecto tiene presentismo perfecto
	
	method bono(unBono){
		bono = unBono
	}
	
	method neto(){
		return categoria.neto_asalariado()
	}
	
	method bonoXResultado(){
		return bono.remuneracionXBono(self.falto(),self.neto())
	}
	
	method bonoXPresentismo(){
		return bono.remuneracionXBono(self.falto(),self.neto())
	}
	
	method sueldo(){
		return self.neto() + self.bonoXResultado() + self.bonoXPresentismo()
	}
	

}

//CATEGORIAS

object gerente{
	const salario = 15000
	method neto_asalariado(){
		return salario 
	}
}

object cadete{
	const salario = 20000
	method neto_asalariado(){
		return salario
	}
}


object otraCategoria{ //CATEGORIA AUXILIAR 
	const salario = 0
	method neto_asalariado(){
		return salario
	}
}

object vendedor{
	var salario = 16000
	var flag_aumento = false
	
	method activarAumentoPorMuchasVentas(){
		flag_aumento = true
	}
	method desactivarAumentoPorMuchasVentas(){
		flag_aumento = false
	}
	
	method neto_asalariado(){
		if (flag_aumento ){
		return 1.25*salario
		}
		else {
			return salario
		}
	}
}

//BONOS POR RESULTADOS

object fijo{
	const monto = 800
	method remuneracionXBono(cantidadDeFaltas,elNeto){
	return monto
	}
	
}

object porcentaje{
	method remuneracionXBono(cantidadDeFaltas,elNeto){
	return 0.10*elNeto
	}
}

object nulo {
	method remuneracionXBono(cantidadDeFaltas,elNeto){
	return 0
	}
}
	

//BONOS POR PRESENTISMO

object normal{
	method remuneracionXBono(cantidadDeFaltas,elNeto){
		if (cantidadDeFaltas == 0){
			return 2000
		}
		
		else if (cantidadDeFaltas == 1){
			return 1000
		}
		else
			return 0
	}
}

object ajuste{
	method remuneracionXBono(cantidadDeFaltas,elNeto){
		if (cantidadDeFaltas == 0){
			return 100
		}
		
		else
			return 0
	}
}

object demagogico{
	method remuneracionXBono(cantidadDeFaltas,elNeto){
		if (elNeto < 18000){
			return 500 
		}
		else if (elNeto >= 18000) {
			return 300 
		}
		
		else return 0
		
	}
}

object sofia{
	var property categoria
	var property bono	= nulo
	method bonoXResultado(){
		return bono.remuneracionXBono(0,self.neto()) //el 0 representa la cantidad de faltas de sofia y es para lograr el polimorfismo del metodo remunaciónXBono
	}
	
	method neto(){
		return 1.3*categoria.neto_asalariado()
	}
	
	method sueldo(){
		return self.neto() + self.bonoXResultado() 
	}
}

object carla{
	const neto = 28000
	var property bono
	var property falto = 0
	
	method bono(unBono){
		bono = unBono
	}
	
	method neto(){
		return neto
	}
	
	method bonoXResultado(){
		return bono.remuneracionXBono(self.falto(),neto)
	}
	
	method sueldo(){
		return neto + self.bonoXResultado() + 9000
	}
	
}


object oliver{
	var property categoria = otraCategoria
	var property bono = nulo //  inicializado con el bono nulo
	const falto = 0
	var companiero = pepe // referencio a pepe como inicial
	
	method trabajaCon(unCompaniero){ // para cambiar de compañero
		companiero = unCompaniero
	}

	method bono(unBono){
		bono = unBono
	}
	
	method neto(){
		return companiero.neto()
	}
	
	method falto(){
		return falto
	}
		
	method bonoXPresentismo(){
		return bono.remuneracionXBono(self.falto(),self.neto())
	}
	method sueldo(){
		return self.neto() + self.bonoXPresentismo()
	}
}


