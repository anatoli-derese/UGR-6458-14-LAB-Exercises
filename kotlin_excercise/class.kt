class BankAccount(private val accountNumber: String, private var balance: Double) {
    fun deposit(amount: Double) {
        balance += amount
    }

    fun withdraw(amount: Double) {

        if (balance >= amount) {
            balance -= amount
        } else {
            println("Insufficient funds. Cannot withdraw.")
        }
    }

    fun printBalance() {
        println("Account $accountNumber balance: \$$balance")
    }
}

fun main() {
    val account = BankAccount("123456", 1000.0)
    account.deposit(500.0)
    account.withdraw(200.0)
    account.printBalance()
}
