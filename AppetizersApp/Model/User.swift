//
//  User.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/4/23.
//

import Foundation

// Note: In a real app, you would store your users in a database. This is just an example demonstrating how to persist a custom object.

// Must conform to Codable because we're encoding data into storage and decoding to retrieve it. 
struct User: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var includeCutlery = false
    var refills = false
}
