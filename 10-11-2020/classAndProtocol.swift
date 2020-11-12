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

protocol UniversityProtocol {
    func receiveTimeTable(timetable:[String:String])
    func receiveSyllabusDetails(syllabus:[String:String])
}

protocol UniversityReceiveProtocol {
    func receiveBranchList()
}

protocol CollegeProtocol {
    func receiveAvailableSeat(seat: [String: Int])
    func receiveFund(amount: [String: Int])
}

protocol CollegeRecieveProtocol {
    func receiveNumberOfLabs()
}

protocol BranchProtocol {
    func myRank(rank: [String: Int])
    func myAttendance(attendance: [String: Int])
}

protocol BranchReceiveProocol {
    func receiveAssignments()
    func receiveProjectReport()
}

class University: Institution {
    var colleges: [UniversityProtocol]
    var degreesOffered: [String]

        init(name: String, address: String, yearOfEstablishment: Int, totalNumberOfStaff: Int, degreeOffered: [String]) {
        self.colleges = [UniversityProtocol]()
        self.degreesOffered = [String]()
        super.init(name: name, address: address, yearOfEstablishment: yearOfEstablishment, totalNumberOfStaff: totalNumberOfStaff)
    }

    func addCollege (collegeDetails: UniversityProtocol) {
        colleges.append(collegeDetails)
    }


    func sendTimeTable(timeTable: [String: String]) {
        //university send timetable
        //colleges.receiveTimeTable(timetable: timeTable)
    }
    
    func sendSyllabusDetails(syllabus: [String: String]) {
        //university send the syllabus details
        //colleges.receiveSyllabusDetails(syllabus: syllabus)
    }

    func receiveBranchList(branch: [String: [String]]){
        //details of each student 
    }

    func issueDegreeCertificate() {
        //university issue the degree certificate
    }
}

class College: Institution, UniversityProtocol, UniversityReceiveProtocol  {
    var branches: [CollegeProtocol]
    var nameOfPrincipal: String
    var feesForEachCourse: [String: Int]
    weak var university: University?

    init(name: String, address: String, yearOfEstablishment: Int, totalNumberOfStaff: Int, nameOfPrincipal: String, feesForEachCourse: [String: Int]) {
        self.branches = [CollegeProtocol]()
        self.nameOfPrincipal = nameOfPrincipal
        self.feesForEachCourse = feesForEachCourse
        super.init(name: name, address: address, yearOfEstablishment: yearOfEstablishment, totalNumberOfStaff: totalNumberOfStaff)
    }

     func addBranch (branchDetails: CollegeProtocol) {
        branches.append(branchDetails)
     } 

    func receiveTimeTable(timetable:[String:String]) {
        //receive timetable from university
    } 

    func receiveSyllabusDetails(syllabus:[String:String]) {
        //receive syllabus details from university
    }

    func sendAvailableSeat(seatAvailable: [String: Int]) {
        //total number of seat available for each branch
        //branches.receiveAvailableSeat(seat: seatAvailable)) 
    }

    func sendFund(fund: [String: Int]) {
        //fund allocated for each branch
        //branches.receiveFund(amount: fund)
    }

    func receiveBranchList() {
        //declare function in the protocol
    }

    func sendBranchList(list: [String: [String]]) {
        //university?.receiveBranchDetail(detail: list)
    }

    func receiveNumberOfLabs(count: [String: Int]) {
        //labs per branch
    }

    func accesToWifi() {
         //decide when to provide the access to wifi.
     }

    func issueIdCards() {
     //issue id card to each student.
     }
}

class Branch: CollegeProtocol, CollegeRecieveProtocol {
    var name: String
    var students: [BranchProtocol]
    var nameOfHod: String
    var numberOfLabs: Int
    weak var college: College?

    init(name: String, nameOfHod: String, numberOfLabs: Int, eventConducted: [String]) {
        self.students = [BranchProtocol]()
        self.name = name
        self.nameOfHod = nameOfHod
        self.numberOfLabs = numberOfLabs
    }

    func addStudent (studentDetails: BranchProtocol) {
        students.append(studentDetails)
    }

    func receiveAvailableSeat(seat: [String: Int]) {
    //available seat
    }

    func receiveFund(amount: [String: Int]) {
        //available fund from collage
    }

    func rankingOfTheStudent() {
        //decide the rank of each student
        //students.myRank(rank: [String: Int])
    }

    func attendanceOfTheStudent(){
        //attendance of each student
        //students.myAttendance(attendance: someparameter)
    
    }

    func receiveNumberOfLabs() {
        //declare protocol function
    }

    func numberOfLabsPerBranch() {
        //college?.receiveNumberOfBranch(count: someparameters)
    }

    func receiveAssignments(assignmnt: String) {
        //branch receive assignmnts from the student
    }

    func receiveProjectReport(report: String) {
        //branch receive project reports from the student
    }

}

class Student: Person, BranchProtocol, BranchReceiveProocol {
    var currentYear: Int
    var marks = [Mark]()
    var totalFeesPaied: Int
    var idNumber: Int
    weak var branch: Branch?
    

    init(name: String, dateOfBirth: String, age: Int, address: String, currentYear: Int, totalFeesPaied: Int, idNumber: Int) {
         self.currentYear = currentYear
         self.totalFeesPaied = totalFeesPaied 
         self.idNumber = idNumber
         super.init(name: name, dateOfBirth: dateOfBirth, age: age, address: address)
              
    }

    func addMark (markDetails: Mark) {
        marks.append(markDetails)
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

    func myRank(rank: [String: Int]) {
        //rank of each student
    }

    func myAttendance(attendance: [String: Int]) {
        //attendance of each student
    }

    func receiveAssignments() {
        //declare protocol function
    }

    func receiveProjectReport() {
        //declare protocol function
    }

    func submitAssignments(assignment: String) {
        //branch?.receiveAssignments(assignment: assignment)
    }

    func submitProjectReport(report: String) {
        //branch?.receiveProjectReport(report: report)
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
 var student6 = Student(name: "marry", dateOfBirth: "23 feb 1997", age: 23, address: "FFF", currentYear: 4, totalFeesPaied: 52000, idNumber: 6666)

 var branch1 = Branch(name: "EC", nameOfHod: "Steve", numberOfLabs: 6, eventConducted: ["ABC", "EFG"])
 var branch2 = Branch(name: "CS", nameOfHod: "Krishna", numberOfLabs: 8, eventConducted: ["JKL", "MNO"])

 var college1 = College(name: "ABCABC", address: "NNN", yearOfEstablishment: 2014, totalNumberOfStaff: 100, nameOfPrincipal: "Raghu", feesForEachCourse: ["MBA": 100000, "BE": 80000])
 var college2 = College(name: "DEFDEF", address: "MMM", yearOfEstablishment: 1999, totalNumberOfStaff: 150, nameOfPrincipal: "Kiran", feesForEachCourse: ["MBA": 150000, "BE": 100000])

 var university = University(name: "SAP", address: "ZZZ", yearOfEstablishment: 1960, totalNumberOfStaff: 200, degreeOffered: ["MBA","BE"])
 
 university.addCollege(collegeDetails: college1)
 university.addCollege(collegeDetails: college2)

 college1.addBranch(branchDetails: branch1)
 college1.addBranch(branchDetails: branch2)
 

 branch1.addStudent(studentDetails: student1)
 branch1.addStudent(studentDetails: student2)
 branch1.addStudent(studentDetails: student3)
 branch2.addStudent(studentDetails: student4)
 branch2.addStudent(studentDetails: student5)
 branch2.addStudent(studentDetails: student6)

 student1.addMark(markDetails: mark1)
 student2.addMark(markDetails: mark2)
 student3.addMark(markDetails: mark3)
 student4.addMark(markDetails: mark4)
 student5.addMark(markDetails: mark5)
 student6.addMark(markDetails: mark6)

 var mark7 = Mark(markPerSubject: ["A": 39, "B": 30], maximumMark: ["A": 50, "B": 50])
 var mark8 = Mark(markPerSubject: ["C": 43, "D": 40], maximumMark: ["C": 50, "D": 50])
 var mark9 = Mark(markPerSubject: ["A": 50, "B": 45], maximumMark: ["A": 50, "B": 50])
 var mark10 = Mark(markPerSubject: ["X": 47, "Y": 49], maximumMark: ["X": 50, "Y": 50])
 var mark11 = Mark(markPerSubject: ["X": 23, "Y": 31], maximumMark: ["X": 50, "Y": 50])
 var mark12 = Mark(markPerSubject: ["S": 43, "Z": 34], maximumMark: ["S": 50, "Z": 50])

 var student7 = Student(name: "jerry", dateOfBirth: "16 mar 1998", age: 22, address: "GGG", currentYear: 3, totalFeesPaied: 62000, idNumber: 7777)
 var student8 = Student(name: "hima", dateOfBirth: "12 dec 1997", age: 23, address: "HHH", currentYear: 4, totalFeesPaied: 59000, idNumber: 8888)
 var student9 = Student(name: "luxy", dateOfBirth: "5 nov 1998", age: 22, address: "III", currentYear: 3, totalFeesPaied: 62000, idNumber: 9999)
 var student10 = Student(name: "riya", dateOfBirth: "16 nov 1999", age: 21, address: "JJJ", currentYear: 2, totalFeesPaied: 75000, idNumber: 1010)
 var student11 = Student(name: "rohith", dateOfBirth: "23 jan 1999", age: 21, address: "KKK", currentYear: 2, totalFeesPaied: 75000, idNumber: 1212)
 var student12 = Student(name: "meera", dateOfBirth: "11 oct 1997", age: 23, address: "LLL", currentYear: 4, totalFeesPaied: 59000, idNumber: 1313)

 var branch3 = Branch(name: "EC", nameOfHod: "Leya", numberOfLabs: 7, eventConducted: ["XYZ", "KLO"])
 var branch4 = Branch(name: "CS", nameOfHod: "Vishnu", numberOfLabs: 7, eventConducted: ["UVL", "PQR"])

 college2.addBranch(branchDetails: branch3)
 college2.addBranch(branchDetails: branch4)

 branch3.addStudent(studentDetails: student7)
 branch3.addStudent(studentDetails: student8)
 branch3.addStudent(studentDetails: student9)
 branch4.addStudent(studentDetails: student10)
 branch4.addStudent(studentDetails: student11)
 branch4.addStudent(studentDetails: student12)

 student7.addMark(markDetails: mark7)
 student8.addMark(markDetails: mark8)
 student9.addMark(markDetails: mark9)
 student10.addMark(markDetails: mark10)
 student11.addMark(markDetails: mark11)
 student12.addMark(markDetails: mark12)

 print(student1.cgpa(optainedMark: mark1.markPerSubject, availableMark: mark1.maximumMark))