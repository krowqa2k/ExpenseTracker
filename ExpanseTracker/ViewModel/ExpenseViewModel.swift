//
//  ExpanseViewModel.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "expense_item"
    
    init() {
        getExpenses()
    }
    
    func getExpenses() {
        
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Expense].self, from: data)
        else { return }
        
        self.expenses = savedItems
        self.expenses.sort(by: { $0.date > $1.date })
    }
    
    func addItem(name: String, amount: Double, category: String, date: Date) {
        let newExpense = Expense(name: name, amount: amount, category: category, date: date)
        expenses.append(newExpense)
        expenses.sort(by: { $0.date > $1.date }) 
        saveItems()
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
}
