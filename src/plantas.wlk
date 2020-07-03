import parcelas.*

class Plantas {
	const property anioDeObtencion
	var property altura

	method horasDeSolQueTolera() {
		return 7
	}

	method esFuerte() {
		return self.horasDeSolQueTolera() > 9
	}

	method daNuevasSemillas() {
		return self.esFuerte()
	}

	method espacioQueOcupa() // Medido en Metros cuadrados. Metodo Abstracto.
	
	method esParcelaIdeal(unaParcela) // Metodo abstracto.
	
	method seAsociaBien(parcelaEcologicaOIndustrial){
		return parcelaEcologicaOIndustrial.seAsociaBien(self)
	}
}

class Menta inherits Plantas {
	
	override method daNuevasSemillas() {
		return super() and self.espacioQueOcupa() >= 1
	}

	override method espacioQueOcupa() {
		return altura * 3
	}
	
	override method esParcelaIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}

}

class Soja inherits Plantas {

	override method horasDeSolQueTolera() {
		return if (altura < 0.5) {5} else if (altura.between(0.5, 1)) {8} else {12}
	}

	override method daNuevasSemillas() {
		return super() and anioDeObtencion > 2007 and altura.between(0.75, 0.9)
	}

	override method espacioQueOcupa() {
		return altura / 2
	}
	
	override method esParcelaIdeal(unaParcela){
		return unaParcela.horasDeSolDiarias() == self.horasDeSolQueTolera()
	}

}

class Quinoa inherits Plantas {

	const espacioQueOcupa = 0

	override method horasDeSolQueTolera() {
		return if (espacioQueOcupa < 0.3) {10} else { super() }
	}

	override method daNuevasSemillas() {
		return super() and anioDeObtencion > 2005
	}

	override method espacioQueOcupa() {
		return espacioQueOcupa
	}
	
	override method esParcelaIdeal(unaParcela){
		return unaParcela.plantas().all({planta => planta.altura() < 1.5})
	}
}

//Variedades

class SojaTransgenica inherits Soja{
	
	override method daNuevasSemillas() {
		return false
	}
	
	override method esParcelaIdeal(unaParcela){
		return unaParcela.cantidadMaximaDePlantas() == 1
	}
}

class Hierbabuena inherits Menta{
	
	override method espacioQueOcupa(){
		return super() * 2
	}
}

