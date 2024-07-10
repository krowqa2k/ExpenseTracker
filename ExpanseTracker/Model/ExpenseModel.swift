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
    var category: ExpenseCategory
    var date: Date
    
}

enum ExpenseCategory: String, CaseIterable, Identifiable, Codable {
    case food = "Food"
    case transport = "Transport"
    case housing = "Housing"
    case electronics = "Electronics"
    case healthAndBeauty = "Health"
    case entertainment = "Fun"
    case clothing = "Clothes"
    case other = "Other"
    
    var id: String { self.rawValue }
}


