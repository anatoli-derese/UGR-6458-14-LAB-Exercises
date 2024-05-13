fun main() {
    println("Enter a string:")
    val inputString = readln()
  
    var minChar = Char.MAX_VALUE
    var maxChar = Char.MIN_VALUE
  
    for (char in inputString) {
      minChar = minOf(minChar, char) 
      maxChar = maxOf(maxChar, char) 
    }
  
    println("Minimum character: $minChar (ASCII: ${minChar.toInt()})")
    println("Maximum character: $maxChar (ASCII: ${maxChar.toInt()})")
  }
  