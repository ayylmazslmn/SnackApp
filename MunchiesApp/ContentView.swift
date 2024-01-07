//
//  ContentView.swift
//  MunchiesApp
//
//  Created by Süleyman Ayyılmaz on 6.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var basketManager = BasketManager()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                
                    Home()
                        .environmentObject(basketManager)
                }

                if basketManager.products.count > 0 {
                    HStack(spacing: 30) {
                        Text("\(basketManager.products.count)")
                            .padding()
                            .background(.yellow)
                            .clipShape(Circle())
                            .foregroundColor(.black)

                        VStack(alignment: .leading) {
                            Text("Basket")
                                .font(.system(size: 36, weight: .semibold))
                            Text("\(basketManager.products.count) Item")
                                .font(.system(size: 18))
                        }
                        Spacer()

                        ForEach(basketManager.products, id: \.name) { product in
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .padding(8)
                                .frame(width: 60, height: 60)
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(.leading)
                        }
                    }
                    .padding(30)
                    .frame(width: .infinity, height: 80)
                    .background(.black)
                    .foregroundColor(.white)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
