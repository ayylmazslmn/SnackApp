//
//  CollectionView.swift
//  MunchiesApp
//
//  Created by Süleyman Ayyılmaz on 6.01.2024.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var basketmanager: BasketManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Order From The Best Of **Snack**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button(action: {
                            mode.wrappedValue.dismiss()
                        }) {
                            
                        }
                        
                        
                        NavigationLink(
                            destination: ContentView(), // Replace with the actual destination
                            label: {
                                Image(systemName: "arrow.left")
                                    .imageScale(.large)
                                    .padding()
                                    .frame(width: 70, height: 90)
                                    .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                            }
                        )
                    }
                    .padding(30)
                    
                    
                        
                    }
                    .navigationBarTitle("", displayMode: .inline) // Set navigation bar title
                }
            }
        }
    }
    
    struct CollectionView_Previews: PreviewProvider {
        static var previews: some View {
            CollectionView()
        }
    }
    
    //Small Product Card
    
    struct SmallProductCard: View{
        
        var product: Product
        
        @EnvironmentObject var basketManager: BasketManager
        var body: some View{
            
            ZStack{
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing)
                
                ZStack{
                    VStack(alignment: .leading, content:{
                        
                        Text("\(product.name)")
                            .font(.system(size: 18, weight: .semibold))
                            .frame(width: 70)
                        
                        Text(product.category)
                            .font(.system(size: 10))
                            .padding()
                            .background(.white.opacity(0.5))
                            .clipShape(Capsule())
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("$\(product.price)")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                            
                            
                            Button {
                                basketManager.addToBasket(product: product)
                                
                            }label: {
                                Image(systemName: "basket")
                                    .imageScale(.large)
                                    .frame(width: 45, height: 40)
                                    .background(.black)
                                    .clipShape(Capsule())
                                    .foregroundColor(.white)
                                
                            }
                        }
                        .padding(.trailing)
                        .padding()
                        .frame(maxWidth:.infinity)
                        .frame(height: 45)
                        .background(.white.opacity(0.9))
                        .clipShape(Capsule())
                        
                        
                    })
                    
                }
                .padding(20)
                .frame(width: 170, height:215)
                
            }
            .frame(width: 170, height: 215)
            .background(product.color.opacity(0.13))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.leading, 10)
        }
    }
    
    
    

