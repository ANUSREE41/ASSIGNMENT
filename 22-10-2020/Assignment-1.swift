import Foundation
 var integerArray: [Int] = [1, 6, 4, 8, 9, 3, 2]
 var resultArray = [Int]() 


 var sortOperation = {
     (value1: Int, value2: Int) -> Bool in
     
      return value1 < value2
 }
 
 var evenOperator = {
     (value1: Int) -> Bool in

          return value1 % 2 == 0
 }

func squeredEvenArray (numberArray: [Int]) -> [Int] {
    var reversedNames = numberArray.sorted(by:sortOperation)
        for value in reversedNames {
            if evenOperator(value) {
                resultArray.append(value * value)
            }
        }
    return (resultArray)
} 

print (squeredEvenArray(numberArray: integerArray)) 
