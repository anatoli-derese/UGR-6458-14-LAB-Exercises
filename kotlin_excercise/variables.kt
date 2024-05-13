fun main() {
    var num1: Double
    var num2: Double
    var operation: String
    num1 = readln().toDouble()
    num2 = readln().toDouble()
    operation = readln()

    var result: Double = 0.0

    when (operation) {
      "+" -> result = num1 + num2
      "-" -> result = num1 - num2
      "*" -> result = num1 * num2
      "/" -> {
        if (num2 == 0.0) {
          println("Error: Division by zero is not allowed.")
        } else {
          result = num1 / num2
        }
      }
    }

    println("result is$ { result }")
  }
  