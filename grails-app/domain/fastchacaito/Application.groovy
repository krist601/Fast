package fastchacaito

class Application {
    String identifier
    Date arrivalDate
    Date lostDate
    
    static belongsTo = [vacutainer: Vacutainer]
    static constraints = {
    }
}
