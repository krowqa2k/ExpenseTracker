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
        VStack(alignment: .leading) {
            Text("Latest transactions")
                .font(.headline)
                .fontWeight(.light)
                .padding(.horizontal)
            List() {
                ForEach(ExpenseViewModel.expenses){ expense in
                    TransactionRow(expense: expense)
                        .listRowBackground(Color.purple.opacity(0.1))
                }
            }
            .listStyle(InsetListStyle())
        }
    }
}

#Preview {
    ExpenseListView()
        .environmentObject(ExpenseViewModel())
}
