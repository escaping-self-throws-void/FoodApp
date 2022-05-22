//
//  File.swift
//  FoodApp
//
//  Created by Paul Matar on 21/05/2022.
//

import SwiftUI

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var ingredients: String
    var size: String
    var price: String
    var image: String
}

struct Tab: Identifiable {
    
    var id = UUID().uuidString
    var tab: String
    var foods: [Food]
}

var foods = [
    Food(title: "Classic Pizza", ingredients: "Mozarella, tomato, ham", size: "200 gr, 33cm", price: "10 USD", image: "pizza"),
    Food(title: "Pepperoni Pizza", ingredients: "Mozarella, tomato, pepperoni", size: "180 gr, 33cm", price: "12 USD", image: "pizza2"),
    Food(title: "Four Cheese Pizza", ingredients: "Mozarella, tomato, parmesan cheeese", size: "220 gr, 33cm", price: "12 USD", image: "pizza3"),
    Food(title: "Mashroom Pizza", ingredients: "Mozarella, tomato, mashrooms", size: "200 gr, 33cm", price: "15 USD", image: "pizza4"),
    Food(title: "Toscana Pizza", ingredients: "Onions, mozarella, tomato, ham", size: "190 gr, 33cm", price: "10 USD", image: "pizza5"),
    
    Food(title: "Tokyo set", ingredients: "Catfish, salmon, rice", size: "330 gr, 12pcs", price: "15 USD", image: "sushi"),
    Food(title: "California set", ingredients: "Shrimp, salmon, avocado", size: "330 gr, 14pcs", price: "20 USD", image: "sushi2"),
    Food(title: "Unagi set", ingredients: "Smoked salmon, octupus, rice", size: "360 gr, 16pcs", price: "18 USD", image: "sushi3"),
    Food(title: "Nori set", ingredients: "Sprouts, shrimp, avocado", size: "280 gr, 12pcs", price: "15 USD", image: "sushi4"),
    Food(title: "Wasabi set", ingredients: "Raw salmon, rice, soy sauce", size: "300 gr, 14pcs", price: "20 USD", image: "sushi5"),
    
    Food(title: "Margarita", ingredients: "Lemon juice, soda, liqueur", size: "200 ml", price: "15 USD", image: "drink"),
    Food(title: "Americano", ingredients: "Ethiopean beans", size: "180 ml", price: "5 USD", image: "drink2"),
    Food(title: "Green Tea", ingredients: "Sencha green tea", size: "320 ml", price: "8 USD", image: "drink3"),
    Food(title: "Cappuccino", ingredients: "Coffee, milk, foam", size: "220 ml", price: "8 USD", image: "drink4"),
    Food(title: "Mochito", ingredients: "Lime, lemon, mint, rum", size: "180 ml", price: "12 USD", image: "drink5"),
]

var tabsItems = [

    Tab(tab: "Pizza", foods: foods.filter { $0.image.hasPrefix("pizza") } ),
    Tab(tab: "Sushi", foods: foods.filter { $0.image.hasPrefix("sushi") } ),
    Tab(tab: "Drinks", foods: foods.filter { $0.image.hasPrefix("drink") } )
]


