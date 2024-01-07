//
//  CategoryModel.swift
//  MunchiesApp
//
//  Created by Süleyman Ayyılmaz on 6.01.2024.
//

import SwiftUI


struct CategoryModel: Identifiable, Hashable {
    
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [

    CategoryModel(icon:"", title: "All"),
    CategoryModel(icon:"donuts", title: "donuts"),
    CategoryModel(icon:"waffles", title: "Waffles"),
    CategoryModel(icon:"pizza", title: "pizza"),
    CategoryModel(icon:"burger", title: "burger"),
    CategoryModel(icon:"snack", title: "snack"),
    CategoryModel(icon:"ice cream", title: "ice cream"),
    CategoryModel(icon:"milkshake", title: "milkshake"),
]
