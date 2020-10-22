import Foundation
var power = {
    (integerValue: Int, powerValue: Int) -> Int in
    var result = 1

    if (powerValue == 0){
    return 1
    }

    else{
        for i in 1...powerValue {
        result *= integerValue
        }
     return result
    }
}
print(power(3,4))
