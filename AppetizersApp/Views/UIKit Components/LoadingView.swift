//
//  LoadingView.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/2/23.
//

import Foundation
import SwiftUI

struct LoadingView: View  {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2) // double the size
        }
    }
}
