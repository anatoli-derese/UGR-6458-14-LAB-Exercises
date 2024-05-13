fun main(){
    var value : Double
    var unit : String
    
    var changeto : String
    println("Enter the number you want to convert to")
    value = readln().toDouble()
    println("Enter its unit, has to be km,m")
    unit = readln()
    println("what do you want the output unit")
    changeto = readln()

    var result: Double
    result = if (unit == "km" && changeto == "m") {
        value * 1000
    } else if (unit == "m" && changeto == "km") {
        value / 1000
    } else{
        value
    }

    println(result)
}