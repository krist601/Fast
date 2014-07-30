package fastchacaito

class Gel {
    Date receivedDate
    String outType
    //deberia tener relacionado el usuario
    static belongsTo = [closure: Closure,secAppUser: user.SecAppUser]
    static constraints = {
    }
}
