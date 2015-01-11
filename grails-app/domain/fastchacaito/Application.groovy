package fastchacaito

class Application {
    String identifier
    Date arrivalDate
    Date lostDate
    String applicationType
    
    static belongsTo = [vacutainer: Vacutainer]
    static constraints = {
        lostDate nullable: true
        identifier unique: true
    }
    String toString(){
        return "${identifier}"
    }
}
