object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var property ladrillos = 0
	
	method peso() = 2 * ladrillos
	method nivelPeligrosidad() = 2
}

object arenaAGranel {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var tieneMisiles = true
	
	method peso() {
		if (tieneMisiles) { return 300 } else {	return 200 }
	}
	method nivelPeligrosidad() {
		if (tieneMisiles) { return 100 } else { return 0 }
	}
}

object contenedorPortuario {
	var contenido = []
	
	method agregarAContenido(cosa) { contenido.add(cosa) }
	method removerDeContenido(cosa) { contenido.remove(cosa) }
	
	method peso() = 100 + contenido.sum({ cosa => cosa.peso() })
	method nivelPeligrosidad() {
		return if (contenido.isEmpty()) { 0 }
		       else { self.nivelPeligrosidadCosaMasPeligrosa() }
	}
	method nivelPeligrosidadCosaMasPeligrosa() = self.cosaDeMayorPeligrosidad().nivelPeligrosidad() 
	method cosaDeMayorPeligrosidad() = contenido.max({ cosa => cosa.nivelPeligrosidad() })
}

object residuosRadioactivos {
	var property peso = 0
	
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad {
	var property cosaEnvuelta = knightRider
	
	method peso() = cosaEnvuelta.peso()
	method nivelPeligrosidad() = cosaEnvuelta.nivelPeligrosidad() / 2
}



















