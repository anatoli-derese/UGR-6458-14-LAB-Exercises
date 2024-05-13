fun main(){
    var grade : Double
    println("Enter your grade")
    grade = readln().toDouble()

    var result: String

    result = when(grade){
        in 0.0..59.9 -> "F"
        in 60.0..69.9 -> "D"
        in 70.0..79.9 -> "C"
        in 80.0..89.9 -> "B"
        in 90.0..100.0 -> "A"
        else -> "Invalid grade"
    }
    println("Your grade is ${result}")
}