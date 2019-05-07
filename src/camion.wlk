import cosas.*

object camion {
	const property cosas = []
	
	method cargar(cosa) { cosas.add(cosa)	}
	method descargar(cosa) { cosas.remove(cosa) }
	method pesoTotal() = 1000 + cosas.sum({ cosa => cosa.peso() })
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method peligrosidadDe(cosa) = cosa.nivelPeligrosidad()
	method cosaMasPeligrosaQue(cosa, valor) =  self.peligrosidadDe(cosa) > valor
	
	method objetosPeligrosos(nivel) {
		return cosas.filter({ cosa => self.cosaMasPeligrosaQue(cosa, nivel) })
	}
	method objetosMasPeligrososQue(cosaPeligrosa) {
		return cosas.filter({cosa => self.cosaMasPeligrosaQue(cosa, cosaPeligrosa.nivelPeligrosidad()) })
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return cosas.any({ cosa =>  self.cosaMasPeligrosaQue(cosa, nivelMaximoPeligrosidad) })
	}
}
