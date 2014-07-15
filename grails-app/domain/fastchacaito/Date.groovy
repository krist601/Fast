package fastchacaito

class Date {
    Date beginDate
    Date endDate
    String dateType
    
    static belongsTo = [patient: Patient]
    static constraints = {
    }
}
