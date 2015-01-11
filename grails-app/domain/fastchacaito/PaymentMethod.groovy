package fastchacaito

class PaymentMethod {
    int amount
    String paymentMethodType
    String bank
    
    static belongsTo = [treatment: Treatment]
    static constraints = {
    }
}
