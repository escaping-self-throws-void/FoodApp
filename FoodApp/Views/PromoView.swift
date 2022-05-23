//
//  PromoView.swift
//  FoodApp
//
//  Created by Paul Matar on 23/05/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PromoView: View {
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
        GeometryReader { reader in
            
            TabView {
                
                // Test Image for network layer test
//                TestImageView(vm: vm)
                
                Image("saturday1").resizable().scaledToFit()
                Image("sunday1").resizable().scaledToFit()
                Image("monday1").resizable().scaledToFit()
                
            }
            .tabViewStyle(.page)
            .background(Image("bg"))
            .padding(.bottom, 10)
            .offset(y: -reader.frame(in: .global).minY + 45)
            .onChange(of: reader.frame(in: .global).minY) { value in
                let offset = value + (UIScreen.main.bounds.height / 2.5)
                if offset < 160 {
                    if offset > 80 {
                        let tempOpacity = (160 - offset) / 160
                        vm.opacity = Double(tempOpacity)
                        return
                    }
                    vm.opacity = 1
                } else {
                    vm.opacity = 0
                }
            }
            
        }
        .frame(height: UIScreen.main.bounds.height * 0.55)
    }
}

struct TestImageView: View {
    @ObservedObject var vm: MainViewModel
    
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

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView(vm: .init(service: APIService.shared))
    }
}
