object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	
	method bultos() = 1
	
	method estaSiendoCargada() { }
}

object bumblebee {
	var transformadoEnAuto = true
	
	// No usé property porque consideré que no era necesario agregar un setter mientras que el getter sí podría ser
	// necesario.
	method estaTransformadoEnAuto() = transformadoEnAuto
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	
	method bultos() = 2
	
	method estaSiendoCargada() { self.transformar() }
}

object paqueteDeLadrillos {
	var property ladrillos = 0
	
	// Si bien tengo una property, también sería necesario operar con los ladrillos. 
	method agregarLadrillos(cantidad) { ladrillos += cantidad }
	method quitarLadrillos(cantidad) { ladrillos = 0.max(ladrillos - cantidad)}
	
	method peso() = 2 * ladrillos
	method nivelPeligrosidad() = 2

	method bultos() {
		if(ladrillos <= 100) { return 1 }
		else if(ladrillos.between(101, 300)) { return 2 }
		else { return 3 }
	}
	
	method estaSiendoCargada() { self.agregarLadrillos(12) }
}

object arenaAGranel {
	var property peso = 0
	
	// Mismo pensamiento que con los ladrillos.
	method agregarArena(kilos) { peso += kilos }
	method quitarArena(kilos) { peso = 0.max(peso - kilos) }
	
	method nivelPeligrosidad() = 1
	method bultos() = 1
	
	method estaSiendoCargada() { self.agregarArena(20) }
}

object bateriaAntiaerea {
	var tieneMisiles = true
	
	//Acá sí utilicé un setter ya que el cargar misiles me lo pedía.
	method tieneMisiles() = tieneMisiles
	method cargarMisiles() { tieneMisiles = true }
	method descargarMisiles() { tieneMisiles = false }
	
	method peso() = self.diferenciacionDeContenido(300, 200)
	method nivelPeligrosidad() = self.diferenciacionDeContenido(100, 0)
	method bultos() = self.diferenciacionDeContenido(2, 1)
	
	method diferenciacionDeContenido(casoConMisiles, casoSinMisiles) {
		if(tieneMisiles) { return casoConMisiles } else { return casoSinMisiles }
	}
	
	method estaSiendoCargada() { self.cargarMisiles() }
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
	
	method bultos() = 1 + contenido.sum({ cosa => cosa.bultos() })
	
	method estaSiendoCargada() { contenido.forEach({ cosa => cosa.estaSiendoCargada() }) }
}

object residuosRadioactivos {
	var property peso = 0
	
	//Mismo planteamiento que con los ladrillos.
	method agregarResiduos(kilos) { peso += kilos }
	method quitarResiduos(kilos) { peso = 0.max(peso - kilos) }
	
	method nivelPeligrosidad() = 200
	
	method bultos() = 1
	
	method estaSiendoCargada() { self.agregarResiduos(15) }
}

object embalajeDeSeguridad {
	var property cosaEnvuelta = knightRider
	
	method peso() = cosaEnvuelta.peso()
	method nivelPeligrosidad() = cosaEnvuelta.nivelPeligrosidad() / 2
	
	method bultos() = 2
	
	method estaSiendoCargada() { }
}



















