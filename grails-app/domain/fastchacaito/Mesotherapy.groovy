package fastchacaito

class Mesotherapy {
    String treatAreas
    String previousAttempts
    String ploblemCauses
    String method

    static belongsTo = [sesionControl: SesionControl,treatment: Treatment]
    static constraints = {
    }
}
