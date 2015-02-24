package fastchacaito

class Treatment {
    Date date
    Date beginDate
    Date endDate
    int totalPrice
//    List balance
//    List mesotherapy
//    List bodyTherapy
//    List machine
//    List paymentMethod
    
    static hasMany = [balance: Balance, mesotherapy: Mesotherapy, bodyTherapy: BodyTherapy, machine: Machine, paymentMethod: PaymentMethod]

    static belongsTo = [packages: Package, patient: Patient]
    static constraints = {
    }
    
  
}
