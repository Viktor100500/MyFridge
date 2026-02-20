//
//  ProductListView.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import SwiftUI

struct ProductListView: View {
    @State private var viewModel = ProductListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products) { product in
                    ProductRowView(product: product)
                }
            }
            .navigationTitle(Text("MyFridge"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button  {
                        //TODO: AddProductView – next step
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
