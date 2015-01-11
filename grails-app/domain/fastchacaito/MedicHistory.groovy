package fastchacaito

class MedicHistory {
    Date date
    String presentDisease
    String medicine
    String familyHistory
    String surgicalPathologicalHistory
    String obstetricalGynecologicalHistory
    String habits
    String funtionalTestCardiovascular
    String funtionalTestRespiratory
    String funtionalTestDigestive
    String funtionalTestUnitary
    String funtionalTestNeurologicalPsychic 
    String funtionalTestMetabolicEndocrine 
    String funtionalTestGynecological
    
    static belongsTo = [patient: Patient]
    static constraints = {
    }
    
}
