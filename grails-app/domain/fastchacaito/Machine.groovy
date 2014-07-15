package fastchacaito

class Machine {
    String machineType

    static belongsTo = [treatment: Treatment]
    static constraints = {
    }
}
