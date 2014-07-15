package fastchacaito

class MeasuresControl {
    Date measureDate
    int weightBefore
    int waistBefore
    int bellyBefore
    int hipBefore
    int leftThighBefore
    int rightThighBefore
    int leftCrotchBefore
    int rightCrotchBefore
    int weightAfter
    int waistAfter
    int bellyAfter
    int hipAfter
    int leftThighAfter
    int rightThighAfter
    int leftCrotchAfter
    int rightCrotchAfter
    
    //deberia tener relacionado el usuario
    static belongsTo = [machine: Machine]
    static constraints = {
    }
}
