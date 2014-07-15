package fastchacaito

class Balance {
    String type
    int applicationAmount
    int idealWeight
    
    static belongsTo = [treatment: Treatment]
    static constraints = {
    }
}
