//
//  ExpanseViewModel.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    
    init() {
        getExpenses()
    }
    
    func getExpenses() {
        let newExpenses = [Expense(name: "iPhone 15 Pro", amount: 3899.99, category: "Electronics", date: "27-06-2024"),
                           Expense(name: "Groceries", amount: 150.00, category: "Food & Groceries", date: "26-06-2024"),
                           Expense(name: "Gasoline", amount: 45.60, category: "Transportation", date: "25-06-2024"),
                           Expense(name: "Movie Tickets", amount: 40.00, category: "Entertainment", date: "24-06-2024"),
                           Expense(name: "Fitness Membership", amount: 99.99, category: "Health & Fitness", date: "23-06-2024"),
                           Expense(name: "Restaurant Dinner", amount: 75.50, category: "Dining Out", date: "22-06-2024"),
                           Expense(name: "Clothing", amount: 120.00, category: "Apparel", date: "21-06-2024"),
                           Expense(name: "Books", amount: 30.00, category: "Education", date: "20-06-2024"),
                           Expense(name: "Utilities", amount: 100.00, category: "Bills", date: "19-06-2024"),
                           Expense(name: "Vacation", amount: 800.00, category: "Travel", date: "18-06-2024"),
                           ]
        
        expenses.append(contentsOf: newExpenses)
    }
}
