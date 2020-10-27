import Foundation
var result = 0
let givenArray = [[3,5,8], [4,2], [5,6,8]]

func mainFunction(array: [[Int]]) -> Int {

    for (index,value) in array.enumerated() {
    
        var temp = sumOfArray(array1: value, count: value.count)
        result += temp
    }

    return result
}


func sumOfArray(array1: [Int], count: Int) -> Int {

    if (count <= 0) {
        return 0
    }

    return (sumOfArray(array1: array1, count: count - 1) + array1[count - 1])
}


print(mainFunction(array: givenArray))

