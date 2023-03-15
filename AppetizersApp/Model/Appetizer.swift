//
//  Appetizer.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 12/31/22.
//

import Foundation

// If using Codable, model structure must exactly match JSON structure.
// Conform to Decodable so when we get JSON from the server, it will decode it to make an appetizer object.
// Not sending data back to the server, so it doesn't need to conform to Codable/Encodable. 

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

// JSON file has array of appetizer objects nested in a request.
// We have to decode the data into a request to access the array of appetizers.

// All underlying foundational types conform to Decodable
struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// Mock data to structure UI before we implement the network call.

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001, name: "Test", description: "Test", price: 12.99, imageURL: "", calories: 200, protein: 20, carbs: 40)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 0001, name: "Test 1", description: "Test", price: 12.99, imageURL: "", calories: 200, protein: 20, carbs: 40)
    
    static let orderItemTwo = Appetizer(id: 0002, name: "Test 2", description: "Test", price: 12.99, imageURL: "", calories: 200, protein: 20, carbs: 40)
    
    static let orderItemThree = Appetizer(id: 0003, name: "Test 3", description: "Test", price: 12.99, imageURL: "", calories: 200, protein: 20, carbs: 40)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
