import Foundation
var oddSum = 0

var oddNumber = {
    (number: Int) -> Bool in 
        if number % 2 != 0 {
        return true
        }
    return false
}

func sumOfIntegers(highestValue: Int, requiredValue: ((Int) -> Bool)) -> Int {
    for i in 1...highestValue {
        if requiredValue (i) {
          oddSum += i
        }
     }
     return oddSum
 }

 print (sumOfIntegers(highestValue: 3, requiredValue:oddNumber))