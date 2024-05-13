import kotlin.random.Random

fun main() {
  val passwordLength = 8 // Set desired password length

  val charPool = ('a'..'z') + ('A'..'Z') + ('0'..'9') + listOf('!', '@', '#', '$', '%', '^', '&', '*', '(', ')')

  val password = StringBuilder()
  val random = Random

  for (i in 1..passwordLength) {
    val randomChar = charPool.random(random) // Select random character from pool
    password.append(randomChar)
  }

  println("Generated password: $password")
}
