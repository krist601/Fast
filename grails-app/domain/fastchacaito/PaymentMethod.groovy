package fastchacaito

class PaymentMethod {
    int amount
    String paymentMethodType
    String bank
    Date date
    
    static belongsTo = [treatment: Treatment]
    static constraints = {
    }
}
