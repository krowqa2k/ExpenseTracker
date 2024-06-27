//
//  ContentView.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

struct ExpenseView: View {
    
    @State private var darkMode: Bool = false
    @EnvironmentObject var ExpenseViewModel: ExpenseViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: Title
                VStack(spacing: 24) {
                    Text("My expenses")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: Chart
                
                // MARK: Transactions
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    darkModeIcon
                }
                ToolbarItem(placement: .topBarTrailing) {
                    addExpenseIcon
                }
            })
        }
    }
}

#Preview {
    ExpenseView()
        .environmentObject(ExpenseViewModel())
}

extension ExpenseView {
    private var darkModeIcon: some View {
        Image(systemName: darkMode ? "moon.fill" : "moon")
            .onTapGesture {
                darkMode.toggle()
            }
    }
    
    private var addExpenseIcon: some View {
        NavigationLink {
            ExpenseAddView()
        } label: {
            Image(systemName: "plus.app")
                .foregroundStyle(.black)
        }
    }
}
