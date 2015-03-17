package fastchacaito

class Appointment {
    Date date
    Date startTime
    Date endTime

    Boolean attended
    static belongsTo = [treatment: Treatment, user: user.SecAppUser]
    static constraints = {
        attended nullable:true
    }
}
