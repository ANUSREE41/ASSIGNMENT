import Foundation

enum bankOPeration: String {
    
    case openAnAccount, checkBalance, depositAmount, withdrawAmount, checkAccountDetails, checkAccountStatement
}

class InitialEntry {
    
    var account: Account
    var operation: bankOPeration
    var bankCode: String
    var branchCode: String
    var deposit: Int
    var withdraw: Int

    
    init (account: Account, operation: bankOPeration, bankCode: String, branchCode: String, deposit: Int, withdraw: Int) {
    
        self.account = account
        self.operation = operation
        self.bankCode = bankCode
        self.branchCode = branchCode
        self.deposit = deposit
        self.withdraw = withdraw
    }
    
    
}

class Request {
    
    var entries: [InitialEntry]
    var accountManagers: [RequestProtocol]
    
    init() {
    
        self.entries = [InitialEntry]()
        self.accountManagers = [RequestProtocol]()
    }
    
    func addEntries(entry: InitialEntry) {
        entries.append(entry)
    }
    
    func addAccountManager(accountManager: RequestProtocol) {
        accountManagers.append(accountManager)
    }
    
    func processRequest() {
     
     for entry in entries {
         
         for accountManager in accountManagers {
             
             if (accountManager.bankCode == entry.bankCode && accountManager.branchCode == entry.branchCode) {
                 
                 switch(entry.operation) {
                     
                     case (bankOPeration.openAnAccount): accountManager.createAccountNumber(serialNumber: entry.account.serialNumber, account: entry.account)
                                
                     case (bankOPeration.checkBalance): accountManager.currentBalance(accountNumber: entry.account.accountNumber)
                     
                     case(bankOPeration.depositAmount): accountManager.depositAmount(amount: entry.deposit, accountNumber: entry.account.accountNumber)
                     
                     case(bankOPeration.withdrawAmount): accountManager.withdrawAmount(amount: entry.withdraw, accountNumber: entry.account.accountNumber)
                     
                     case(bankOPeration.checkAccountDetails): accountManager.accountDetails(accountNumber: entry.account.accountNumber)
                     
                     case(bankOPeration.checkAccountStatement):accountManager.accountStatement(accountNumber: entry.account.accountNumber) 
                                
                 }
                 
             }
           
         }
         
     }
    
    }
}

protocol RequestProtocol {
    var bankCode: String {get set}
    var branchCode: String {get set}
    func createAccountNumber(serialNumber: String, account: Account) 
    func depositAmount(amount: Int, accountNumber: String)
    func withdrawAmount(amount: Int, accountNumber: String)
    func currentBalance(accountNumber: String)
    func accountDetails(accountNumber: String)
    func accountStatement(accountNumber: String) 
}


class AccountManager {
    var bankCode: String
    var branchCode: String
    var accounts: [AccountManagerProtocol & AccountManagerReceiveProtocol]
    var serialNumberList: [String]
    
    init (bankCode: String, branchCode: String) {
        self.bankCode = bankCode
        self.branchCode = branchCode
        self.accounts = [AccountManagerProtocol & AccountManagerReceiveProtocol]()
        self.serialNumberList = [String]()
    }
    

    func addAccount(account: AccountManagerProtocol & AccountManagerReceiveProtocol) {
        accounts.append(account)
    }
}
    

extension AccountManager: RequestProtocol {
    
    func createAccountNumber(serialNumber: String, account: Account) {
        if (serialNumberList.contains(serialNumber) && serialNumber.length < 8) {
            print("serial number already taken")
        } else {
    
                    var  accountNumber = bankCode + branchCode  + serialNumber

                            while (accountNumber.length != 13) {
                                accountNumber += "0"
                            }
                            
                            account.accountNumber(number: accountNumber)

            serialNumberList.append(serialNumber)
        } 
    }

    func depositAmount(amount: Int, accountNumber: String) {

        for account in  accounts {

            if (account.accountNumber == accountNumber) {

                    account.depositMoney(amount: amount)
            }
        }
    }

   func withdrawAmount(amount: Int, accountNumber: String) {

        for account in  accounts {

            if (account.accountNumber == accountNumber) {

                    account.withdrawMoney(amount: amount)
            }
        }
   }


    func currentBalance(accountNumber: String) {
        
        for account in accounts {

            if(account.accountNumber == accountNumber){

            print(account.currentBalance())
            }
        }
    }

    func accountDetails(accountNumber: String) {
        
        for account in accounts {

            if(account.accountNumber == accountNumber){

            print(account.accountDetails())
            
            }
        }
    }

    func accountStatement(accountNumber: String) {
         
         for account in accounts {

             if (account.accountNumber == accountNumber) {

                 var transactionArray = account.accountStatement()
                 
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
         
 } 



protocol AccountManagerProtocol {
    var accountNumber: String {get set}
    func accountNumber(number: String)
    func depositMoney(amount: Int)
    func withdrawMoney(amount: Int)
}

protocol AccountManagerReceiveProtocol {
    func currentBalance() -> Int 
    func accountDetails() -> String
    func accountStatement() -> [String]
}

class Account: AccountManagerProtocol, AccountManagerReceiveProtocol {
    var accountHolderName: String
    var initialDeposit: Int
    var serialNumber: String
    var accountNumber: String
    var balance: Int
    var accountTransactions: [String]
    var accountHolderContactNumber: String?
    var accountHolderEmailId: String?
    let intrestRate = 1
    
    init (accountHolderName: String, initialDeposit: Int, serialNumber: String) {
        self.accountHolderName =  accountHolderName
        self.initialDeposit = initialDeposit
        self.serialNumber = serialNumber
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

     func depositMoney(amount: Int) {
       balance += amount
        print(amount)
        accountTransactions.append("+" + String(amount))
    }

    func withdrawMoney(amount: Int) {
        balance -= amount
        accountTransactions.append("-" + String(amount))
        print(amount)
    }

     func currentBalance() -> Int {
        balance += initialDeposit
        return balance * (balance * self.intrestRate / 365)
     }

     func accountDetails() -> String {
         let details = "accountHolderName:" + accountHolderName 
         return details 
     }

     func accountStatement() -> [String] {
         return accountTransactions
     }
}

enum casaType: String {
    case currentAccount, savingAccount
}

class CasaAccount: Account {
    let subType: casaType
    let currentIntrestRate = 2 
    let savingIntrestRate = 4
     
     init(accountHolderName: String, initialDeposit: Int, serialNumber: String, subType: casaType) {
         self.subType = subType
     super.init(accountHolderName: accountHolderName, initialDeposit: initialDeposit, serialNumber: serialNumber)
     }
     
     override func currentBalance() -> Int {
        balance += initialDeposit
        
        if (subType == casaType.currentAccount) {
        return balance * (balance * self.currentIntrestRate / 365)
        } else {
            return balance * (balance * self.savingIntrestRate / 365)
        }
        
     }

}

enum depositType: String {
    case fixedDeposit, recurringDeposit
}

class DepositAccount: Account {
    let subType: depositType
    var termOfDeposit: Int
    var fixedIntrestRate = 6 
    var recurringIntrestRate = 4

    init(accountHolderName: String, initialDeposit: Int, serialNumber: String, subType: depositType, termOfDeposit: Int) {
         self.subType = subType
         self.termOfDeposit = termOfDeposit
     super.init(accountHolderName: accountHolderName, initialDeposit: initialDeposit, serialNumber: serialNumber)
     }
     
      override func depositMoney(amount: Int) {
         
         if(subType == depositType.recurringDeposit) {
            balance += amount
            accountTransactions.append("+" + String(amount))
                print(amount)
             } else {
             
                 print("allow initial deposit only")
             } 
        }
     
       override func withdrawMoney(amount: Int) {
     
                print("cannot withdraw amount from deposit account")
        }
        
        override func accountStatement() -> [String] {
        
            if(subType == depositType.recurringDeposit) {
                
                return accountTransactions
                } else { 
                
                return []
                }
        }
        
        override func currentBalance() -> Int {
            balance += initialDeposit
        
            if (subType == depositType.fixedDeposit) {
                return balance + balance * self.fixedIntrestRate * termOfDeposit
            } else {
                return balance + balance * self.recurringIntrestRate * termOfDeposit
            }
        }
}

enum loanType: String {
    case houseLoan, vehicleLoan, personLoan
}

class LoanAccount: Account {
    let subType: loanType
    let houseLoanIntrestRate = 3
    let vehicleLoanIntrestRate = 2
    let personLoanIntrestRate = 5

    init(accountHolderName: String, initialDeposit: Int, serialNumber: String, subType: loanType) {
         self.subType = subType
     super.init(accountHolderName: accountHolderName, initialDeposit: initialDeposit, serialNumber: serialNumber)
     }
     
     override func withdrawMoney(amount: Int) {
     
                print("cannot withdraw amount from loan account")
        }
        
    override func currentBalance() -> Int {
        balance += initialDeposit
        
        if (subType == loanType.houseLoan) {
        return balance * (balance * self.houseLoanIntrestRate / 365)
        } else if (subType == loanType.vehicleLoan) {
            return balance * (balance * self.vehicleLoanIntrestRate / 365)
        } else {
            return balance * (balance * self.personLoanIntrestRate / 365)
        }
        
     }
}


var accountManager1 = AccountManager(bankCode: "AAA", branchCode: "BBB")
var account1 = Account(accountHolderName: "EEE", initialDeposit: 1000, serialNumber: "20")
var account2 = DepositAccount(accountHolderName: "kkk", initialDeposit: 5000, serialNumber: "22", subType: depositType.fixedDeposit, termOfDeposit: 2)
var account3 = LoanAccount(accountHolderName: "SSS", initialDeposit: 3000, serialNumber: "44", subType: loanType.houseLoan)
accountManager1.addAccount(account: account2)
accountManager1.addAccount(account: account1)
accountManager1.addAccount(account: account3)

var initialEntry1 = InitialEntry(account: account1, operation: bankOPeration.openAnAccount, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)
var initialEntry2 = InitialEntry(account: account1, operation: bankOPeration.depositAmount, bankCode: "AAA", branchCode: "BBB", deposit: 300, withdraw: 0 )
var initialEntry3 = InitialEntry(account: account1, operation: bankOPeration.withdrawAmount, bankCode: "AAA", branchCode: "BBB", deposit: 0 , withdraw: 50)
var initialEntry4 = InitialEntry(account: account1, operation: bankOPeration.checkBalance, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)
var initialEntry5 = InitialEntry(account: account1, operation: bankOPeration.checkAccountDetails, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)
var initialEntry6 = InitialEntry(account: account1, operation: bankOPeration.checkAccountStatement, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)
var initialEntry7 = InitialEntry(account: account2, operation: bankOPeration.openAnAccount, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)
var initialEntry8 = InitialEntry(account: account2, operation: bankOPeration.depositAmount, bankCode: "AAA", branchCode: "BBB", deposit: 600, withdraw: 0)
var initialEntry9 = InitialEntry(account: account2, operation: bankOPeration.withdrawAmount, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 40)
var initialEntry10 = InitialEntry(account: account2, operation: bankOPeration.checkBalance, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)
var initialEntry11 = InitialEntry(account: account3, operation: bankOPeration.openAnAccount, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)
var initialEntry12 = InitialEntry(account: account3, operation: bankOPeration.depositAmount, bankCode: "AAA", branchCode: "BBB", deposit: 400, withdraw: 0)
var initialEntry13 = InitialEntry(account: account3, operation: bankOPeration.checkAccountStatement, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)
var initialEntry14 = InitialEntry(account: account1, operation: bankOPeration.depositAmount, bankCode: "AAA", branchCode: "BBB", deposit: 400, withdraw: 0)
var initialEntry15 = InitialEntry(account: account1, operation: bankOPeration.checkAccountStatement, bankCode: "AAA", branchCode: "BBB", deposit: 0, withdraw: 0)



var request1 = Request()

request1.addEntries(entry: initialEntry1)
request1.addEntries(entry: initialEntry2)
request1.addEntries(entry: initialEntry3)
request1.addEntries(entry: initialEntry4)
request1.addEntries(entry: initialEntry5)
request1.addEntries(entry: initialEntry6)
request1.addEntries(entry: initialEntry7)
request1.addEntries(entry: initialEntry8)
request1.addEntries(entry: initialEntry9)
request1.addEntries(entry: initialEntry10)
request1.addEntries(entry: initialEntry11)
request1.addEntries(entry: initialEntry12)
request1.addEntries(entry: initialEntry13)
request1.addEntries(entry: initialEntry14)
request1.addEntries(entry: initialEntry15)


request1.addAccountManager(accountManager: accountManager1)
request1.processRequest()



 
