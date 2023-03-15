//
//  OrderView.swift
//  AppetizersApp
//
//  Created by Elise on 12/31/22.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
           
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                           AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    
                    Button{
                        print("Order placed")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f")- Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have not added any items to your order.\nPlease select your appetizers.")
                }
            }
            .navigationTitle("Orders 🧾")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
