package fastchacaito

class Gel {
    Date receivedDate
    String identifier
    Date shippedDate
    //deberia tener relacionado el usuario
    static belongsTo = [closure: Closure,secAppUser: user.SecAppUser]
    static constraints = {
    }
}
