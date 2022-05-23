//
//  MenuScrollView.swift
//  FoodApp
//
//  Created by Paul Matar on 21/05/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MenuScrollView: View {
    @StateObject private var vm = MenuViewModel(service: APIService.shared)
    
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView(.vertical, showsIndicators: false) {
                TabView {
                    
                    // Test Image for network layer test
                    //                    TestImageView(vm: vm)
                    
                    Image("saturday1")
                    Image("sunday1")
                    Image("monday1")
                    
                }.tabViewStyle(.page)
                    .frame(height: 400)
                    .background(Image("bg").aspectRatio(contentMode: .fill))
                
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
                            
                        }.padding(.bottom)
                            .onChange(of: vm.currentTab) { _ in
                                withAnimation(.easeOut){
                                    proxy.scrollTo(vm.currentTab)
                                }
                            }
                    }
                }.background(.white)
                    .cornerRadius(45)
            }.onAppear {
                vm.currentTab = vm.tabs.first?.id ?? ""
            }
            
            CartButtonView(cartItems: $vm.cartItems)
            
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

struct MenuScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MenuScrollView()
    }
}

struct TestImageView: View {
    @ObservedObject var vm: MenuViewModel
    
    var body: some View {
        WebImage(url: URL(string: vm.coffee?.file ?? "") )
            .resizable()
            .placeholder(Image("bg"))
            .indicator(.activity)
            .frame(width: 400, height: 400)
            .clipped()
            .scaledToFit()
            .task {
                vm.getCoffee()
            }
    }
}
