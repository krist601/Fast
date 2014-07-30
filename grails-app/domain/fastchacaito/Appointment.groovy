package fastchacaito

class Appointment {
    Date beginDate
    Date endDate
    String dateType
    
    static belongsTo = [patient: Patient]
    static constraints = {
    }
}
