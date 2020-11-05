import Foundation
class Institution {
    var name: String
    var address: String
    var yearOfEstablishment: Int 
    var totalNumberOfStaff: Int

    init(name: String, address: String, yearOfEstablishment: Int, totalNumberOfStaff: Int) {
        self.name = name
        self.address = address
        self.yearOfEstablishment = yearOfEstablishment
        self.totalNumberOfStaff = totalNumberOfStaff
    }

    func registration() {
        //register the details of each pearson in the institution in different sections
    }
}

class Person {
    var name: String
    var dateOfBirth: String
    var age: Int
    var address: String

    init(name: String, dateOfBirth: String, age: Int, address: String) {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.age = age
        self.address = address
    }

}

class University: Institution {
    var college = [College]()
    var degreesOffered: [String]

        init(name: String, address: String, yearOfEstablishment: Int, totalNumberOfStaff: Int, degreeOffered: [String]) {
        self.degreesOffered = [String]()
        super.init(name: name, address: address, yearOfEstablishment: yearOfEstablishment, totalNumberOfStaff: totalNumberOfStaff)
    }

    func admin (collegeDetails: College) {
        college.append(collegeDetails)
    }


    func conductExam() {
        //university conduct exams
    }
    
    func issueMarkCard() {
        //university issue the markcards
    }

    func issueDegreeCertificate() {
        //university issue the degree certificate
    }
}

class College: Institution {
    var branch = [Branch]()
    var nameOfPrincipal: String
    var feesForEachCourse: [String: Int]

    init(name: String, address: String, yearOfEstablishment: Int, totalNumberOfStaff: Int, nameOfPrincipal: String, feesForEachCourse: [String: Int]) {
        self.nameOfPrincipal = nameOfPrincipal
        self.feesForEachCourse = feesForEachCourse
        super.init(name: name, address: address, yearOfEstablishment: yearOfEstablishment, totalNumberOfStaff: totalNumberOfStaff)
    }

     func admin (branchDetails: Branch) {
        branch.append(branchDetails)
     } 

    func accesToWifi() {
         //decide when to provide the access to wifi.
     }

    func issueIdCards() {
     //issue id card to each student.
     }
}

class Branch {
    var name: String
    var student = [Student]()
    var nameOfHod: String
    var numberOfLabs: Int

    init(name: String, nameOfHod: String, numberOfLabs: Int, eventConducted: [String]) {
        self.name = name
        self.nameOfHod = nameOfHod
        self.numberOfLabs = numberOfLabs
    }

    func admin (studentDetails: Student) {
        student.append(studentDetails)
    }

    func rankingOfTheStudent() {
        //decide the rank of each student
    }

    func makeTimeTable() {
        //make the timetable for each year
    }
}

class Student: Person {
    var currentYear: Int
    var mark = [Mark]()
    var totalFeesPaied: Int
    var idNumber: Int
    

    init(name: String, dateOfBirth: String, age: Int, address: String, currentYear: Int, totalFeesPaied: Int, idNumber: Int) {
         self.currentYear = currentYear
         self.totalFeesPaied = totalFeesPaied 
         self.idNumber = idNumber
         super.init(name: name, dateOfBirth: dateOfBirth, age: age, address: address)
              
    }

    func admin (markDetails: Mark) {
        mark.append(markDetails)
    }

    func cgpa(optainedMark: [String: Int], availableMark: [String: Int]) -> Double {
        var cgpa: Double = 0.0
        var totalMark = 0
        var maxMark = 0
        var percentage: Double = 0.0

        for (key1,value1) in optainedMark.enumerated(){
             
             totalMark += value1.value
        }

        for (key2,value2) in availableMark.enumerated(){

            maxMark += value2.value
        }

        percentage = (Double(totalMark) / Double(maxMark)) * 100
        cgpa = percentage / 9.5
        return cgpa
    }
    
                   
}

class Mark {
    var markPerSubject: [String: Int]
    var maximumMark: [String: Int]

    init(markPerSubject: [String: Int], maximumMark: [String: Int]) {
        self.markPerSubject = markPerSubject
        self.maximumMark = maximumMark
    }
 } 

 var mark1 = Mark(markPerSubject: ["A": 30, "B": 34], maximumMark: ["A": 50, "B": 50])
 var mark2 = Mark(markPerSubject: ["C": 32, "D": 44], maximumMark: ["C": 50, "D": 50])
 var mark3 = Mark(markPerSubject: ["A": 35, "B": 22], maximumMark: ["A": 50, "B": 50])
 var mark4 = Mark(markPerSubject: ["X": 42, "Y": 40], maximumMark: ["X": 50, "Y": 50])
 var mark5 = Mark(markPerSubject: ["X": 43, "Y": 45], maximumMark: ["X": 50, "Y": 50])
 var mark6 = Mark(markPerSubject: ["S": 35, "Z": 22], maximumMark: ["S": 50, "Z": 50])

 var student1 = Student(name: "jack", dateOfBirth: "11 aug 1998", age: 22, address: "AAA", currentYear: 3, totalFeesPaied: 60000, idNumber: 1111)
 var student2 = Student(name: "rose", dateOfBirth: "7 oct 1997", age: 23, address: "BBB", currentYear: 4, totalFeesPaied: 50000, idNumber: 2222)
 var student3 = Student(name: "joy", dateOfBirth: "1 jan 1998", age: 22, address: "CCC", currentYear: 3, totalFeesPaied: 60000, idNumber: 3333)
 var student4 = Student(name: "james", dateOfBirth: "5 nov 1999", age: 21, address: "DDD", currentYear: 2, totalFeesPaied: 70000, idNumber: 4444)
 var student5 = Student(name: "lilly", dateOfBirth: "4 jan 1999", age: 21, address: "EEE", currentYear: 2, totalFeesPaied: 70000, idNumber: 5555)
 var student6 = Student(name: "marry", dateOfBirth: "23 feb 1997", age: 23, address: "DDD", currentYear: 4, totalFeesPaied: 52000, idNumber: 6666)

 var branch1 = Branch(name: "EC", nameOfHod: "Steve", numberOfLabs: 6, eventConducted: ["ABC", "EFG"])
 var branch2 = Branch(name: "CS", nameOfHod: "Krishna", numberOfLabs: 8, eventConducted: ["JKL", "MNO"])

 var college1 = College(name: "ABCABC", address: "NNN", yearOfEstablishment: 2014, totalNumberOfStaff: 100, nameOfPrincipal: "Raghu", feesForEachCourse: ["MBA": 100000, "BE": 80000])
 var college2 = College(name: "DEFDEF", address: "MMM", yearOfEstablishment: 1999, totalNumberOfStaff: 150, nameOfPrincipal: "Kiran", feesForEachCourse: ["MBA": 150000, "BE": 100000])

 var university = University(name: "SAP", address: "ZZZ", yearOfEstablishment: 1960, totalNumberOfStaff: 200, degreeOffered: ["MBA","BE"])
 
 university.admin(collegeDetails: college1)
 university.admin(collegeDetails: college2)

 college1.admin(branchDetails: branch1)
 college1.admin(branchDetails: branch2)
 college2.admin(branchDetails: branch1)
 college2.admin(branchDetails: branch2)

 branch1.admin(studentDetails: student1)
 branch1.admin(studentDetails: student2)
 branch1.admin(studentDetails: student3)
 branch2.admin(studentDetails: student4)
 branch2.admin(studentDetails: student5)
 branch2.admin(studentDetails: student6)

 student1.admin(markDetails: mark1)
 student2.admin(markDetails: mark2)
 student3.admin(markDetails: mark3)
 student4.admin(markDetails: mark4)
 student5.admin(markDetails: mark5)
 student6.admin(markDetails: mark6)

 print(student1.cgpa(optainedMark: mark1.markPerSubject, availableMark: mark1.maximumMark))