//
//  CustomModifiers.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/12/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

// Another option: Just type .StandardButtonStyle() instead of .modifier(StandardButtonStyle())
extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
