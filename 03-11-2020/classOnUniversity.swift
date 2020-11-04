import Foundation
class Institution {
    var name: String
    var address: String
    var yearOfEstablishment: Int 
    var totalNumberOfStaff: Int

    init() {
        name = " "
        address = " "
        yearOfEstablishment = 0
        totalNumberOfStaff = 0
    }

    func registration() {
        //register the details of each pearson in the institution in different sections
    }
}

class Person {
    var nameOfPerson: String
    var dateOfBirth: String
    var gender: String
    var age: Int
    var addressOfPerson: String

    init() {
        nameOfPerson = " "
        dateOfBirth = " "
        gender = " "
        age = 0
        addressOfPerson = " "
    }

}

class University: Institution {
    var numberOfCollege: Int 
    var degreesOffered: [String]

    override init() {
        numberOfCollege = 0
        degreesOffered = [String]()
        super.init()
        name = " "
        address = " "
        yearOfEstablishment = 0
        totalNumberOfStaff = 0
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
    var numberOfBranches: Int
    var nameOfPrincipal: String
    var feesForEachCourse: [String: Int]

    override init() {
        numberOfBranches = 0
        nameOfPrincipal = " "
        feesForEachCourse = [String: Int]()
        super.init()
        name = " "
        address = " "
        yearOfEstablishment = 0
        totalNumberOfStaff = 0
    }

    func accesToWifi() {
         //decide when to provide the access to wifi.
     }

    func issueIdCards() {
     //issue id card to each student.
     }
}

class Library {
    var numberOfBooks: Int
    var newspaperAvailable: [String]
    let authorOfEachBook: [String: String]
    
    init() {
        numberOfBooks = 0
        newspaperAvailable = [String]()
        authorOfEachBook = [String: String]()
    }

    func issueLibraryBooks() {
      //issue library books
     }

     func fineToBePaied() {
        //check for fine
    }
}

class Branch {
    var nameOfHod: String
    var numberOfLabs: Int
    var eventConducted: [String]

    init() {
        nameOfHod = " "
        numberOfLabs = 0
        eventConducted = [String]()
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
    var totalFeesPaied: Int
    var totalMarkOPtained: Int 
    var attendance: Int
    var idNumber: Int

    override init() {
         currentYear = 0
         totalFeesPaied = 0
         totalMarkOPtained = 0 
         attendance = 0
         idNumber = 0
         super.init()
         nameOfPerson = " "
         dateOfBirth = " "
         gender = " "
         age = 0
         addressOfPerson = " "
    }

    func eligibleForScholarship() {
        //check whether the student is eligible for scholaship
    }

    func requireHostelFacility() {
        //check whether the student require hostal facility
    }

    func feesToBePaied() {
        //check pending amount of fees to be paied
    }
}

class Lecturer: Person{
    var qualification: String
    var designation: String 
    var monthlySalary: Int 

    override init() {
        qualification = " "
        designation = " "
        monthlySalary = 0
        super.init()
        nameOfPerson = " "
        dateOfBirth = " "
        gender = " "
        age = 0
        addressOfPerson = " "
    }

    func numberOfSubjectTaken() {
        //number of subject taken by each lecturer
    }

    func numberOfLeaveTaken() {
        //number of leave taken by each lecturer
    }
}

var university1 = University()
var college1 = College()
var student1 = Student()
var lecturer1 = Lecturer()
student1.nameOfPerson = "xyz"
lecturer1.gender = "male"
college1.name = "ABC"
