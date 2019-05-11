import cosas.*

object camion {
	const property cosas = []
	
	//Ordenaría los methods de otra forma pero para facilitar la corrección los dejo en el orden en que los hice.
	method cargar(cosa) { cosa.estaSiendoCargada() 
						  cosas.add(cosa)
	}
	method descargar(cosa) { cosas.remove(cosa) }
	
	method pesoTotal() = 1000 + cosas.sum({ cosa => cosa.peso() })
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	//Decidí crear este method porque noté que estaba comparando el nivel de peligrosidad con diferentes valores
	//en muchas ocaciones.
	method cosaMasPeligrosaQue(cosa, valor) = cosa.nivelPeligrosidad() > valor

	method objetosPeligrosos(nivel) {
		return cosas.filter({ cosa => self.cosaMasPeligrosaQue(cosa, nivel) })
	}
	method objetosMasPeligrososQue(cosaPeligrosa) {
		return cosas.filter({cosa => self.cosaMasPeligrosaQue(cosa, cosaPeligrosa.nivelPeligrosidad()) })
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not cosas.any({ cosa =>  self.cosaMasPeligrosaQue(cosa, nivelMaximoPeligrosidad) })
	}
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.any({ cosa => cosa.peso().between(min, max) })
	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })
	method totalBultos() = cosas.sum({ cosa => cosa.bultos() })
	method pesos() = cosas.map({ cosa => cosa.peso() })
}
