package fastchacaito

class Package {
    int price
    int sesionAmount
    String packageType
    String description
    
    static constraints = {
        description nullable:true
    }
    String toString(){
        return "${packageType+" "+ sesionAmount+" aplicaciones : "+price+" BsF"}"
    }
}
