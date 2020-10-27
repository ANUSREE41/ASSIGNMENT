import Foundation

var arrrayOfDictionary = [
    [
        "name": "ABC",
        "age": 20,
        "Branch": "ECE"
    ],
    ["name": "CDE",
        "age": 22,
        "Branch": "CSE"
    ],
    ["name": "EFG",
        "age": 21,
        "Branch": "CSE"
    ]
] 
func dictionaryToArray (array: [[String:Any]]) {
var resultArray = [Any]()

    for i in array {
    resultArray.append(i["name"])
    resultArray.append(i["age"])
    resultArray.append(i["Branch"])
    }
print(resultArray)
}
dictionaryToArray (array:arrrayOfDictionary)
