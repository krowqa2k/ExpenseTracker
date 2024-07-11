//
//  ExpenseList.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

struct ExpenseListView: View {
    
    @EnvironmentObject private var viewModel: ExpenseViewModel
    @State private var checkClear: Bool = false
    @State private var showingAlert: Bool = false
    @State private var searchTerm: String = ""
    
    var filteredTransactions: [Expense] {
        guard !searchTerm.isEmpty else { return viewModel.expenses }
        return viewModel.expenses.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("All transactions:")
                        .font(.title3)
                        .foregroundStyle(Color.system)
                        .padding()
                    
                    Spacer()
                    
                    Button("Clear all") {
                        showingAlert.toggle()
                    }
                    .font(.title3)
                    .foregroundStyle(.red)
                    .padding()
                    .alert(isPresented: $showingAlert, content: {
                        if viewModel.expenses.count == 0 {
                            return Alert(title: Text("Nothing more to clear"),message: Text("Add something first!") ,dismissButton: .cancel(Text("Got it!")))
                        }
                        return Alert(title: Text("Clear transactions"), message: Text("Are you sure?"),
                                 primaryButton: .destructive(Text("Clear")) { viewModel.expenses.removeAll()},
                                 secondaryButton: .cancel(Text("Cancel")))
                    })
                        
                }
                List() {
                    ForEach(filteredTransactions){ expense in
                        TransactionRow(expense: expense)
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
                .searchable(text: $searchTerm, placement: .toolbar, prompt: "Search transactions")
                .padding(.horizontal, 4)
                .cornerRadius(12)
                .listStyle(PlainListStyle())
                .overlay {
                    if viewModel.expenses.isEmpty {
                        EmptyListView()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ExpenseListView()
            .environmentObject(ExpenseViewModel())
    }
}
