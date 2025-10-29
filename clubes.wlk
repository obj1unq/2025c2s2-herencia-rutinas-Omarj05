class Club {
    const property predios

    method mejorPredio(persona) {
        predios.max({predio => predio.cantDeCaloriasQuemadasPara(persona)})
    }

    method prediosTranquis(persona) {
        return predios.filter({predios => predios.tieneRutinasTranquiPara(persona)})
    }

    method rutinasMasExigentesPara(persona) {
        return predios.map({predio => predio.rutinasMasExigentesPara(persona)}).asSet()
    }
}

class Predio {
    const property rutinasPermitidas

    method cantDeCaloriasQuemadasPara(persona) {
        return rutinasPermitidas.sum({ rutina => persona.calcularPesoPermitidoRealizando(rutina)})
    }

    method tieneRutinasTranquiPara(persona) {
        return rutinasPermitidas.any({rutina => rutina.calorias(persona) < 500})
    }

    method rutinaMasExigentePara(persona) {
        return rutinasPermitidas.max({rutina => rutina.calorias(persona)})
    }
}

