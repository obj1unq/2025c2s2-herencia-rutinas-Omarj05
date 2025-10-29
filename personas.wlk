import rutinas.*

class PersonaQueEntrena {
    var peso

    method realizarRutina(rutina) {
        self.validarRutina(rutina)
        peso -= self.calcularPesoPerdidoRealizando(rutina)
    }

    method pesoPorCalorias()

    method validarRutina(rutina) {
        if (self.puedePracticar(rutina)) {
            self.error("No puede practicar esa rutina.")
        }
    } //se puede hacer un method hook que sea lo que los hijos cambian

    method puedePracticar(rutina)

    method peso() { return peso.truncate(3) }

    method calcularPesoPerdidoRealizando(rutina) {
        return self.calorias(rutina) / self.pesoPorCalorias()
    }

    method calorias(rutina) {
        return rutina.calorias(self.tiempoDeDuracionElegido())
    }

    method tiempoDeDuracionElegido()
}


class PersonaSedentaria inherits PersonaQueEntrena {
    var property tiempoDeDuracionElegido
    
    override method pesoPorCalorias() { return 7000 }

    override method puedePracticar(rutina) {
        return !(peso > 50)
    }
}


class PersonaAtleta inherits PersonaQueEntrena {
    override method calcularPesoPerdidoRealizando(rutina) {
        return super(rutina) - 1
    }

    override method pesoPorCalorias() { return 8000 }

    override method tiempoDeDuracionElegido() { return 90 }

    override method puedePracticar(rutina) {
        return (!(self.calorias(rutina) > 10000) )
    }
}