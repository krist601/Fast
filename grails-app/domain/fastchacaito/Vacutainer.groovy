package fastchacaito

class Vacutainer {
    String identifier
    Date arrivalDate
    Date lostDate
    String vacutainerType
    List application = new ArrayList()
    
    static hasMany = [application: Application]
    
    static mapping = { 
        version false 
    } 
    static constraints = {
        lostDate nullable: true
        identifier unique: true
        application cascade: 'all-delete-orphan'
    }
    
    String toString(){
        return "${identifier}"
    }
}
