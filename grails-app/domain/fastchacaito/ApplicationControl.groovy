package fastchacaito

class ApplicationControl {
    int identifierNumber
    Date date
    int currentWeight
    int differenceWeight
    int reachedWeight
    boolean wasApplied
    String nControl
    String observation
    
    static belongsTo = [application: Application, balance: Balance]
    static constraints = {
    }
}
