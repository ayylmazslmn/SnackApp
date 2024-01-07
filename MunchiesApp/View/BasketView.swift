//
//  BasketView.swift
//  MunchiesApp
//
//  Created by Süleyman Ayyılmaz on 6.01.2024.
//
import SwiftUI

struct BasketView: View {
    
    @EnvironmentObject var basketManeger: BasketManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Basket")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("\(basketManeger.products.count)")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(Color.yellow)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        }
                        
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
                    
                    VStack(spacing: 20) {
                        ForEach(basketManeger.products, id: \.name) { item in
                            BasketProductCard(product: item)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Delivery Amount")
                                .font(.system(size: 24, weight: .semibold))
                            
                            Spacer()
                            Text("0")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        
                        Divider()
                        
                        Text("Total Amount")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Text("$\(basketManeger.total)")
                            .font(.system(size: 36, weight: .semibold))
                        
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding()
                    
                    // Button to make payment
                    
                    Button {
                        // Your payment logic here
                    } label: {
                        Text("Make Payment")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow)
                            .font(.system(size:20 , weight: .semibold))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
            .environmentObject(BasketManager())
    }
}

// Basket product view

struct BasketProductCard: View {
    var product: Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("\(product.name)")
                    .font(.headline)
            }
            
            Spacer()
            
            Text("$\(product.price)")
                .padding()
                .background(Color.yellow)
                .clipShape(Capsule())
        }
    }
}
