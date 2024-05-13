fun main(){
    var price : Double
    var discount : Double
    var total : Double
    println("Enter the price of the item")
    price = readln().toDouble()
    println("Enter the discount percentage a number between 0 and 1")
    discount = readln().toDouble()
    if (discount > 0.5){
        println("Discount cannot be more than 50%")
        return 
    }
    total = price - (price * discount)
    println("The total price is ${total}")
}