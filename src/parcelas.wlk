class Parcela {
	var property ancho
	var property largo
	var property horasDeSolDiarias
	const property plantas = []
	
	method superficie(){
		return ancho * largo
	}
	
	method cantidadDePlantas(){
		return plantas.size()
	}
	
	method cantidadMaximaDePlantas(){
		return if (largo > 3) {largo + 4} else {self.superficie() / 2}
	}
	
	method tieneComplicaciones(){
		return plantas.any({planta => planta.horasDeSolQueTolera() < horasDeSolDiarias})
	}
	
	method estaLleno(){
		return self.cantidadDePlantas() == self.cantidadMaximaDePlantas()
	}
	
	method plantar(unaPlanta){
		if (not self.estaLleno() and horasDeSolDiarias - unaPlanta.horasDeSolQueTolera() < 2 ){
			plantas.add(unaPlanta)
		}
		else{
			if (self.estaLleno()){
				self.error("La parcela esta llena")
			}else{
				self.error("la parcela recibe al menos 2 horas más de sol que los que la planta tolera.")
			}
		}
	}
}