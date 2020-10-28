import Foundation
import Foundation
let initialDictionary = [
    "ABC001": [
        "Name": "ABC",
        "Age": 20,
        "Branch": "ECE",
        "Marks": [
            "Physics": 30,
            "Chemistry": 40,
            "Maths": 50
             ]
        ],
    "ABC002": [
        "Name": "DEF",
        "Age": 21,
        "Branch": "CS",
        "Marks": [
            "Physics": 31,
            "Chemistry": 41,
            "Maths": 51
            ]
        ],
    "ABC003": [
        "Name": "GHI",
        "Age": 22,
        "Branch": "ISE",
        "Marks": [
            "Physics": 32,
            "Chemistry": 42,
            "Maths": 52
             ]
        ]
]

let requiredKey = "ABC001:Marks:Maths"
let keyArray = requiredKey.components(separatedBy: ":")
var dictionary: [String: Any] = initialDictionary
var result: Any?
var isFound: Bool = true

for (index, key) in keyArray.enumerated() {
    
    if let temp = dictionary[key] as? [String: Any] {
        dictionary = temp
    } else {
        if(index == keyArray.count - 1 && dictionary.keys.contains(key)) {
            if let temp = dictionary[key] {
                result = temp
            }
        } else {
            isFound = false
            break
        }
    }
}
 
 if let result = result {
     print (result)
 }
