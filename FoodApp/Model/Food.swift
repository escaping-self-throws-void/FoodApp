//
//  File.swift
//  FoodApp
//
//  Created by Paul Matar on 21/05/2022.
//

import SwiftUI

struct Food: Identifiable, Decodable {
    var id = UUID().uuidString
    let title: String
    let ingredients: String
    let size: String
    let price: String
    let image: String
}





