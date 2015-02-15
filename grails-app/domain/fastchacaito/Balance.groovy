package fastchacaito

class Balance {
    String type
    int applicationAmount
    float idealWeight
    List applicationControl
    
    static hasMany = [applicationControl: ApplicationControl]
    
    static belongsTo = [treatment: Treatment]
    static constraints = {
    }
    static getType(balanceID){
        println "el value es: "+balanceID
        def bal=Balance.get(balanceID)
        if (bal)
        return bal.type
        return null
    }
    
    static applyControl(balanceId)
    {
        def balance = Balance.get(balanceId)
        def applicationsSize= balance.applicationControl.size()
        
        //  def measures = 
      
        def applications = balance.applicationControl
        def measures = 0
        applications.each(){ application -> measures += application.measuresControl.size()
            
        }
        println "medidas balance"+measures
        if (applicationsSize.mod(9)==0)
        return true
        else 
        return false
    }
}
