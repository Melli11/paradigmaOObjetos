class Tipo {
	var property edad 
	var energia = 10000 -30*self.edad()
	const property pasion 
	var property porcentajeEnergia = 0


	method energia(){
		return energia
	}
	
	method descansar(){
		energia = 10000 -30*self.edad()
	}
	
	
	method disfrutarSuPasion(){
		energia = pasion.consumirEnergia(self.energia(),self.porcentajeEnergia())
	}
}

object hacerUnDeporte{
	
	method consumirEnergia(energiaPersona,unPorcentaje){
		return energiaPersona - energiaPersona*unPorcentaje/100
	}
}

object emborracharse{
	
	method consumirEnergia(energiaPersona,unPorcentaje){
		if(energiaPersona< 100)
			return energiaPersona
		else 
			return 100
	}
	
}

object hablarDeFutbol{
	
	method consumirEnergia(energiaPersona,unPorcentaje){
		return energiaPersona - 150
	}
	
}
	
	
//INSTANCIAS

const escribanoAndretta = new Tipo (edad = 60, pasion = hablarDeFutbol)
const pabloSandoval = new Tipo (edad = 54, pasion = emborracharse)
const manuGinobili = new Tipo (edad = 45, pasion = hacerUnDeporte, porcentajeEnergia = 85)
const bilardo = new Tipo (edad = 84, pasion = hablarDeFutbol)
const francoMilazzo = new Tipo (edad = 38, pasion = hacerUnDeporte, porcentajeEnergia = 63)
	