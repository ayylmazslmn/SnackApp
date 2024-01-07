//
//  ProductModel.swift
//  MunchiesApp
//
//  Created by Süleyman Ayyılmaz on 6.01.2024.
//

import SwiftUI

// Product Model

struct Product: Identifiable {
    
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
    
}

// Sample Products

var ProductList = [
    
    Product(name: "Donuts", category: "", image: "donuts",color: .yellow, price: 8),
    Product(name: "Waffle", category: "", image: "waffle",color: .green, price: 12),
    Product(name: "Pizza", category: "", image: "pizza", color: .blue,price: 20),
    Product(name: "Burger", category: "", image: "burger",color: .red, price: 24),
    Product(name: "Snack", category: "", image: "snack",color: .orange, price: 25),
    Product(name: "Ice Cream", category: "", image: "icecream",color: .purple, price: 8),
    Product(name: "Milkshake", category: "", image: "milkshake",color: .brown, price: 5),
    Product(name: "Special", category: "", image: "special",color: .black, price: 50),
]
