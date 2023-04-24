

object balanza{
	var primerObjetoQuePesa //Referencia para el 1er objeto colocado en la balanza
	var segundoObjetoQuePesa //Referencia para el 2do objeto colocado en la balanza
	var peso = { x => x.peso() }
	var volumen = { x => x.volumen()}		

	method estaPesando(unObjeto,otroObjeto){ // Referencio los objetos que estoy "pesando"
		primerObjetoQuePesa = unObjeto
		segundoObjetoQuePesa = otroObjeto
	}

	method esMayorElPrimeroSegun(unCriterio){			
	
		return unCriterio.apply(primerObjetoQuePesa) > unCriterio.apply(segundoObjetoQuePesa)
	}
	
	method sonIgualesSegun(unCriterio){
		return unCriterio.apply(primerObjetoQuePesa) == unCriterio.apply(segundoObjetoQuePesa)
	}
	
//	method peso() = peso
//	method volumen() = volumen
	
//	method esMayorElPrimeroSegunElPeso(){
//		return criterioPeso.apply(primerObjetoQuePesa) > criterioPeso.apply(segundoObjetoQuePesa)
//	}
//	
//	method esMayorElPrimeroSegunElVolumen(){
//		return criterioVolumen.apply(primerObjetoQuePesa) > criterioVolumen.apply(segundoObjetoQuePesa)
//	}
//	
//	method sonIgualesSegunElPeso(){
//		return criterioPeso.apply(primerObjetoQuePesa) == criterioPeso.apply(segundoObjetoQuePesa)
//	}	
//	
//	method sonIgualesSegunElVolumen(){
//		return criterioVolumen.apply(primerObjetoQuePesa) == criterioVolumen.apply(segundoObjetoQuePesa)
//	}	
//	

}


object kiloDePlomo{
	const peso = 1
	const volumen = 0.00009

	method peso(){
		return  peso	
	}
	
	method volumen(){
		return volumen
	}

}

object kiloDePluma{
	const peso = 1
	const volumen = 0.4

	method peso(){
		return  peso	
	}
	
	method volumen(){
		return volumen
	}

}

object vacio{
	const peso = 0
	const volumen = 0

	method peso(){
		return  peso	
	}
	
	method volumen(){
		return volumen
	}

}



object cajaDeMadera{
	var peso = 0.2
	var objetoDeLaCaja = vacio // por defecto la caja esta vacia
		
	method contiene(unObjeto){
		objetoDeLaCaja = unObjeto // objetoDeLaCaja representa la variable que apunta a los demas objetos
	}

	method peso(){
		return 0.2 + objetoDeLaCaja.peso()
	}
	
	method volumen(){
		return 1
	}
	
}