//
//  ProductListView.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import SwiftUI
import SwiftData

struct ProductListView: View {
    @Environment(\.modelContext) private var context
    @State private var viewModel: ProductListViewModel?
    @State private var showAddProduct = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel?.products ?? []) { product in
                    ProductRowView(product: product)
                }
                .onDelete { indexSet in
                    indexSet.forEach {
                        if let product = viewModel?.products[$0] {
                            viewModel?.deleteProduct(product)
                        }
                    }
                }
            }
            .navigationTitle("MyFridge")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddProduct = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddProduct) {
                if let viewModel {
                    AddProductView(viewModel: viewModel)
                }
            }
            .onAppear() {
                if viewModel == nil {
                    viewModel = ProductListViewModel(context: context)
                }
            }
        }
    }
}
