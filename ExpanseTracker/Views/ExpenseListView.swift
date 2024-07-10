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
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("All transactions")
                        .font(.title3)
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
                    ForEach(viewModel.expenses){ expense in
                        TransactionRow(expense: expense)
                            .listRowBackground(Color.purple.opacity(0.2).cornerRadius(12))
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
                .padding(.horizontal)
                .listStyle(InsetListStyle())
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
