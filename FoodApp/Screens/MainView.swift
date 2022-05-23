//
//  MainView.swift
//  FoodApp
//
//  Created by Paul Matar on 21/05/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewModel(service: APIService.shared)
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView(.vertical, showsIndicators: false) {
                PromoView(vm: vm)
                    
                MenuView(vm: vm)
            }
            
            CartButtonView(cartItems: $vm.cartItems)
            
        }
    }
    
}

struct MenuScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

