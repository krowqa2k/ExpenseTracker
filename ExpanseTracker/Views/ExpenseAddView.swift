//
//  ExpanseAddView.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

struct ExpenseAddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: ExpenseViewModel
    @State private var expenseName: String = ""
    @State private var expenseAmount: String = ""
    @State private var selectedCategory: ExpenseCategory = .food
    @State private var selectedDate: Date? = .now
    
    var body: some View {
        VStack {
            HStack {
                Text("Add Expense 💰")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Image(systemName: "bag.badge.plus")
                        .font(.title2)
                        .foregroundStyle(.purple)
                        .padding(.horizontal)
                })
            }
            Form {
                Section("Name") {
                    TextField("...", text: $expenseName)
                }
                .font(.subheadline)
                
                Section("Category") {
                    Picker("Select category:",selection: $selectedCategory) {
                        ForEach(ExpenseCategory.allCases) { category in
                            Text(category.rawValue).tag(category)
                                }
                        }
                        .pickerStyle(MenuPickerStyle())
                }
                .font(.subheadline)
                
                Section("Amount") {
                    TextField("PLN", text: $expenseAmount)
                        .keyboardType(.decimalPad)
                }
                .font(.subheadline)
                
                Section("Date of transaction") {
                    DatePicker(
                        "Select Date",
                        selection: Binding(
                            get: { selectedDate ?? Date() },
                            set: { selectedDate = $0 }
                        ),
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                }
                .font(.subheadline)
            }
        }
    }
    
    func saveButtonPressed() {
        guard let selectedDate = selectedDate else {
            print("Date not selected")
            return
        }
        
        let sanitizedAmount = expenseAmount.replacingOccurrences(of: ",", with: ".")
        if let amount = Double(sanitizedAmount) {
            viewModel.addItem(name: expenseName, amount: amount, category: selectedCategory, date: selectedDate)
            dismiss()
        } else {
            print("Invalid amount entered")
        }
    }
}

#Preview {
    NavigationStack {
        ExpenseAddView()
    }
    .environmentObject(ExpenseViewModel())
}
