package fastchacaito

class BodyTherapy {
    String massageType
    List massageControl
    
    static hasMany = [massageControl: MassageControl]
    static belongsTo = [treatment: Treatment]
    static constraints = {
    }
}
