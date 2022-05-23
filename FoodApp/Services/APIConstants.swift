//
//  APIConstants.swift
//  FoodApp
//
//  Created by Paul Matar on 23/05/2022.
//

import Foundation

enum APIUrls {
    static let realURL = "https://coffee.alexflipnote.dev/random.json"
    static let mockURL = "https://tabs.foodpics.com/random/pic.json"
}

enum APError: Error {
    case invalidURL
    case invalidData
    case unableToComplete
    case invalidResponse
}


