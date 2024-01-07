//
//  OrderView.swift
//  MunchiesApp
//
//  Created by Süleyman Ayyılmaz on 6.01.2024.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.presentationMode) var mode
    
    

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Order From The Best of **Munchies**")
                            .font(.system(size: 30))
                            .padding(.trailing)

                        Spacer()

                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.2))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(30)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(ProductList, id: \.id) { item in
                            SmallProductCard(product: item)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
