//
//  Order.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/9/23.
//

// All child views will have access to an environment object.

import SwiftUI
final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    // Replace hard-coded value on OrderView button.
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }

    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
