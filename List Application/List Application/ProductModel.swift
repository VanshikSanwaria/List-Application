//
//  Product.swift
//  List Application
//
//  Created by Home Mac on 25/01/25.
//


import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}

typealias Category = String
