import Foundation
func oddSum(oddNumber: Int) -> Int {
    var sum = oddNumber

    if oddNumber > 1 
    {
         sum += oddSum(oddNumber: oddNumber-2) 
    }
    return sum
   
}
print(oddSum(oddNumber: 7))
