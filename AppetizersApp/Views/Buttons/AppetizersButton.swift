//
//  AppetizersButton.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/2/23.
//

import SwiftUI

struct AppetizersButton: View {
    
    // Needs to be LocalizedStringKey for the decimal place specifier.
    let buttonTitle: LocalizedStringKey
    var body: some View {
        
        Text(buttonTitle)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct AppetizersButton_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersButton(buttonTitle: "Test title")
    }
}
