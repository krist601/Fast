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
}
