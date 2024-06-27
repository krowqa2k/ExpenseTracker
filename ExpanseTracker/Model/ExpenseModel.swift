//
//  ExpanseModel.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import Foundation

struct ExpanseModel {
    var id = UUID()
    var name: String
    var amount: Double
    var category: String
    var date: Date
}
