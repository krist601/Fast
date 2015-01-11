package fastchacaito

class Package {
    int price
    int sesionAmount
    String packageType

    static constraints = {
    }
    String toString(){
        return "${packageType+" "+ sesionAmount+" aplicaciones : "+price+" BsF"}"
    }
}
