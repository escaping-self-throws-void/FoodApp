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


var foods = [
    Food(title: "Chocolate Cake", ingredients: "Cocoa powder", size: "200 gr, 30cm", price: "56 USD", image: "pizza"),
    Food(title: "Cake", ingredients: "Cocoa", size: "200 gr, 30cm", price: "80 USD", image: "pizza2"),
    Food(title: "Cake", ingredients: "Cocoa", size: "200 gr, 30cm", price: "80 USD", image: "sushi"),
    Food(title: "Cake", ingredients: "Cocoa", size: "200 gr, 30cm", price: "80 USD", image: "drink"),
    Food(title: "Cake", ingredients: "Cocoa", size: "200 gr, 30cm", price: "80 USD", image: "sushi2")
]

struct Tab: Identifiable {
    
    var id = UUID().uuidString
    var tab: String
    var foods: [Food]
}

var tabsItems = [

    Tab(tab: "Pizza", foods: foods.shuffled()),
    Tab(tab: "Sushi", foods: foods.shuffled()),
    Tab(tab: "Drinks", foods: foods.shuffled())
]


