object mariano {

	const golosinas = []

	method comprar(unaGolosina) {
		golosinas.add(unaGolosina)
	}

	method desechar(unaGolosina) {
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

}

