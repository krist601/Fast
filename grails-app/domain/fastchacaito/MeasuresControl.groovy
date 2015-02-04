package fastchacaito

class MeasuresControl {
    int identifierNumber
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
    static belongsTo = [machine: Machine,secAppUser: user.SecAppUser, mesotherapy: Mesotherapy, balance: Balance]
    static constraints = {
        machine nullable:true
    }
}
