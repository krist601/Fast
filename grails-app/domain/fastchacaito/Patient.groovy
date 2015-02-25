package fastchacaito

import groovy.time.TimeCategory
import groovy.time.TimeDuration
import org.springframework.asm.Item

class Patient {
    int cedula
    int historyNumber
    String email
    String civilStatus
    String haveKids
    String problematicsAreas
    String problemCauses
    String usedMethod
    String anotherTreatments
    float initialWeight
    String firstName
    String lastName
    String ocupation
    String address
    String phone
    Date bornDate
    float height
    boolean sufferFever
    boolean sufferHernias
    boolean sufferhemorrhoid
    boolean sufferHypertension
    boolean sufferDiabetes
    boolean sufferRenalInsufficiency
    boolean sufferHeartFailure
    String otherSuffer
    Date admisionDate
    String heartMedicine
    String medicine
    String allergy
    List medicHistory
    List bloodSample
    List appointment
    List treatments
    
    static hasMany = [medicHistory: MedicHistory, bloodSample: BloodSample, appointment: Appointment, treatments: Treatment]
    
    static constraints = {
        otherSuffer nullable:true
        problematicsAreas nullable:true
        problemCauses nullable:true
        usedMethod nullable:true
        anotherTreatments nullable:true
        phone nullable:true
    }
    def getPatientAge(){
        Date secondDate = new Date().toTimestamp()
        return secondDate.year - bornDate.year
    }
    def toDate(date){
        return Date.format(date)
    }
    static getMontoAbonado(patientId,treatmentId){
        def item = Patient.executeQuery("SELECT SUM(pm.amount) FROM Treatment as t, PaymentMethod as pm WHERE t.patient = "+patientId
            +" AND t.id = pm.treatment AND t.id="+treatmentId)
        if (item[0])
        return item[0]
        return 0
    }
    static getTreatments(treatmentId){
        Treatment item = Treatment.get(treatmentId)
        def response=""
        if (item.balance){
            response="Balance"
        }
        if (item.bodyTherapy){
            if (response=="")
            response="Terapia Corporal"
            else
            response=response+", Terapia Corporal"
        }
        if (item.mesotherapy){
            if (response=="")
            response="Mesoterapia"
            else
            response=response+", Mesoterapia"
        }
        if (item.machine){
            if (response=="")
            response="Maquina"
            else
            response=response+", Maquina"
        }
        if (response=="")
        response="Otra cosa"
        return response
    }
    static getBalance(treatmentId){
        Treatment treatment=Treatment.get(treatmentId)
        if (treatment.balance){
            return treatment.balance
        }
        return null
    }
    static getMachine(treatmentId){
        Treatment treatment=Treatment.get(treatmentId)
        if (treatment.machine){
            return treatment.machine
        }
        return null
    }
    static getMesotherapy(treatmentId){
        Treatment treatment=Treatment.get(treatmentId)
        if (treatment.mesotherapy){
            return treatment.mesotherapy
        }
        return null
    }
    static getBodyTherapy(treatmentId){
        Treatment treatment=Treatment.get(treatmentId)
        if (treatment.bodyTherapy){
            return treatment.bodyTherapy
        }
        return null
    }
    String toString(){
        return "${firstName+" "+lastName}"
    }
    static haveBalance(patientId){
        def query=Patient.executeQuery("SELECT p.id FROM Patient as p, Treatment as t,Balance as b WHERE p.id = t.patient AND b.treatment=t.id AND p.id="+patientId)
        if (query)
        return true
        return false
    }
    static haveMachine(patientId){
        def query=Patient.executeQuery("SELECT p.id FROM Patient as p, Treatment as t,Machine as m WHERE p.id = t.patient AND m.treatment=t.id AND p.id="+patientId)
        if (query)
        return true
        return false
    }
    static haveMesotherapy(patientId){
        def query=Patient.executeQuery("SELECT p.id FROM Patient as p, Treatment as t,Mesotherapy as m WHERE p.id = t.patient AND m.treatment=t.id AND p.id="+patientId)
        if (query)
        return true
        return false
    }
    static haveBodyTherapy(patientId){
        def query=Patient.executeQuery("SELECT p.id FROM Patient as p, Treatment as t,BodyTherapy as b WHERE p.id = t.patient AND b.treatment=t.id AND p.id="+patientId)
        if (query)
        return true
        return false
    }
    
    
    static getMeasuresControl(patientId)
    {
        def patient = Patient.get(patientId)
        def treatments = Treatment.findAllByPatient(patient)
        def measures = new ArrayList()
      
        for (int i=0;i<treatments.size();i++)
        {
            if (treatments[i])
            {
                def bal = treatments[i].balance
                def meso = treatments[i].mesotherapy
                if (bal)
                {
                     bal.eachWithIndex{
                            b,ind -> 
                            if (b.measuresControl)
                            {
                                b.measuresControl.each(){
                                   mc-> measures.add(mc)
                                }
                                
                            }
                        }
                }
                if (meso)
                {
                     meso.eachWithIndex{
                            m,ind -> 
                            if (m.measuresControl)
                            {
                                m.measuresControl.each(){
                                   mc-> measures.add(mc)
                                }
                                
                            }
                        }
                }
            }
        }
     //   println measures.sort { it.identifierNumber }
        return measures.sort { it.identifierNumber }
    }
}
