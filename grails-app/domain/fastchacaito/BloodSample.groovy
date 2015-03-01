package fastchacaito

class BloodSample {
    Date receivedDate
    String testType
    Date shippingDate
    Date receiptData
    
    static belongsTo = [patient: Patient]
    static constraints = {
        receivedDate nullable:true
        shippingDate nullable:true
    }
}
