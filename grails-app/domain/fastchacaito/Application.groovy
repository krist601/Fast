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
    
    static avaliableApplications(type){
        
        def query= Application.executeQuery("from Application as app WHERE app.applicationType='"+type+"' AND app.id not in (select a.id from Application as a, ApplicationControl as ac WHERE a.id=ac.application)")
        return query
    }
}
