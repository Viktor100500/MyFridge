//
//  ProductListViewModel.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import Foundation
import Observation

@Observable
final class ProductListViewModel {
    var products: [Product] = [
        Product(id: UUID(), name: "Milk", expiresAt: .now.addingTimeInterval(86400 * 2), createdAt: .now),
        Product(id: UUID(), name: "Chicken", expiresAt: .now.addingTimeInterval(-86400), createdAt: .now),
        Product(id: UUID(), name: "Yogurt", expiresAt: .now.addingTimeInterval(86400 * 7), createdAt: .now)
    ]
    
    func deleteProduct(_ product: Product) {
        products.removeAll { $0.id == product.id }
    }
}
