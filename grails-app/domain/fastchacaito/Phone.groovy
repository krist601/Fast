package fastchacaito

class Phone {
    String areaCode
    String phoneNumber

    static belongsTo = [patient: Patient]
    static constraints = {
    }
}
