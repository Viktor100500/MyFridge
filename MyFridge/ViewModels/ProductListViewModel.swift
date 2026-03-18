//
//  ProductListViewModel.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import Foundation
import Observation
import SwiftData

enum SortOption: String, CaseIterable {
    case dateAdded = "Date Added"
    case bestBefore = "Best Before"
    case name = "Name"
    case category = "Category"
}

@Observable
final class ProductListViewModel {
    private var context: ModelContext
    
    var products: [Product] = []
    var sortOption: SortOption = .bestBefore {
        didSet {
            fetchProdcuts()
        }
    }
    
    init(context: ModelContext) {
        self.context = context
        fetchProdcuts()
    }
    
    func fetchProdcuts() {
        let descriptor = FetchDescriptor<Product>(
            sortBy: [sortDescriptor]
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
    var sortDescriptor: SortDescriptor<Product> {
        switch sortOption {
        case .dateAdded: return SortDescriptor(\.createdAt)
        case .bestBefore: return SortDescriptor(\.expiresAt)
        case .name: return SortDescriptor(\.name)
        case .category: return SortDescriptor(\.category)
        }
    }
    
    func save() {
        try? context.save()
        fetchProdcuts()
    }
}
