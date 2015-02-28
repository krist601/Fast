package fastchacaito

class Balance {
    String type
    int applicationAmount
    float idealWeight
    List applicationControl
    
    static hasMany = [applicationControl: ApplicationControl,measuresControl: MeasuresControl] //
    
    static belongsTo = [treatment: Treatment]
    static constraints = {
        measuresControl nullable:true
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
        
         def measuresSize = balance.measuresControl.size()
 
        println "medidas balance"+applicationsSize.div(9)
        if (applicationsSize.mod(9)==0 && applicationsSize.div(9)>=measuresSize)
        return true
        else 
        return false
    }
}
