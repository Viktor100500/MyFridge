//
//  MyFridgeApp.swift
//  MyFridge
//
//  Created by Developer on 20.02.2026.
//

import SwiftUI
import SwiftData

@main
struct MyFridgeApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView()
        }
        .modelContainer(for: Product.self)
    }
}
