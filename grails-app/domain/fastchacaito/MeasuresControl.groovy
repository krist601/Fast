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
        balance nullable:true
        mesotherapy nullable:true
    }
    
    static getMeasureType(measuresControlId)
    {
        def measures = MeasuresControl.get(measuresControlId)
        if (measures.balance!=null)
            return "Balance"
        else if (measures.mesotherapy!=null)
            return "Mesoterapia"
        else 
            return ""
    }
    
    static getTotal(measuresControlId)
    {
        return MeasuresControl.executeQuery("select leftArm+ rightArm+ waist+ " +
            "abdomen+ hips+ leftThigh+ rightThigh+ leftCrotch+ rightCrotch" +
            " from MeasuresControl Where id =" + measuresControlId)[0]
    }
}
