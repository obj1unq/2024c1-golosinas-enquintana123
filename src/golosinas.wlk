object bombon {

	/*
	 * Bombón
	 * Vale 5 pesos y pesa inicialmente 15 gramos. Su gusto es frutilla. Es libre de gluten.
	 * Cuando recibe un mordisco, pierde un 20 % de su peso + 1 gramo extra 
	 * (debido a que parte del relleno cremoso se pierde al caer al suelo). O sea, su nuevo peso se calcula como (peso * 0.8) - 1.
	 */
	const property precio = 5
	var property peso = 15
	const property sabor = frutilla
	const property tieneGluten = false

	method mordisco() {
		peso = peso * 0.8 - 1
	}

}

object alfajor {

	/*
	 * Vale 12 pesos y pesa inicialmente 300 gramos. Su gusto es chocolate. No es libre de gluten.
	 * Cuando recibe un mordisco, pierde el 20 % de su peso (o sea, su nuevo peso se calcula como peso * 0.8).
	 */
	const property precio = 12
	var property peso = 300
	const property sabor = chocolate
	const property tieneGluten = true

	method mordisco() {
		peso *= 0.8
	}

}

object caramelo {

	/*
	 * Vale 1 peso y pesa inicialmente 5 gramos. Su gusto es frutilla. Es libre de gluten.
	 * Cuando recibe un mordisco, pierde 1 gramo.
	 */
	const property precio = 1
	var property peso = 5
	const property sabor = frutilla
	const property tieneGluten = false

	method mordisco() {
		peso -= 1
	}

}

object chupetin {

	/*
	 * Vale 2 pesos y pesa inicialmente 7 gramos. Su gusto es naranja. Es libre de gluten.
	 * Cuando recibe un mordisco, pierde el 10 % de su peso, a excepción de que su peso actual sea menor a 2 gramos: en tal caso, no pierde nada.
	 */
	const property precio = 2
	var property peso = 7
	const property sabor = naranja
	const property tieneGluten = false

	method mordisco() {
		peso = peso * self.perdida()
	}

	method perdida() {
		return if (peso >= 2) 0.9 else 1
	}

}

object oblea {

	/*
	 *  Vale 5 pesos y pesa inicialmente 250 gramos. Su gusto es vainilla. No es libre de gluten.
	 * Al recibir un mordisco pierde peso, en una cantidad que depende del peso actual: 
	 * si es mayor a 70 gramos pierde el 50 % de su peso, en caso contrario, el 25 %.
	 */
	const property precio = 5
	var property peso = 250
	const property sabor = vainilla
	const property tieneGluten = true

	method mordisco() {
		peso = peso * self.perdida()
	}

	method perdida() {
		return if (peso > 70) 0.5 else 0.75
	}

}

object chocolatin {

	/*
	 * El peso inicial es desconocido, lo asigna el usuario. El precio es de $0,50 por cada gramo de peso inicial. No es libre de gluten. 
	 * Obviamente, su gusto es chocolate.
	 * Pierde 2 gramos por mordisco.
	 * ¡Atención! El precio es según el peso inicial, no debe cambiar con los mordiscos.
	 */
	var precio = 0
	var property peso = 0
	const property sabor = chocolate
	const property tieneGluten = true

	method peso(_peso) {
		peso = _peso
		precio = 0.5 * _peso
	}

	method peso() {
		return peso
	}

	method precio() {
		return precio
	}

	method mordisco() {
		peso -= 2
	}

}

object golosinaBaniada {

	/*
	 * 	Se arma a partir de una golosina de base.
	 * 	El peso inicial es el de la golosina de base más 4 gramos que es lo que pesa el bañado. El precio es el de la golosina de base más 2 pesos. 
	 *  El gusto es el de la golosina de base. De la misma manera, es libre de gluten si lo es su golosina base.
	 * 	Con cada mordisco se da un mordisco a la golosina de base. Además, en el primer mordisco pierde 2 gramos de bañado, y en el segundo los otros dos.
	 */
	var golosinaBase = bombon
	var pesoBanio = 4
	const property sabor = chocolate

	method peso() {
		return golosinaBase.peso() + pesoBanio
	}

	method precio() {
		return golosinaBase.precio() + 2
	}

	method mordisco() {
		golosinaBase.mordisco()
		pesoBanio -= 2
	}

	method tieneGluten() {
		return golosinaBase.tieneGluten()
	}

}

object pastillaTutiFruti {

	/*
	 * Pesa inicialmente 5 gramos. La pastilla puede ser libre de gluten o no (se configura). Si es libre de gluten el precio es $7; si no, es de $10.
	 * En cada mordisco cambia el sabor, pasa de frutilla a chocolate, de ahí a naranja, de ahí vuelve a frutilla.
	 */
	var precio = 5
	var property peso = 5
	var sabor = frutilla
	var property tieneGluten = true

	method precio() {
		return if (tieneGluten) 10 else 7
	}

	method mordisco() {
		sabor = sabor.saborSiguiente()
		peso -= 2
	}

	method sabor() {
		return sabor
	}

}

object frutilla {

	method saborSiguiente() {
		return chocolate
	}

}

object chocolate {

	method saborSiguiente() {
		return naranja
	}

}

object naranja {

	method saborSiguiente() {
		return frutilla
	}

}

object vainilla {

}

