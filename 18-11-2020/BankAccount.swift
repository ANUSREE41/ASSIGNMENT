import Foundation

class Bank {
    var code: String
    var branch: String
    var branchCode: String
    var accounts: [BankProtocolForAccount & AccountManagerReceiveProtocol]
    var managers: [BankProtocolForAccountManager]
    var accountDetailsList: [String: Account]
    var serialNumber: Int
    var requests: [Request]
    
    init (code: String, branch: String, branchCode: String) {
        self.code = code
        self.branch = branch
        self.branchCode = branchCode
        self.accounts = [BankProtocolForAccount & AccountManagerReceiveProtocol]()
        self.managers = [BankProtocolForAccountManager]()
        self.accountDetailsList = [String: Account]()
        self.serialNumber = 0
        self.requests = [Request]()
    }
    
    func addAccountManager(manager: BankProtocolForAccountManager) {
        managers.append(manager)
    }
    
    func addAccount(account: BankProtocolForAccount & AccountManagerReceiveProtocol) {
        accounts.append(account)
    }
    
    func createAccountNumber(account: Account) {
    
        var  accountNumber = code + branchCode  + String(serialNumber)

            while (accountNumber.length != 13) {
                 accountNumber += "0"
            }
                            
    account.accountNumber(number: accountNumber)
    serialNumber += 1
    
    }
    
    func addAccountDetails(accountNumber: String, account: Account) {
        accountDetailsList[accountNumber] = account
    }
    
    func enqueue(entry: Request) {
        requests.append(entry)
    }
    
    func dequeue() {
        if requests.isEmpty != true {
            for _ in requests {
                requests.remove(at: 0)
            }
        }
    }
    
   func processRequest() {
   
        let keyArray = accountDetailsList.keys
         
        for accountManager in managers {
            
            for entry in requests {
            
                 if (keyArray.contains(entry.accountNumber)) {
                    
                    if let temp = accountDetailsList[entry.accountNumber] {
                        
                        let account = temp
                 
                        switch entry.operation {
                     
                            case bankOPeration.checkBalance: accountManager.currentBalance(account: account)
                     
                            case bankOPeration.depositAmount: accountManager.depositAmount(amount: entry.amount, account: account)
                     
                            case bankOPeration.withdrawAmount: accountManager.withdrawAmount(amount: entry.amount, account: account)
                     
                            case bankOPeration.checkAccountDetails: accountManager.accountDetails(account: account)
                     
                            case bankOPeration.checkAccountStatement:accountManager.accountStatement(account: account) 
                                
                        }
                        
                    }
                    
                } else {
                    print("account number is invalid")
                }
                 
            }
            
        }
          
          
    } 
}

protocol BankProtocolForAccountManager {
    
    func depositAmount(amount: Int, account: Account)
    func withdrawAmount(amount: Int, account: Account)
    func currentBalance(account: Account)
    func accountDetails(account: Account)
    func accountStatement(account: Account) 
}

protocol BankProtocolForAccount {
    
    func accountNumber(number: String) 
}

enum bankOPeration: String {
    
    case checkBalance
    case depositAmount
    case withdrawAmount
    case checkAccountDetails
    case checkAccountStatement
}

class Request {
    var accountNumber: String
    var operation: bankOPeration
    var amount: Int
    
    init (accountNumber: String, operation: bankOPeration, amount: Int) {
        self.accountNumber = accountNumber
        self.operation = operation
        self.amount = amount
    }
}

class AccountManager: BankProtocolForAccountManager {
    

    func depositAmount(amount: Int, account: Account) {
    
        if let temp = account as? CasaAccount {
            temp.depositMoney(amount: amount)
        } else if let temp = account as? RecurringDeposit {
            temp.depositMoney(amount: amount)
        } else if let temp = account as? LoanAccount {
            temp.depositMoney(amount: amount)
        }
    }

   func withdrawAmount(amount: Int, account: Account) {

        if let temp = account as? CasaAccount {
            temp.withdrawMoney(amount: amount)
        } 
   }


    func currentBalance(account: Account) {

        print(account.currentBalance())
    }

    func accountDetails(account: Account) {

        print(account.accountDetails())
            
    }

    func accountStatement(account: Account) {

        if let temp = account as? CasaAccount {
            var transactionArray = temp.accountStatement()
            var count = 0
            var length = transactionArray.count
        
            print("last 10 transactions are:")
                 
                while(count != 10 && length != 0) {
                    
                    print(transactionArray[length - 1])
                    length -= 1
                    count += 1
                }
                
        } else if let temp = account as? RecurringDeposit {
            var transactionArray = temp.accountStatement()
            var count = 0
            var length = transactionArray.count
        
            print("last 10 transactions are:")
                 
                while(count != 10 && length != 0) {
                    
                    print(transactionArray[length - 1])
                    length -= 1
                    count += 1
                } 
            
        } else if let temp = account as? LoanAccount {
            var transactionArray = temp.accountStatement()
            var count = 0
            var length = transactionArray.count
        
            print("last 10 transactions are:")
                 
                while(count != 10 && length != 0) {
                    
                    print(transactionArray[length - 1])
                    length -= 1
                    count += 1
                } 
        
        
        } 
    }    
    

}

protocol AccountManagerReceiveProtocol {
    func currentBalance() -> Int 
    func accountDetails() -> String
}

protocol AccountStatement {
    func accountStatement() -> [String]
}

protocol Deposit {
    func depositMoney(amount: Int)
}
 
protocol Withdraw {
    func withdrawMoney(amount: Int)
}

enum intrestRateValue: Int {
    case intrestRate = 1
    case savingIntrestRate = 5
    case currentIntrestRate = 6
    case fixedIntrestRate = 8
    case recurringIntrestRate = 7
    case houseLoanIntrestRate = 3
    case vehicleLoanIntrestRate = 2
    case personLoanIntrestRate = 4
}
         
class Account: BankProtocolForAccount, AccountManagerReceiveProtocol {

    var accountHolderName: String
    var initialDeposit: Int
    var accountNumber: String
    var balance: Int
    var accountTransactions: [String]
    var accountHolderContactNumber: String?
    var accountHolderEmailId: String?
    var intrestRate = intrestRateValue.intrestRate
    
    init (accountHolderName: String, initialDeposit: Int) {
        self.accountHolderName =  accountHolderName
        self.initialDeposit = initialDeposit
        self.accountNumber = " "
        self.balance = 0
        self.accountTransactions = [String]()
    }
    
    func contactNumber(number: String?) {
        if let temp = number {
            self.accountHolderContactNumber = temp
         }
    }
    
    func emailId(id: String?) {
        if let temp = id {
            self.accountHolderEmailId = temp
        }
    }
    

    func accountNumber(number: String) {
        accountNumber = number
        print(accountNumber)
        
     }
     
     func currentBalance() -> Int {
        balance += initialDeposit
        return balance * (balance * self.intrestRate.rawValue / 365)
     }
     
     func accountDetails() -> String {
         let details = "accountHolderName:" + accountHolderName 
         return details 
     }
     
}

enum casaType: String {
    case currentAccount
    case savingAccount
}

class CasaAccount: Account, AccountStatement, Deposit, Withdraw {
    let subType: casaType
    let currentIntrestRate = intrestRateValue.currentIntrestRate
    let savingIntrestRate = intrestRateValue.savingIntrestRate
     
     init(accountHolderName: String, initialDeposit: Int, subType: casaType) {
         self.subType = subType
     super.init(accountHolderName: accountHolderName, initialDeposit: initialDeposit)
     }
     
     override func currentBalance() -> Int {
        balance += initialDeposit
        
        if (subType == casaType.currentAccount) {
        return balance * (balance * self.currentIntrestRate.rawValue / 365)
        } else {
            return balance * (balance * self.savingIntrestRate.rawValue / 365)
        }
        
     }
     
     func accountStatement() -> [String] {
         return accountTransactions
     }

    func depositMoney(amount: Int) {
       balance += amount
        print(amount)
        accountTransactions.append("+" + String(amount))
    }

    func withdrawMoney(amount: Int) {
        if(balance - amount > 0) {
            
            balance -= amount
            accountTransactions.append("-" + String(amount))
            print(amount)
        } else {
        
            print("do not have required balance")
        }
    }
}

class FixedDeposit: Account {
    var termOfDeposit: Int
    let fixedIntrestRate = intrestRateValue.fixedIntrestRate  
    
    init(accountHolderName: String, initialDeposit: Int, termOfDeposit: Int) {
         self.termOfDeposit = termOfDeposit
     super.init(accountHolderName: accountHolderName, initialDeposit: initialDeposit)
     }
     
    override func currentBalance() -> Int {
            balance += initialDeposit
            
                return balance + balance * self.fixedIntrestRate.rawValue * termOfDeposit
    }
     
}

class RecurringDeposit: Account, Deposit, AccountStatement  {

    var termOfDeposit: Int
    let recurringIntrestRate = intrestRateValue.recurringIntrestRate
    
    init(accountHolderName: String, initialDeposit: Int, termOfDeposit: Int) {
         self.termOfDeposit = termOfDeposit
     super.init(accountHolderName: accountHolderName, initialDeposit: initialDeposit)
     }
     
      override func currentBalance() -> Int {
            balance += initialDeposit
            
                return balance + balance * self.recurringIntrestRate.rawValue * termOfDeposit
    }
    
    func depositMoney(amount: Int) {
         
        balance += amount
        
        accountTransactions.append("+" + String(amount))
        print(amount)
             
    }
    
    func accountStatement() -> [String] {
         return accountTransactions
     }
        
}


enum loanType: String {
    case houseLoan
    case vehicleLoan
    case personLoan
}

class LoanAccount: Account, Deposit, AccountStatement {
    let subType: loanType
    let houseLoanIntrestRate = intrestRateValue.houseLoanIntrestRate
    let vehicleLoanIntrestRate = intrestRateValue.vehicleLoanIntrestRate
    let personLoanIntrestRate = intrestRateValue.personLoanIntrestRate

    init(accountHolderName: String, initialDeposit: Int, subType: loanType) {
         self.subType = subType
     super.init(accountHolderName: accountHolderName, initialDeposit: initialDeposit)
     }
     
    override func currentBalance() -> Int {
        balance += initialDeposit
        
        if (subType == loanType.houseLoan) {
        return balance * (balance * self.houseLoanIntrestRate.rawValue / 365)
        } else if (subType == loanType.vehicleLoan) {
            return balance * (balance * self.vehicleLoanIntrestRate.rawValue / 365)
        } else {
            return balance * (balance * self.personLoanIntrestRate.rawValue / 365)
        }
        
     }
     
     func depositMoney(amount: Int) {
       balance += amount
        print(amount)
        accountTransactions.append("+" + String(amount))
    }
    
    func accountStatement() -> [String] {
         return accountTransactions
     }
}


var bank1 = Bank(code: "111", branch: "AAA", branchCode: "101")
var accountManager1 = AccountManager()
var account1 = Account(accountHolderName: "aaa", initialDeposit: 500)
bank1.addAccount(account: account1)
bank1.addAccountManager(manager: accountManager1)
bank1.createAccountNumber(account: account1)

var account2 = Account(accountHolderName: "bbb", initialDeposit: 900)
bank1.createAccountNumber(account: account2)
bank1.addAccount(account: account2)
bank1.addAccountDetails(accountNumber: account1.accountNumber, account: account1)
bank1.addAccountDetails(accountNumber: account2.accountNumber, account: account2)

var request1 = Request(accountNumber: account1.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request2 = Request(accountNumber: account1.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)

bank1.enqueue(entry: request1)
bank1.enqueue(entry: request2)

bank1.processRequest()
bank1.dequeue()

var request3 = Request(accountNumber: account2.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request4 = Request(accountNumber: account2.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)

bank1.enqueue(entry: request3)
bank1.enqueue(entry: request4)

bank1.processRequest()
bank1.dequeue()

var account3 = CasaAccount(accountHolderName: "ccc", initialDeposit: 600, subType: casaType.currentAccount)
bank1.createAccountNumber(account: account3)
bank1.addAccount(account: account3)
bank1.addAccountDetails(accountNumber: account3.accountNumber, account: account3)

var request5 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 1000)
var request6 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.withdrawAmount, amount: 500)
var request7 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request8 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)
var request9 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)

bank1.enqueue(entry: request5)
bank1.enqueue(entry: request6)
bank1.enqueue(entry: request7)
bank1.enqueue(entry: request8)
bank1.enqueue(entry: request9)

bank1.processRequest()
bank1.dequeue()

var account4 = RecurringDeposit(accountHolderName: "ddd", initialDeposit: 5000, termOfDeposit: 2)
bank1.createAccountNumber(account: account4)
bank1.addAccount(account: account4)
bank1.addAccountDetails(accountNumber: account4.accountNumber, account: account4)

var request10 = Request(accountNumber: account4.accountNumber, operation: bankOPeration.depositAmount, amount: 1000)
var request11 = Request(accountNumber: account4.accountNumber, operation: bankOPeration.withdrawAmount, amount: 900)
var request12 = Request(accountNumber: account4.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request13 = Request(accountNumber: account4.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)
var request14 = Request(accountNumber: account4.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)

bank1.enqueue(entry: request10)
bank1.enqueue(entry: request11)
bank1.enqueue(entry: request12)
bank1.enqueue(entry: request13)
bank1.enqueue(entry: request14)

bank1.processRequest()
bank1.dequeue()

var account5 = CasaAccount(accountHolderName: "eee", initialDeposit: 2000, subType: casaType.savingAccount)
bank1.createAccountNumber(account: account5)
bank1.addAccount(account: account5)
bank1.addAccountDetails(accountNumber: account5.accountNumber, account: account5)

var request15 = Request(accountNumber: account5.accountNumber, operation: bankOPeration.depositAmount, amount: 3000)
var request16 = Request(accountNumber: account5.accountNumber, operation: bankOPeration.withdrawAmount, amount: 200)
var request17 = Request(accountNumber: account5.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request18 = Request(accountNumber: account5.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)
var request19 = Request(accountNumber: account5.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)

bank1.enqueue(entry: request15)
bank1.enqueue(entry: request16)
bank1.enqueue(entry: request17)
bank1.enqueue(entry: request18)
bank1.enqueue(entry: request19)

bank1.processRequest()
bank1.dequeue()

var account6 = FixedDeposit(accountHolderName: "fff", initialDeposit: 10000, termOfDeposit: 5)
bank1.createAccountNumber(account: account6)
bank1.addAccount(account: account6)
bank1.addAccountDetails(accountNumber: account6.accountNumber, account: account6)

var request20 = Request(accountNumber: account6.accountNumber, operation: bankOPeration.depositAmount, amount: 100)
var request21 = Request(accountNumber: account6.accountNumber, operation: bankOPeration.withdrawAmount, amount: 900)
var request22 = Request(accountNumber: account6.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request23 = Request(accountNumber: account6.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)
var request24 = Request(accountNumber: account6.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)

bank1.enqueue(entry: request20)
bank1.enqueue(entry: request21)
bank1.enqueue(entry: request22)
bank1.enqueue(entry: request23)
bank1.enqueue(entry: request24)

bank1.processRequest()
bank1.dequeue()

var account7 = LoanAccount(accountHolderName: "ccc", initialDeposit: 100, subType: loanType.houseLoan)
bank1.createAccountNumber(account: account7)
bank1.addAccount(account: account7)
bank1.addAccountDetails(accountNumber: account7.accountNumber, account: account7)

var request25 = Request(accountNumber: account7.accountNumber, operation: bankOPeration.depositAmount, amount: 1000)
var request26 = Request(accountNumber: account7.accountNumber, operation: bankOPeration.withdrawAmount, amount: 500)
var request27 = Request(accountNumber: account7.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request28 = Request(accountNumber: account7.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)
var request29 = Request(accountNumber: account7.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)

bank1.enqueue(entry: request25)
bank1.enqueue(entry: request26)
bank1.enqueue(entry: request27)
bank1.enqueue(entry: request28)
bank1.enqueue(entry: request29)

bank1.processRequest()
bank1.dequeue()

var account8 = LoanAccount(accountHolderName: "ggg", initialDeposit: 500, subType: loanType.vehicleLoan)
bank1.createAccountNumber(account: account8)
bank1.addAccount(account: account8)
bank1.addAccountDetails(accountNumber: account8.accountNumber, account: account8)

var request30 = Request(accountNumber: account8.accountNumber, operation: bankOPeration.depositAmount, amount: 1500)
var request31 = Request(accountNumber: account8.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request32 = Request(accountNumber: account8.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)
var request33 = Request(accountNumber: account8.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)

bank1.enqueue(entry: request30)
bank1.enqueue(entry: request31)
bank1.enqueue(entry: request32)
bank1.enqueue(entry: request33)

bank1.processRequest()
bank1.dequeue()

var account9 = LoanAccount(accountHolderName: "hhh", initialDeposit: 1200, subType: loanType.personLoan)
bank1.createAccountNumber(account: account9)
bank1.addAccount(account: account9)
bank1.addAccountDetails(accountNumber: account9.accountNumber, account: account9)

var request34 = Request(accountNumber: account9.accountNumber, operation: bankOPeration.depositAmount, amount: 1000)
var request35 = Request(accountNumber: account9.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request36 = Request(accountNumber: account9.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)
var request37 = Request(accountNumber: account9.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)
var request38 = Request(accountNumber: account9.accountNumber, operation: bankOPeration.depositAmount, amount: 2000)
var request39 = Request(accountNumber: account9.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)

bank1.enqueue(entry: request34)
bank1.enqueue(entry: request35)
bank1.enqueue(entry: request36)
bank1.enqueue(entry: request37)
bank1.enqueue(entry: request38)
bank1.enqueue(entry: request39)

bank1.processRequest()
bank1.dequeue()

var request40 = Request(accountNumber: "1111012340000", operation: bankOPeration.depositAmount, amount: 1000)
var request41 = Request(accountNumber: account2.accountNumber, operation: bankOPeration.checkBalance, amount: 0)
var request42 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkAccountDetails, amount: 0)
var request43 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)
var request44 = Request(accountNumber: account5.accountNumber, operation: bankOPeration.withdrawAmount, amount: 200)
var request45 = Request(accountNumber: account8.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)
var request46 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 5000)

bank1.enqueue(entry: request40)
bank1.enqueue(entry: request41)
bank1.enqueue(entry: request42)
bank1.enqueue(entry: request43)
bank1.enqueue(entry: request44)
bank1.enqueue(entry: request45)
bank1.enqueue(entry: request46)

bank1.processRequest()
bank1.dequeue()

var request47 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 5000)
var request48 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 3000)
var request49 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.withdrawAmount, amount: 2000)
var request50 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 1000)
var request51 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.withdrawAmount, amount: 4000)
var request52 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkBalance, amount: 0)

bank1.enqueue(entry: request47)
bank1.enqueue(entry: request48)
bank1.enqueue(entry: request49)
bank1.enqueue(entry: request50)
bank1.enqueue(entry: request51)
bank1.enqueue(entry: request52)

bank1.processRequest()
bank1.dequeue()


var request53 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 5000)
var request54 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.withdrawAmount, amount: 500)
var request55 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 2000)
var request56 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.withdrawAmount, amount: 300)
var request57 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.withdrawAmount, amount: 1000)
var request58 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkBalance, amount: 0)

bank1.enqueue(entry: request53)
bank1.enqueue(entry: request54)
bank1.enqueue(entry: request55)
bank1.enqueue(entry: request56)
bank1.enqueue(entry: request57)
bank1.enqueue(entry: request58)

bank1.processRequest()
bank1.dequeue()


var request59 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 3000)
var request60 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.depositAmount, amount: 2000)
var request61 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.withdrawAmount, amount: 100)
var request62 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.withdrawAmount, amount: 50)

bank1.enqueue(entry: request59)
bank1.enqueue(entry: request60)
bank1.enqueue(entry: request61)
bank1.enqueue(entry: request62)

bank1.processRequest()
bank1.dequeue()

var request63 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkBalance, amount: 0)

bank1.enqueue(entry: request63)
bank1.processRequest()
bank1.dequeue()

var request64 = Request(accountNumber: account3.accountNumber, operation: bankOPeration.checkAccountStatement, amount: 0)

bank1.enqueue(entry: request64)
bank1.processRequest()
bank1.dequeue()

var request65 = Request(accountNumber: account5.accountNumber, operation: bankOPeration.withdrawAmount, amount: 400000)

bank1.enqueue(entry: request65)
bank1.processRequest()
bank1.dequeue()












