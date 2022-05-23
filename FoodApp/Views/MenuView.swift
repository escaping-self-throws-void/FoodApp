//
//  MenuView.swift
//  FoodApp
//
//  Created by Paul Matar on 23/05/2022.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
        VStack {
            TabHeaderView(currentTab: $vm.currentTab, tabs: vm.tabs)
                .padding()
            
            ScrollViewReader { proxy in
                VStack(alignment: .center, spacing: 30) {
                    
                    if vm.currentTab == vm.tabs[0].id {
                        FoodTabView(cartItems: $vm.cartItems, tab: vm.tabs[0])
                    } else if vm.currentTab == vm.tabs[1].id {
                        FoodTabView(cartItems: $vm.cartItems, tab: vm.tabs[1])
                    } else {
                        FoodTabView(cartItems: $vm.cartItems, tab: vm.tabs[2])
                    }
                    
                }.onChange(of: vm.currentTab) { _ in
                    withAnimation(.easeOut){
                        proxy.scrollTo(vm.currentTab)
                    }
                }
            }.background(.white).ignoresSafeArea(.all, edges: .bottom)
        }
        .padding(.bottom, 50)
        .background(.white).ignoresSafeArea(.all, edges: .bottom)
        .cornerRadius(40, corners: [.topLeft, .topRight])
        .offset(y: vm.yOffset)
        .onAppear {
            vm.currentTab = vm.tabs.first?.id ?? ""
        }
    }
}

struct FoodTabView: View {
    @Binding var cartItems: [String]
    let tab: Tab
    
    var body: some View {
        ForEach(tab.foods) { food in
            FoodCardView(cartItems: $cartItems, food: food)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(vm: .init(service: APIService.shared))
    }
}
