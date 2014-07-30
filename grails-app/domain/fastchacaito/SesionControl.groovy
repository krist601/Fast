package fastchacaito

class SesionControl {
    int sesionNumber
    boolean leftArm
    boolean rightArm
    boolean waist
    boolean abdomen
    boolean hips
    boolean leftThigh
    boolean rightThigh
    boolean leftCrotch
    boolean rightCrotch
    boolean achieved
    
    //deberia tener relacionado el usuario
    static belongsTo = [vacutainer: Vacutainer,secAppUser: user.SecAppUser]
    static constraints = {
    }
}
