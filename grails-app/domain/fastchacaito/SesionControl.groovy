package fastchacaito

class SesionControl {
    int sesionNumber
    float leftArm
    float rightArm
    float waist
    float abdomen
    float hips
    float leftThigh
    float rightThigh
    float leftCrotch
    float rightCrotch
    float achieved
    Date date
    
    //deberia tener relacionado el usuario
    static belongsTo = [vacutainer: Vacutainer,vacutainer2: Vacutainer,secAppUser: user.SecAppUser, mesotherapy: Mesotherapy]
    static constraints = {
        vacutainer2 nullable:true
    }
}
