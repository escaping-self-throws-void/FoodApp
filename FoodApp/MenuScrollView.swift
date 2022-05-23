//
//  MenuScrollView.swift
//  FoodApp
//
//  Created by Paul Matar on 21/05/2022.
//

import SwiftUI

struct MenuScrollView: View {
    @State var currentTab = ""
    @State var cartItems: [String] = []
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView(.vertical, showsIndicators: false) {
                TabView {
                    Image("monday1")
                    Image("sunday2")
                    Image("saturday3")
                }.tabViewStyle(.page)
                    .frame(height: 400)
                    .background(Image("bg").aspectRatio(contentMode: .fill))
                
                VStack {
                    TabHeaderView(currentTab: $currentTab)
                        .padding()
                    
                    ScrollViewReader { proxy in
                        VStack(alignment: .center, spacing: 30) {
                            if currentTab == tabsItems[0].id {
                                FoodTabView(cartItems: $cartItems, tab: tabsItems[0])
                            } else if currentTab == tabsItems[1].id {
                                FoodTabView(cartItems: $cartItems, tab: tabsItems[1])
                            } else {
                                FoodTabView(cartItems: $cartItems, tab: tabsItems[2])
                            }
                        }.padding(.bottom)
                            .onChange(of: currentTab, perform: { newValue in
                                withAnimation(.easeOut){
                                    proxy.scrollTo(currentTab, anchor: .topTrailing)
                                }
                            })
                    }
                }.background(.white)
                    .cornerRadius(45)
            }
            .onAppear {
                currentTab = tabsItems.first?.id ?? ""
            }
            
            CartButtonView(cartItems: $cartItems)
        }
    }
}

struct FoodTabView: View {
    @Binding var cartItems: [String]
    var tab: Tab
    
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
