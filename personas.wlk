import rutinas.*

class PersonaQueEntrena {
    var peso

    method realizarRutina(rutina) {
        self.validarRutina(rutina)
        peso -= self.calcularPesoPerdidoRealizando(rutina)
    }

    method pesoPorCalorias()

    method validarRutina(rutina)

    method peso() { return peso.truncate(3) }

    method calcularPesoPerdidoRealizando(rutina) {
        return (rutina.calorias(self.tiempoDeDuracionElegido()) / self.pesoPorCalorias())
    }

    method tiempoDeDuracionElegido()
}


class PersonaSedentaria inherits PersonaQueEntrena {
    var property tiempoDeDuracionElegido
    
    override method pesoPorCalorias() { return 7000 }

    override method validarRutina(rutina) {
        if (!(peso > 50)) {
            self.error("No hare la rutina pues no estoy gordo.")
        }
    }
}


class PersonaAtleta inherits PersonaQueEntrena {
    override method calcularPesoPerdidoRealizando(rutina) {
        return super(rutina) - 1
    }

    override method pesoPorCalorias() { return 8000 }

    override method tiempoDeDuracionElegido() { return 90 }

    override method validarRutina(rutina) {
        if (!(rutina.calorias(self.tiempoDeDuracionElegido()) > 10000) ) {
            self.error("No hare la rutina porque gastaría menos de 10000 calorias.")
        }
    }
}