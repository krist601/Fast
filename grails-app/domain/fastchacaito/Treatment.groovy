package fastchacaito

class Treatment {
    Date date
    Date beginDate
    Date EndDate
    Date totalPrice

    static belongsTo = [packages: Package,paymentMethod: PaymentMethod]
    static constraints = {
    }
}
