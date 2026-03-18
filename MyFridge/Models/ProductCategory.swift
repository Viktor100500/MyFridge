//
//  Category.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

enum ProductCategory: String, Codable, CaseIterable {
    case dairy = "Dairy"
    case meat = "Meat"
    case vegetables = "Vegetables"
    case fruits = "Fruits"
    case drinks = "Drinks"
    case other = "Other"
}
