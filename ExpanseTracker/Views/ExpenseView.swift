//
//  ContentView.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

struct ExpenseView: View {
    @State private var darkMode: Bool = false
    @EnvironmentObject var expenseViewModel: ExpenseViewModel // Poprawna nazwa zmiennej

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("My Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                Text("Chart will be here")
                    .frame(width: 400, height: 400)
                NavigationLink(destination: ExpenseListView()) {
                    ZStack(alignment: .trailing){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(maxWidth: .infinity, maxHeight: 20)
                            .opacity(0)
                        Text("See all here...")
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                            .frame(width: 140, height: 25)
                            .background(Color(UIColor.lightGray))
                            .cornerRadius(8)
                    }
                }
                ExpenseListView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    darkModeIcon
                }
                ToolbarItem(placement: .topBarTrailing) {
                    addExpenseIcon
                }
            }
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
