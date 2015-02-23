package fastchacaito

class ApplicationControl {
    int identifierNumber
    Date date
    float currentWeight
    float differenceWeight
    float reachedWeight
    boolean wasApplied
    String observation
    static belongsTo = [application: Application, balance: Balance, user: user.SecAppUser]
    static constraints = {
        observation nullable:true
        application nullable:true
    }
    
    static getIdentifierNumber(balanceID){
        def row = ApplicationControl.executeQuery("SELECT MAX(ap.identifierNumber)+1 FROM ApplicationControl as ap WHERE ap.balance="+balanceID)
        return row
    }
    static getLastWeight(balanceID){
        println "me esta llegando "+balanceID
        def row = ApplicationControl.executeQuery("SELECT MAX(ap.id) FROM ApplicationControl as ap, Balance as b WHERE ap.balance=b.id AND b.id="+balanceID)
        if(row[0]){
            def row2 = ApplicationControl.executeQuery("SELECT currentWeight FROM ApplicationControl as ap WHERE ap.id="+row[0])
            if(row2[0]){
                return row2[0]
                println row2[0]
            }
        }
        return 0
    }
    static getLastReachedWeight(balanceID){
        def row = ApplicationControl.executeQuery("SELECT MAX(ap.id) FROM ApplicationControl as ap, Balance as b WHERE ap.balance=b.id AND b.id="+balanceID)
        if(row[0]){
            def row2 = ApplicationControl.executeQuery("SELECT reachedWeight FROM ApplicationControl as ap WHERE ap.id="+row[0])
            if(row2[0])
                return row2[0]
        }
        return 0
    }
}
