fun main(){
    var word : String
    println("Enter a word")
    word = readln()
    analysis(word)
}

fun analysis(word: String){
    var vowels = 0
    var allVowels = listOf('a','e','i','o','u','A','E','I','O','U')
    var allUpperCases = listOf('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
    var words = 1
    var upperCase = 0
    for (i in word){
        if (i in  allVowels){
            vowels += 1
        }
        if (i ==' '){
            words += 1
        }
        if( i in allUpperCases  ){
            upperCase += 1
        }
    }
    println("The number of vowels in the word is ${vowels}")
    println("The number of words in the word is ${words}")
    println("The number of uppercase letters in the word is ${upperCase}")
}