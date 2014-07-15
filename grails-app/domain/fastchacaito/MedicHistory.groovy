package fastchacaito

class MedicHistory {
    Date date
    String presentDisease
    String medicine
    String familyHistory
    String surgicalPathologicalHistory
    String obstetricalGynecologicalHistory
    String habits
    String FuntionalTestCardiovascular
    String FuntionalTestRespiratory
    String FuntionalTestDigestive
    String FuntionalTestUnitary
    String FuntionalTestNeurologicalPsychic 
    String FuntionalTestMetabolicEndocrine 
    String FuntionalTestGynecological
    
    static belongsTo = [patient: Patient]
    static constraints = {
    }
}
