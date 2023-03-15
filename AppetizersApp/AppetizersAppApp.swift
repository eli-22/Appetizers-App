//
//  AppetizersAppApp.swift
//  AppetizersApp
//
//  Created by Elise on 12/31/22.
//

import SwiftUI

@main
struct AppetizersAppApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
