//
//  MenuScrollView.swift
//  FoodApp
//
//  Created by Paul Matar on 21/05/2022.
//

import SwiftUI

struct MenuScrollView: View {
    @Binding var currentTab: String
    @State var cartItems: [String] = []
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            VStack {
                TabHeaderView(currentTab: $currentTab)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
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
                }.padding()
            }
            .padding()
            .onAppear {
                currentTab = tabsItems.first?.id ?? ""
            }
            
            CartButtonView(cartItems: $cartItems)
        }
        .background(.white)
        .cornerRadius(45)
        
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

struct CartButtonView: View {
    @Binding var cartItems: [String]
    
    var body: some View {
        Button(action: {}) {
            HStack(alignment: .top, spacing: -20) {
                Image(systemName: "cart")
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(color: .gray, radius: 3, x: 0, y: 6)
                Text("\(cartItems.count)")
                    .frame(width: 18, height: 18)
                    .font(.footnote)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(9)
                    .opacity(cartItems.count > 0 ? 1 : 0)
            }
            
        }.padding([.bottom, .trailing], 35)
    }
}

struct TabHeaderView: View {
    @Binding var currentTab: String
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 30) {
                    
                    ForEach(tabsItems) { tab in
                        VStack {
                            Text(tab.tab)
                                .font(.largeTitle)
                                .foregroundColor(currentTab == tab.id ? .black : .gray)
                        }
                        .onTapGesture {
                            withAnimation(.easeOut){
                                currentTab = tab.id
                                proxy.scrollTo(currentTab, anchor: .topTrailing)
                            }
                        }
                    }
                }
            }.padding([.horizontal, .top], 15)
        }
    }
}



struct MenuScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MenuScrollView(currentTab: .constant(""))
    }
}
