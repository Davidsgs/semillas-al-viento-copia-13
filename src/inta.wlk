import parcelas.*
import plantas.*

object inta {
	const property parcelas = #{}
	
	method cantidadDeParcelas(){
		return parcelas.size()
	}
	
	method totalDePlantas(){
		return parcelas.sum({parcela => parcela.cantidadDePlantas()})
	}
	
	method promedioDePlantas(){
		return self.totalDePlantas() / self.cantidadDeParcelas()
	}
	
	method parcelasConMasDe4Plantas(){
		return parcelas.filter({parcela => parcela.cantidadDePlantas() > 4})
	}
	
	method mayorPorcentaje(){
		return self.parcelasConMasDe4Plantas().max({p => p.cantidadPlantasBienAsociadas()})
	}
	
	method parcelaMasAutosustentable(){
		return self.parcelasConMasDe4Plantas().find({parcela => parcela.cantidadPlantasBienAsociadas() == self.mayorPorcentaje()})
	}
}
