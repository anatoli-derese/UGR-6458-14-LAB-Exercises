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
# Compiled class file
*.class

# Log file
*.log

# Package Files #
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar

# Kotlin Build
*.kotlin_metadata
*.kotlin_builtins
*.kotlin_module

# Gradle files
.gradle/
build/

# IntelliJ IDEA files
.idea/
*.iml
*.iws

# VS Code files
.vscode/

# Other
*.bak
*.swp
*~
*.DS_Store
fun main() {
    val account = BankAccount("123456", 1000.0)
    account.deposit(500.0)
    account.withdraw(200.0)
    account.printBalance()
}
