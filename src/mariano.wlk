object mariano {

	const golosinas = #{}
	var cantidadSaborMasPopular = 0
	const golosinasDesechadas = #{}
	
	method comprar(unaGolosina) {
		golosinas.add(unaGolosina)
	}

	method desechar(unaGolosina) {
		golosinasDesechadas.add(unaGolosina)
		golosinas.remove(unaGolosina)
	}

	method cantidadDeGolosinas() {
		return golosinas.size()
	}

	method tieneLaGolosina(unaGolosina) {
		return golosinas.contains(unaGolosina)
	}

	method probarGolosinas() {
		// le da un mordisco a todas las golosinas dentro de la bolsa de golosinas compradas
		golosinas.forEach({ golosina => golosina.mordisco()})
	}

	method hayGolosinaSinTACC() {
		return golosinas.any({ golosina => not golosina.tieneGluten() })
	}

	method preciosCuidados() {
		// : se cumple cuando cada una de las golosinas compradas tienen un precio menor o igual a 10 pesos.	
		return golosinas.all({ golosina => golosina.precio() <= 10 })
	}

	method golosinaDeSabor(unSabor) {
		// : devuelve la primer golosina que encuentra en la bolsa del sabor escogido.
		return golosinas.find({ golosina => golosina.sabor() == unSabor })
	}

	method golosinasDeSabor(unSabor) {
		// : devuelve las golosinas que encuentre dentro de la bolsa del sabor escogido.
		return golosinas.filter({ golosina => golosina.sabor() == unSabor })
	}

	method sabores() {
		return golosinas.map({ golosina => golosina.sabor() }).asSet()
	}

	method golosinaMasCara() {
		return golosinas.max({ golosina => golosina.precio() })
	}

	method pesoGolosinas() {
		// : devuelve el peso de la bolsa de golosinas compradas, o sea, la suma del peso de cada golosina.
		return golosinas.sum({ golosina => golosina.peso() })
	}

	method golosinasFaltantes(golosinasFaltantes) {
		return golosinasFaltantes.filter({ golosinaFaltante => not self.tieneLaGolosina(golosinaFaltante) })
	}

	method gustosFaltantes(gustosFaltantes) {
		return gustosFaltantes.filter({ gustoFaltante => not self.sabores().contains(gustoFaltante) })
	}

	method gastoEnSabor(sabor) {
		//precio total de las golosinas del sabor indicado.
		return self.golosinasDeSabor(sabor).map({golosina => golosina.precio()}).sum()
		
	}
	
	method preciosGolosinas() {
		//devuelve una lista con los precioes de las golosinas
		return golosinas.map({golosina => golosina.precio()}).asSet()
	}
	
	method comproYDesecho(unaGolosina) {
		//indica si Mariano primero compró, y después desechó, la golosina por la que se pregunta.
		return self.estaDesechada(unaGolosina) and not self.estaEnLaBolsa(unaGolosina)
	}
	
	method estaDesechada(unaGolosina) {
		return golosinasDesechadas.contains(unaGolosina)
	}
	
	method estaEnLaBolsa(unaGolosina) {
		return golosinas.contains(unaGolosina)
	}
	/*
	 * saborMasPopular() y saborMasPesado()
	 * No se me ocurre como hacer. Como curse estructuras de datos usaria un diccionario para armar {"sabor" => cantidad}
	 * Y luego me quedaria con el "sabor" cuyo valor es el mayor
	*/
}

