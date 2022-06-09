//
//  SwiftUIView.swift
//  FoodApp
//
//  Created by Paul Matar on 26/05/2022.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var vm: MainViewModel
    var body: some View {
        
//      VStack {
            
//        GeometryReader { reader in
//            TabView {
//
//                // Test Image for network layer test
////                TestImageView(vm: vm)
//
//                Image("saturday1").resizable().scaledToFit()
//                Image("sunday1").resizable().scaledToFit()
//                Image("monday1").resizable().scaledToFit()
//
//            }
//            .tabViewStyle(.page)
//            .background(Image("bg"))
//            .offset(y: -reader.frame(in: .global).minY + 45)
//            .onChange(of: reader.frame(in: .global).minY) { value in
//                let offset = value + (UIScreen.main.bounds.height / 2.5)
//                if offset < 160 {
//                    if offset > 80 {
//                        let tempOpacity = (160 - offset) / 160
//                        vm.opacity = Double(tempOpacity)
//                        return
//                    }
//                    vm.opacity = 1
//                } else {
//                    vm.opacity = 0
//                }
//        }
//        }.frame(height: UIScreen.main.bounds.height / 3)

        
        
        ExtractedView(vm: vm).padding()
        
//        }
    
    
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(vm: .init(service: APIService.shared))
    }
}

struct CategoryView: View {
    @Binding var cartItems: [String]
    let tab: Tab
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(tab.foods) { food in
                FoodCardView(cartItems: $cartItems, food: food).padding()
            }
        }
    }
}

struct ExtractedView: View {
    @ObservedObject var vm: MainViewModel
    var body: some View {
        VStack {
            
            
            HStack(alignment: .center, spacing: 50){
                ForEach(vm.tabs) { tab in
                    Text(tab.tab).font(.title)
                        .foregroundColor(vm.currentTab == tab.id ? .black : .gray)
                        .onTapGesture {
                            vm.currentTab = tab.id
                        }
                }
            }.padding()
            
            
            TabView(selection: $vm.currentTab) {
                
                ForEach(vm.tabs) { tab in
                    CategoryView(cartItems: $vm.cartItems, tab: tab)
                }
                
            }.tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: vm.currentTab) { newValue in
                    vm.currentTab = newValue
                }
                .onAppear {
                    if let first = vm.tabs.first {
                        vm.currentTab = first.id
                    }
                }
            
        }.background(.white)
            .ignoresSafeArea(.all, edges: .bottom)
            .cornerRadius(40, corners: [.topLeft, .topRight])
            .offset(y: vm.yOffset)
    }
}
