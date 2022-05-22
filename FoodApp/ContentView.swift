//
//  ContentView.swift
//  FoodApp
//
//  Created by Paul Matar on 21/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab = ""
//    @State var cartItems = 0
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            PromoTabView()
            VStack(spacing: 0) {
                MenuScrollView(currentTab: $currentTab)
            }
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct PromoTabView: View {
    var body: some View {
        TabView {
            
            Image("monday")
            Image("sunday")
            Image("saturday")
            
        }.tabViewStyle(.page)
            .frame(height: UIScreen.main.bounds.height*0.7)
            .background(Image("bg").aspectRatio(contentMode: .fill) )
    }
}
