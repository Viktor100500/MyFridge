//
//  AddProductView.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import SwiftUI

struct AddProductView: View {
    let viewModel: ProductListViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var expiresAt: Date = .now
    
    var body: some View {
        NavigationStack {
            Form {
                Section("ProductInfo") {
                    TextField("Name", text: $name)
                    DatePicker(
                        "Best before",
                        selection: $expiresAt,
                        displayedComponents: .date
                    )
                    
                }
            }
            .navigationTitle("Add product")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        viewModel.addProduct(name: name, expiresAt: expiresAt)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
