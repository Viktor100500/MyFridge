//
//  ProductRowView.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.body)
                Text(product.expiresAt, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(product.expiresAt.formatted())
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(product.expiryStatus.color, in: Capsule())
        }
        .padding(.vertical, 4)
    }
}
