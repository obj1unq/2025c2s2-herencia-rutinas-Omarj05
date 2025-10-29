class Rutina {
    // se puede usar constante aqui pero no se debe definir. los atributos son ( - ).
    method calorias(tiempo) {
        return 100 * (tiempo - self.descansoSegun(tiempo)) * self.intensidad() //template method, define un algoritmo general que solo no se puede ejecutar.
    } // method publico ( + ), se puede llamar en forma global.

    method intensidad() //metodos hook, son subtareas que se definen mas tarde y resuelven  las partecitas del algoritmo.

    method descansoSegun(duracion)  // method privado ( # ), no es necesario llamarlo por afuera.
}

class Running inherits Rutina {
    var property intensidad

    override method descansoSegun(duracion) {
        if (duracion > 20) {
            return 5
        }
        else { return 2 }
    }
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