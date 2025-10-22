class Club {
    const property predios
}

class Predio {
    const property rutinasPermitidas

    method cantDeCaloriasQuemadasPara(persona) {
        return rutinasPermitidas.sum({ rutina => persona.calcularPesoPermitidoRealizando(rutina)})
    }

    method rutinasQuePuedeHacer(persona) {
        return 
    }
}

