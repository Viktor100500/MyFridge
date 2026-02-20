//
//  AddProductViewModel.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import Foundation
import Observation

@Observable
final class FridgeViewModel{
    var items: [Product] = []
    
    func addItem(_ item: Product) {
        items.append(item)
    }
    
    func removeItem(_ index: Int) {
        items.remove(at: index)
    }
    
    func daysLeft(for item: Product) -> Int {
        Calendar.current.dateComponents([.day], from: Date(), to: item.expiresAt).day ?? 0
    }
}

