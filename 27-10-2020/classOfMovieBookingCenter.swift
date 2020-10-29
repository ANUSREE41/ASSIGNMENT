import Foundation
 class MovieBookingCounter {
     var category: String
     let name: String
     var numberOfSeat: Int
     let price: Int

 init(category: String, name: String, numberOfSeat: Int, price: Int) {
      self.category = category
      self.name = name
      self.numberOfSeat = numberOfSeat
      self.price = price
 }
  
func nonHorror(movie: String) -> Bool {

    if (movie != "horror") {
        return true

    }
    return false
}
}

 let seat =  MovieBookingCounter(category: "humar", name: "DEF", numberOfSeat: 5, price: 500)
