package fastchacaito

class Closure {
    Date closureDate
    int reportX
    int reportZ
    //deberia tener relacionado el usuario
    static belongsTo = [secAppUser: user.SecAppUser]
    static constraints = {
    }
}
