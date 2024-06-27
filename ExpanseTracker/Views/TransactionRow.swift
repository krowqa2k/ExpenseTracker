//
//  TransactionRow.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

struct TransactionRow: View {
    
    let expense: Expense
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.headline)
                    .fontWeight(.medium)
                Text(expense.category)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Text(expense.dateParsed, format: .dateTime.year().month().day())
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(expense.amount, format: .currency(code: "PLN"))
                .font(.subheadline)
                .fontWeight(.semibold)
                .bold()
                .padding(4)
        }
        .padding(.leading)
    }
}

#Preview {
    TransactionRow(expense: Expense(name: "iPhone 15 Pro", amount: 3899.99, category: "Electronic", date: "27/06/2024"))
}
