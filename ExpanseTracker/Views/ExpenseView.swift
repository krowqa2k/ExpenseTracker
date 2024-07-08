//
//  ContentView.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

struct ExpenseView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var expenseViewModel: ExpenseViewModel // Poprawna nazwa zmiennej
    let screenHeight: CGFloat = UIScreen.main.bounds.height

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("My Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .foregroundStyle(.purple)
                Text("Chart will be here")
                    .frame(width: 400, height: screenHeight/2.45)
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
        Image(systemName: isDarkMode ? "moon.fill" : "moon")
            .onTapGesture {
                isDarkMode.toggle()
            }
    }
    
    private var addExpenseIcon: some View {
        NavigationLink {
            ExpenseAddView()
        } label: {
            Image(systemName: "plus.app")
                .foregroundStyle(isDarkMode ? .white : .black)
        }
    }
}
