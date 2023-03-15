//
//  Date+Ext.swift
//  AppetizersApp_V1.0_Set Up
//
//  Created by Elise on 1/13/23.
//

import Foundation

// Create date extension to limit range to 18 years - 110 years.
extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
    
}
