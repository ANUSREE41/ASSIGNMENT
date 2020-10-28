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

    for (index, value) in array.enumerated() {
        for (key, subValue) in value {
                resultArray.append(subValue)
        }
    }
    print(resultArray)
}

dictionaryToArray (array:arrrayOfDictionary)