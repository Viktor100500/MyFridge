//
//  Product.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import Foundation
import SwiftUI

struct Product: Identifiable, Equatable {
    let id: UUID
    let name: String
    let expiresAt: Date
    let createdAt: Date
}

extension Product {
    var expiryStatus: ExpiryStatus {
        let days = Calendar.current.dateComponents([.day], from: .now, to: expiresAt).day ?? 0
        if days < 0 { return .expired }
        if days <= 3 { return .expiringSoon }
        return .fresh
    }
}

enum ExpiryStatus {
    case fresh, expiringSoon, expired

    var color: Color {
        switch self {
        case .fresh: return .green
        case .expiringSoon: return .orange
        case .expired: return .red
        }
    }

    var label: String {
        switch self {
        case .fresh: return "Fresh"
        case .expiringSoon: return "Expiring soon"
        case .expired: return "Expired"
        }
    }
}
