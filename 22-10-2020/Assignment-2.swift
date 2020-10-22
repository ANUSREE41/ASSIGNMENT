import Foundation
var rightJustify = {
    (source: String) -> String in 

    var space: String = ""

     for i in (1...(70 - source.length)) {
         space.append(" ")
     }
    return space + source
}

print(rightJustify("anusree"))