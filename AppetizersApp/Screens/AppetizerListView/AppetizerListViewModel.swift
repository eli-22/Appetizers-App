//
//  AppetizerListViewModel.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/1/23.
//

import Foundation
import SwiftUI

// @MainActor - anything related to the UI that happens in the view model will happen on the main thread.
// Don't have to specify DispatchQueue.main.async. 
@MainActor final class AppetizerListViewModel: ObservableObject {
    
    // Network call will populate the array, which will trigger a UI redraw because the array is a @Published variable.
    @Published var appetizers: [Appetizer] = []
    
    @Published var alertItem: AlertItem?
    
    // Will be true as soon as we call getAppetizers(). Will be false as soon as we have a result. 
    @Published var isLoading = false
    
    @Published var isShowingDetail = false
    
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        // Move do-try-catch to an async context.
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                // Check if error thrown is type AppetizersError. If so, specify which error to display using switch case. (If not, we will still throw our generic error.)
                if let apError = error as? AppetizersError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}
