package fastchacaito

class MassageControl {
    int massageNumber
    Date MassageDate

    //deberia tener relacionado el usuario
    static belongsTo = [bodyTherapy: BodyTherapy,secAppUser: user.SecAppUser]
    static constraints = {
    }
}
