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
        def sizeSessions= meso.sesionControl.size()
        //sumar total de medidas, medidas.div(2) = numero, comparar total de medidas con este numero
        //  def measures = 
//        def sessions = meso.sesionControl
//       def measures = 0
//        sessions.each(){ sessio -> measures = sessio.measures.size()
//            
//        }
//        println "medidas meso"+measures
        if (sizeSessions.mod(2)==0)
        return true
        else return false
    }

}

