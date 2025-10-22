class Rutina {

    method calorias(tiempo) {
        return 100 * (tiempo - self.descansoSegun(tiempo)) * self.intensidad()
    }

    method intensidad()

    method descansoSegun(duracion) 
}

class Running inherits Rutina {
    var property intensidad

    override method descansoSegun(duracion) {
        if (duracion > 20) {
            return 5
        }
        else { return 2 }
    }

    override method intensidad() { return intensidad }
}

class Marathon inherits Running {
    override method calorias(tiempo) {
        return super(tiempo) * 2
    }
}

class RemoNormal inherits Rutina {
    override method intensidad() { return 1.3 }

    override method descansoSegun(duracion) { return duracion / 5 }
}

class RemoDeCompeticion inherits RemoNormal {
    override method intensidad() { return 1.7 }

    override method descansoSegun(duracion) {
        return (super(duracion) - 3).max(2)
    }
}