import Foundation
func bottlePresent(indexedValue: Int) -> String{
    var nonZeroString = """
                    \(100 - indexedValue) bottles of water on the wall,
                    \(100 - indexedValue) bottles of water,
                    ya’ take one down, ya’ pass it around,
                    """
    return nonZeroString 
 }

 func bottleAbsent() -> String {
     let zeroString = """
                        No bottles of water on the wall,
                        no bottles of water,
                        ya’ can’t take one down, ya’ can’t pass it around,
                        ’cause there are no more bottles of water on the wall!
                        """
    return zeroString
 }

for index in 1...101 {
    var condition = 100 - index

    if condition != 0 {
    print(bottlePresent(indexedValue: index))
    }

    else if condition == 0 {
        print(bottleAbsent())
    }

}