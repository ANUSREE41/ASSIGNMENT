import Foundation
 class Car {
     var company: String
     var model: String
     var seatCapacity: Int
     var fuelType: String
     var price: Int

 init(company: String, model: String, seatCapacity: Int, fuelType: String, price: Int) {

      self.company = company
      self.model = model
      self.seatCapacity = seatCapacity
      self.fuelType = fuelType
      self.price = price
 }
  
func isAffortable(price: Int) -> Bool {

    if (price < 1000000){
        return true

    }
    return false
}

func requireFiveSeat(seat: Int) -> Bool {

    if (seat == 5){
        return true
    }
    return false
}
}

 let car1 = Car (company: "ABC", model: "AAA", seatCapacity: 5, fuelType: "petrol", price: 600000)
