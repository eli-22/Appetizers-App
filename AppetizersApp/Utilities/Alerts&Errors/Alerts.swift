//
//  Alerts.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/2/23.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                        message: Text("The data received from the server was invalid. Please contact support."),
                                        dismissButton: .default(Text("Dismiss")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                        message: Text("Invalid response from server. Please try again later or contact support."),
                                        dismissButton: .default(Text("Dismiss")))
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                        message: Text("There was an issue connecting to the server. Please contact support."),
                                        dismissButton: .default(Text("Dismiss")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                        message: Text("Unable to complete your request. Please check your internet connection."),
                                        dismissButton: .default(Text("Dismiss")))
    // MARK: - Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                        message: Text("Please fill out all required fields."),
                                        dismissButton: .default(Text("Dismiss")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                        message: Text("Please provide a valid email address."),
                                        dismissButton: .default(Text("Dismiss")))
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                        message: Text("Your profile information was saved successfully."),
                                        dismissButton: .default(Text("Dismiss")))
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                        message: Text("There was an error saving or retrieving your profile."),
                                        dismissButton: .default(Text("Dismiss")))
}
