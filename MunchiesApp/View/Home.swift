//
//  Home.swift
//  MunchiesApp
//
//  Created by Süleyman Ayyılmaz on 6.01.2024.
//

import SwiftUI

struct Home: View {
    
    @State private var selectedCategory = "All"
    
    @EnvironmentObject var  basketManager: BasketManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Order From The Best Of **Munchies**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    // Category List
                    CategoryListView
                    
                    // Collection View
                    HStack {
                        
                        
                                                
                        NavigationLink(
                            destination:
                                OrderView()
                                .environmentObject(BasketManager())
                            ,
                            label: {
                                HStack {
                                    Text("All Product Collection")
                                        .font(.system(size: 24))
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                        .imageScale(.large)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                        )
                    }

                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack {
                            ForEach(ProductList, id: \.id) { item in
                                ProductCard(product: item)
                                    .environmentObject(BasketManager())
                                    .frame(width: 300) // Adjust the width as needed
                            }
                        }
                    }
                }
            }
        }
    }
    
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(systemName: item.icon)
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                }
                                Text(item.title)
                            }
                            .padding()
                            .background(selectedCategory == item.title ? Color.black : Color.gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.title ? Color.black : Color.white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(BasketManager())
    }
}

struct ProductCard: View {
    var product: Product
    
    @EnvironmentObject var basketManager: BasketManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150) // Adjust the size as needed
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("\(product.name)")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
                
                Text(product.category)
                    .font(.callout)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .clipShape(Capsule())
                    .padding(.top, 10)
                
                HStack {
                    Text("$\(product.price).0")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.leading, 10)
                    Spacer()
                    Button(action: {
                        basketManager.addToBasket(product: product)
                    }) {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 40, height: 30)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                }

                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(10)
            .frame(width: 200, height: 200) // Adjust the size as needed
        }
    }
}
