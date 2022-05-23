//
//  MainViewModel.swift
//  FoodApp
//
//  Created by Paul Matar on 23/05/2022.
//

import SwiftUI

@MainActor final class MainViewModel: ObservableObject {
    
    @Published private(set) var tabs: [Tab] = []
    @Published private(set) var coffee: Coffee?
    @Published var currentTab = ""
    @Published var cartItems: [String] = []
    @Published var opacity: Double = 0
    @Published var yOffset: CGFloat = 0
    
    private let service: APIProtocol
    
    init(service: APIProtocol) {
        self.service = service
        getTabs()
    }
    
    func getTabs() {
        self.tabs = Tab.mockTabs
    }
    
    func getCoffee() {
        service.fetchCoffee { [weak self] result in
            switch result {
            case .success(let value):
                self?.coffee = value
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
