//
//  BasketManager.swift
//  MunchiesApp
//
//  Created by Süleyman Ayyılmaz on 6.01.2024.
//

import SwiftUI

class BasketManager: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToBasket(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromBasket(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price 
    }
}
