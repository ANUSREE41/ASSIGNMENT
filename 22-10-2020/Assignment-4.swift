import Foundation
let  bottle: String = "bottles of water"

var bottlePresent = {
    (requiredValue: Int, indexedValue: Int) -> String in
    var nonZeroString = """
                    \(requiredValue - indexedValue) \(bottle) on the wall,
                    \(requiredValue - indexedValue)\(bottle),
                    ya’ take one down, ya’ pass it around,
                    """
    return nonZeroString 
 }

 func breakDown(requiredValue: Int) {

    for index in 1...(requiredValue+1) {
    var condition = requiredValue - index

        if condition != 0 {
        print(bottlePresent(requiredValue, index))
        }

        else if condition == 0 {
        print("""
                 No \(bottle) on the wall,
                 no \(bottle),
                 ya’ can’t take one down, ya’ can’t pass it around,
                 ’cause there are no more \(bottle) on the wall!
                """)
        }
     }
 }
 
 breakDown(requiredValue: 100)