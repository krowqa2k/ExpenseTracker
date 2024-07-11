import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = [] {
        didSet {
            saveItems()
        }
    }
    
    var totalExpenses: Double {
            expenses.reduce(0) { $0 + $1.amount }
        }
    
    let itemsKey: String = "expense_item"
    
    init() {
        getExpenses()
    }
    
    func groupedExpenses() -> [ExpenseCategory: Double] {
        var groupedExpenses: [ExpenseCategory: Double] = [:]
        
        for expense in expenses {
            groupedExpenses[expense.category, default: 0] += expense.amount
        }
        
        return groupedExpenses
    }
    
    func getExpenses() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Expense].self, from: data)
        else { return }
        
        self.expenses = savedItems
        self.expenses.sort(by: { $0.date > $1.date })
    }
    
    func addItem(name: String, amount: Double, category: ExpenseCategory, date: Date) {
        let newExpense = Expense(name: name, amount: amount, category: category, date: date)
        expenses.append(newExpense)
        expenses.sort(by: { $0.date > $1.date })
        saveItems()
    }
    
    func deleteItem(indexSet: IndexSet) {
        expenses.remove(atOffsets: indexSet)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
}

extension ExpenseViewModel {
    func categoryExpenseSummary() -> [CategorySummary] {
        let groupedExpenses = Dictionary(grouping: expenses, by: { $0.category })
        return groupedExpenses.map { (category, expenses) in
            let totalAmount = expenses.reduce(0) { $0 + $1.amount }
            return CategorySummary(category: category, totalAmount: totalAmount)
        }
    }
}

struct CategorySummary: Identifiable {
    var id: ExpenseCategory { category }
    var category: ExpenseCategory
    var totalAmount: Double
}

