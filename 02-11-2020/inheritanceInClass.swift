import Foundation
import Foundation
class Collage {
    var name: String
    var branch: String
    var idNumber: Int
    var yearOfJoining: Int
    var dateOfBirth: String
    var address: String

    init(name: String, branch: String, idNumber: Int, yearOfJoining: Int, dateOfBirth: String, address: String) {
        self.name = name
        self.branch = branch
        self.idNumber = idNumber
        self.yearOfJoining = yearOfJoining
        self.dateOfBirth = dateOfBirth
        self.address = address
    }

     
     func accesToWifi() {
         //some code
     }

     func issueLibraryBooks() {
      //some code
     }

     func issueIdCards() {
     //some code
     }
}


class Students: Collage {
    var currentYear: Int
    var totalFeesPaied: Int

    init(name: String, branch: String, idNumber: Int, yearOfJoining: Int, dateOfBirth: String, address: String, currentYear: Int, totalFeesPaied: Int) {
        self.name = name
        self.branch = branch
        self.idNumber = idNumber
        self.yearOfJoining = yearOfJoining
        self.dateOfBirth = dateOfBirth
        self.address = address
        self.currentYear = currentYear
        self.totalFeesPaied = totalFeesPaied
    }

    func eligibleForScholarship() {
        //some code
    }

    func requireHostelFacility() {
        //some code
    }

    func feesToBePaied() {
        //some code
    }
}

class Lectures: Collage {
    var qualification: String
    var designation: String 
    var monthlySalary: Int 

    init(name: String, branch: String, idNumber: Int, yearOfJoining: Int, dateOfBirth: String, address: String, qualification: String, designation: String, monthlySalary: Int) {
        self.name = name
        self.branch = branch
        self.idNumber = idNumber
        self.yearOfJoining = yearOfJoining
        self.dateOfBirth = dateOfBirth
        self.address = address
        self.qualification = qualification
        self.designation = designation
        self.monthlySalary = monthlySalary
    }

    func numberOfSubjectTaken() {
        //some code
    }

    func numberOfLeaveTaken() {
        //some code
    }

}

class Branch: Students {
    var markOptained: Int 
    var attendance: Int
    var numberOfArrears: Int 

    init(name: String, branch: String, idNumber: Int, yearOfJoining: Int, dateOfBirth: String, address: String, currentYear: Int, totalFeesPaied: Int, markOptained: Int, attendance: Int, numberOfArrears: Int) {
        self.name = name
        self.branch = branch
        self.idNumber = idNumber
        self.yearOfJoining = yearOfJoining
        self.dateOfBirth = dateOfBirth
        self.address = address
        self.currentYear = currentYear
        self.totalFeesPaied = totalFeesPaied
        self.markOptained = markOptained
        self.attendance = attendance
        self.numberOfArrears = numberOfArrears
    }

    func rankingOfTheStudent() {
        //some code
    }

    func eligibleForNextYear() {
        //some code
    }

    func fineToBePaied() {
        //some code
    }

}


var person = Collage(name: "AbC", branch: "CS", idNumber: 1234, yearOfJoining: 2016, dateOfBirth: "01 JAN 1998", address: "XYZ")
var student1 = Students(name: "DEF", branch: "EC", idNumber: 5678, yearOfJoining: 2015, dateOfBirth: "05 OCT 1997", address: "TYF", currentYear: 2, totalFeesPaied: 80000)
var lecture = Lectures(name: "PQR", branch: "CS", idNumber: 6234, yearOfJoining: 2016, dateOfBirth: "01 FEB 1989", address: "IJK", qualification: "M TECH", designation: "HOD", monthlySalary: 60000)
var student2 = Branch(name: "SDC", branch: "ME", idNumber: 5978, yearOfJoining: 2016, dateOfBirth: "05 NOV 1997", address: "KHF", currentYear: 2, totalFeesPaied: 80000, markOptained: 962, attendance: 85, numberOfArrears: 0 ) 