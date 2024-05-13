fun toUpperCaseList(strings: List<String>): List<String> {
    return strings.map { it.uppercase() }
}

fun filterGreaterThan(numbers: List<Int>, threshold: Int): List<Int> {

    return numbers.filter { it > threshold }
  }
  
  fun sumList(numbers: List<Int>): Int {

    return numbers.reduce { acc, element -> acc + element }
  }
  
  