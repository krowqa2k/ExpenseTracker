//
//  ExpenseList.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

struct ExpenseListView: View {
    
    @EnvironmentObject private var ExpenseViewModel: ExpenseViewModel
    
    var body: some View {
        List {
            ForEach(ExpenseViewModel.expenses){ expense in
                TransactionRow(expense: expense)
            }
        }
    }
}

#Preview {
    ExpenseListView()
        .environmentObject(ExpenseViewModel())
}
