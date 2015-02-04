package fastchacaito

class SesionControl {
    int sesionNumber
    String kit
    Date date
    
    //deberia tener relacionado el usuario
    static belongsTo = [vacutainer: Vacutainer,vacutainer2: Vacutainer,secAppUser: user.SecAppUser, mesotherapy: Mesotherapy]
    static constraints = {
        vacutainer2 nullable:true
    }
}
