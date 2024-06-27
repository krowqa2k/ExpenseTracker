//
//  ExpanseModel.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    var name: String
    var amount: Double
    var category: String
    var date: String
    
    var dateParsed: Date {
        date.dateParsed()
    }
}



