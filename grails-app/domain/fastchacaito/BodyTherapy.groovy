package fastchacaito

class BodyTherapy {
    String massageType
    
    static belongsTo = [treatment: Treatment]
    static constraints = {
    }
}
