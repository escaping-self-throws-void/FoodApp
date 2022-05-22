//
//  TabHeaderView.swift
//  FoodApp
//
//  Created by Paul Matar on 22/05/2022.
//

import SwiftUI

struct TabHeaderView: View {
    @Binding var currentTab: String
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 30) {
                    
                    ForEach(tabsItems) { tab in
                        Text(tab.tab)
                            .font(.largeTitle)
                            .foregroundColor(currentTab == tab.id ? .black : .gray)
                            .onTapGesture {
                                withAnimation(.easeOut){
                                    currentTab = tab.id
                                    proxy.scrollTo(currentTab, anchor: .topTrailing)
                                }
                            }
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct TabHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TabHeaderView(currentTab: .constant(""))
    }
}
