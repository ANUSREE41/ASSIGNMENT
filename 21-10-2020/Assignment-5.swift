import Foundation
func power (integerValue: Int, powerValue: Int) -> Int {
    var result = integerValue

    if powerValue == 0 {
        return 1
    }

    else {
    result *= power (integerValue: integerValue, powerValue: powerValue-1)
    return result   
    }
}
print (power(integerValue: 7, powerValue: 2))