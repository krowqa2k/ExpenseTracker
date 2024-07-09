//
//  ExpenseList.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

struct ExpenseListView: View {
    
    @EnvironmentObject private var viewModel: ExpenseViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            List() {
                ForEach(viewModel.expenses){ expense in
                    TransactionRow(expense: expense)
                        .listRowBackground(Color.purple.opacity(0.1))
                }
                .onDelete(perform: viewModel.deleteItem)
            }
            .listStyle(InsetListStyle())
        }
    }
}

#Preview {
    ExpenseListView()
        .environmentObject(ExpenseViewModel())
}
