import Foundation
 class RestaurantMenu {
     var category: String
     var type: String
     let name: String
     var quantity: Int
     let price: Int

 init(category: String, type: String, name: String, quantity: Int, price: Int) {
      self.category = category
      self.name = name
      self.type = type
      self.quantity = quantity
      self.price = price
 }
  
func isAffortable(price: Int) -> Bool {

    if (price < 500) {
        return true

    }
    return false
}

func isSpicy(item: String) -> Bool {

    if (item == "spicy") {
        return true
    }
    return false
}
}

 let menu = RestaurantMenu (category: "starters", type: "spicy", name: "ABC", quantity: 2, price: 150)