import Foundation

class AccountManager {
    var bankCode: String
    var branchCode: String
    var accounts: [AccountManagerProtocol & AccountManagerReceiveProtocol & Account]
    var serialNumberList: [String]

    init (bankCode: String, branchCode: String) {
        self.bankCode = bankCode
        self.branchCode = branchCode
        self.accounts = [AccountManagerProtocol & AccountManagerReceiveProtocol & Account]()
        self.serialNumberList = [String]()
    }

    func addAccount(account: AccountManagerProtocol & AccountManagerReceiveProtocol & Account) {
        accounts.append(account)
    }

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

                if (account.type == accountType.currentAccount || account.type == accountType.savingAccount || account.type == accountType.recurring || account.type == accountType.houseLoan || account.type == accountType.vehicleLoan || account.type == accountType.personLoan) {
                    account.depositMoney(amount: amount)
                } else {
                 print("this account is not of deposit type")
                 
                }
            }
        }
    }

   func withdrawAmount(amount: Int, accountNumber: String) {

        for account in  accounts {

            if (account.accountNumber == accountNumber) {

                if (account.type == accountType.currentAccount || account.type == accountType.savingAccount) {
                    account.withdrawMoney(amount: amount)
                } else {
                 print("this account is not of withdraw type")
                 
                }
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

              if (account.type == accountType.currentAccount || account.type == accountType.savingAccount || account.type == accountType.houseLoan || account.type == accountType.vehicleLoan || account.type == accountType.personLoan || account.type == accountType.recurring) {

                 print(account.accountStatement())
              } else {
                  print("cannot print account statement")
                  
              }

             }
         }
    }

} 

protocol AccountManagerProtocol {
    func accountNumber(number: String)
    func depositMoney(amount: Int)
    func withdrawMoney(amount: Int)
}

protocol AccountManagerReceiveProtocol {
    func currentBalance() -> Int 
    func accountDetails() -> String
    func accountStatement() -> [String]
}

enum accountType: String {
    case currentAccount, savingAccount, fixed, recurring, houseLoan, vehicleLoan, personLoan 
}

class Account {
    var accountHolderName: String
    var initialDeposit: Int
    var accountNumber: String
    var balance: Int
    var type: accountType
    var accountTransactions: [String]
    var deposit: Int
    var withdraw: Int
    var accountHolderContactNumber: String?
    var accountHolderEmailId: String?
    
    init (accountHolderName: String, initialDeposit: Int, type: accountType) {
        self.accountHolderName =  accountHolderName
        self.initialDeposit = initialDeposit
        self.accountNumber = " "
        self.balance = 0
        self.type = type
        self.accountTransactions = [String]()
        self.deposit = 0
        self.withdraw = 0
        self.accountHolderContactNumber = " "
        self.accountHolderEmailId = " "
    }
}

extension Account: AccountManagerProtocol {

    func accountNumber(number: String) {

        accountNumber = number
        print(accountNumber)
        
     }

     func depositMoney(amount: Int) {
       print(amount)
       deposit = amount
       accountTransactions.append("+" + String(amount))

    }

    func withdrawMoney(amount: Int) {
        print(amount)
        withdraw = amount
        accountTransactions.append("-" + String(amount))

    }
}

extension Account: AccountManagerReceiveProtocol {

     func currentBalance() -> Int {
        balance += initialDeposit
        return balance + deposit - withdraw
     }

     func accountDetails() -> String {
         var details = "accountHolderName:" + accountHolderName + " and accountType:" + type.rawValue
         return details 
     }

     func accountStatement() -> [String] {
         return accountTransactions
     }
}


var accountManager1 = AccountManager(bankCode: "AAA", branchCode: "BBB")
var account1 = Account(accountHolderName: "EEE", initialDeposit: 1000, type: accountType.savingAccount)
var account2 = Account(accountHolderName: "kkk", initialDeposit: 1050, type: accountType.currentAccount) 
accountManager1.addAccount(account: account2)
accountManager1.addAccount(account: account1)
accountManager1.createAccountNumber(serialNumber: "20", account: account1)
accountManager1.createAccountNumber(serialNumber: "21", account: account1)
accountManager1.depositAmount(amount: 2000, accountNumber: account1.accountNumber)
accountManager1.withdrawAmount(amount: 500, accountNumber: account1.accountNumber)
accountManager1.currentBalance(accountNumber: account1.accountNumber)
accountManager1.accountDetails(accountNumber: account1.accountNumber)
accountManager1.accountStatement(accountNumber: account1.accountNumber)