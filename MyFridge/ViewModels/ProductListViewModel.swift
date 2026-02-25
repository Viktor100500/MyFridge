//
//  ProductListViewModel.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import Foundation
import Observation
import SwiftData

@Observable
final class ProductListViewModel {
    private var context: ModelContext
    
    var products: [Product] = []
    
    init(context: ModelContext) {
        self.context = context
        fetchProdcuts()
    }
    
    func fetchProdcuts() {
        let descriptor = FetchDescriptor<Product>(
            sortBy: [SortDescriptor(\.expiresAt)]
        )
        
        products = (try? context.fetch(descriptor)) ?? []
    }
    
    func addProduct(name: String, expiresAt: Date) {
        let product = Product(name: name, expiresAt: expiresAt)
        context.insert(product)
        save()
    }
    
    func deleteProduct(_ product: Product) {
        context.delete(product)
        save()
    }
}

private extension ProductListViewModel {
    func save() {
        try? context.save()
        fetchProdcuts()
    }
}
