import Foundation
func rightJustify(source: String) -> String {
     let spaceLength = 70 - source.length
     var space = ""

     for i in (1...spaceLength) {
         space += " "
     }
    return space + source
}

print(rightJustify(source: "anusree"))
