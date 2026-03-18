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
                Section {
                    Text("MyFridge")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }

                Section {
                    HStack {
                        let binding: Binding = Binding(
                            get: { viewModel?.sortOption ?? .bestBefore },
                            set: { viewModel?.sortOption = $0 }
                        )
                        Picker("Sort", selection: binding) {
                            ForEach(SortOption.allCases, id: \.self) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()

                        Button {
                            showAddProduct = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }

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
            .listStyle(.plain)
            .toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented: $showAddProduct) {
                if let viewModel {
                    AddProductView(viewModel: viewModel)
                }
            }
            .onAppear {
                if viewModel == nil {
                    viewModel = ProductListViewModel(context: context)
                }
            }
        }
    }
}

#Preview {
    ProductListView()
}
