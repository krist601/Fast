package fastchacaito

class Mesotherapy {
    String treatAreas
    String previousAttempts
    String ploblemCauses
    String method
    List sesionControl

    static hasMany = [sesionControl: SesionControl,measuresControl: MeasuresControl] //,measuresControl: MeasuresControl
    static belongsTo = [treatment: Treatment]
    static constraints = {
        measuresControl nullable:true
    }
    static applyControl(mesotherapyId)
    {
        def meso = Mesotherapy.get(mesotherapyId)
        def sessionsSize= meso.sesionControl.size()
        //sumar total de medidas, medidas.div(2) = numero, comparar total de medidas con este numero
        def measuresSize = meso.measuresControl.size()
 
        println "medidas meso"+sessionsSize.div(2)
        if (sessionsSize.mod(2)==0 && sessionsSize.div(2)>=measuresSize)
        return true
        else return false
    }

}

