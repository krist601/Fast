package fastchacaito

class Appointment {
    Date date
    Date time

    boolean attended
    static belongsTo = [treatment: Treatment, user: user.SecAppUser]
    static constraints = {
        attended nullable:true
    }
}
