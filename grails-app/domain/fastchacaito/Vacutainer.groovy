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
    static avaliableVacutainers(){
        
        def query= Vacutainer.executeQuery("from Vacutainer as vac WHERE vac.vacutainerType='Mesoterapia' AND vac.id not in (select v.id from Vacutainer as v,SesionControl as s WHERE v.id=s.vacutainer)")
        return query
    }
}
