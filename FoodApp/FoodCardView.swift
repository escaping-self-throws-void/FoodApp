//
//  FoodCardView.swift
//  FoodApp
//
//  Created by Paul Matar on 21/05/2022.
//

import SwiftUI

struct FoodCardView: View {
    @State var isPressed = false
    @Binding var cartItems: [String]
    
    var food: Food
        
    var body: some View {
        
        VStack {
            Image(food.image)
                    .resizable()
                    .frame(height: 250, alignment: .top)
                VStack(alignment: .leading) {
                    Text(food.title)
                        .font(.system(size: 28, weight: .heavy, design: .default))
                        .padding(.bottom, 3)
                    Text(food.ingredients)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                
                    Spacer()
                    HStack(spacing: 45) {
                        Text(food.size)
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.trailing, 35)
                        Button(action: {
                            isPressed = true
                            cartItems.append(food.id)
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                isPressed = false
                            }
                        }) {
                            Text(isPressed ? "Added +1" : food.price)
                                .foregroundColor(.white)
                        }
                        .frame(width: 120, height: 50)
                        .background(isPressed ? .green : .black)
                        .cornerRadius(30)
                    }.padding(.bottom, 30)
                }
            }.background(.white)
            .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height*0.55)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth: 1))
            .shadow(color: .gray, radius: 4, x: 0, y: 8)
    }
}

struct FoodCardView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCardView(cartItems: .constant([]), food: (tabsItems.first?.foods.first)!)
    }
}







//var body: some View {
//
//    VStack {
//            Image("pizza")
//                .resizable()
//                .frame(height: 250, alignment: .top)
//
//            VStack(alignment: .leading) {
//                Text("Hawaiian")
//                    .font(.system(size: 28, weight: .heavy, design: .default))
//                    .padding(.bottom, 3)
//                Text("Chicken, Mozarella, Pineapple, Domino's sause")
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//                    .multilineTextAlignment(.leading)
//
//                Spacer()
//                HStack(spacing: 45) {
//                    Text("200 gramms, 35 cm")
//                        .font(.footnote)
//                        .foregroundColor(.gray)
//                    Button(action: {}) {
//                        Text("55 usd")
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: 120, height: 50)
//                    .background(.black)
//                    .cornerRadius(30)
//                }.padding(.bottom, 30)
//            }
//        }.background(.white)
//        .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height*0.55)
//        .cornerRadius(20)
//        .shadow(color: .gray, radius: 4, x: 0, y: 8)
//
//}
