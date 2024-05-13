fun main(){
val numbers = mutableListOf<Double>() 

  println("Enter numbers (separated by spaces or press Enter to finish):")

  while (true) {
    val num: Double
    val input = readln()
    if (input.isBlank()) {
      break  
    }
    num = input.toDoubleOrNull() ?: 0.0  
    numbers.add(num)
  }
  var maximum  = findMax(numbers)
  var onlyOdds = filterEvenNumbers(numbers)
  var average = calculateAverage(numbers)
  println("Numbers: $numbers")
  println("Max number $maximum")
  println("Odd Numbers $onlyOdds")
    println("Average $average")
}
fun findMax(numbers: List<Double>): Double? {
    return numbers.maxOrNull()
}

fun filterEvenNumbers(numbers: List<Double>): List<Double> {
    return numbers.filter { it % 2 == 0.0 }  
  }
  fun calculateAverage(numbers: List<Double>): Double {
 
    return numbers.sum() / numbers.size
  }
