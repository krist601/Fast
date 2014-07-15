package fastchacaito

class Inventory {
    String inventoryType
    Date receivedDate
    
    static belongsTo = [closure: Closure]
    static constraints = {
    }
}
