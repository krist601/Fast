package fastchacaito

class Mesotherapy {
    String treatAreas
    String previousAttempts
    String ploblemCauses
    String method
    List sesionControl

    static hasMany = [sesionControl: SesionControl]
    static belongsTo = [treatment: Treatment]
    static constraints = {
    }
}
