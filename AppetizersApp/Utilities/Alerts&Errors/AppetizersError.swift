//
//  AppetizersError.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/1/23.
//

import Foundation

// Must conform to Error
enum AppetizersError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
