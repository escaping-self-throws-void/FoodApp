//
//  CartButtonView.swift
//  FoodApp
//
//  Created by Paul Matar on 22/05/2022.
//

import SwiftUI

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

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(cartItems: .constant([]))
    }
}
