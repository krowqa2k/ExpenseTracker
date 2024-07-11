//
//  ContentView.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI
import Charts

struct ExpenseView: View {
    @AppStorage("isDarkMode") private var isDarkMode = true
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    @State private var chartCategory = ChartCategory.barChart
    
    var body: some View {
        NavigationStack {
            Text("My Expenses")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .foregroundStyle(Color.system)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(expenseViewModel.totalExpenses, specifier: "%.2f") PLN")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .center) {
                Picker("Chart", selection: $chartCategory){
                    Image(systemName: "chart.bar.fill")
                        .tag(ChartCategory.barChart)
                    Image(systemName: "chart.pie.fill")
                        .tag(ChartCategory.pieChart)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                if chartCategory == ChartCategory.pieChart { PieChartView() }
                else  { BarChartView() }
                
                HStack(){
                    Text("Latest transactions: ")
                        .font(.headline)
                        .padding(.horizontal)
                        .foregroundStyle(Color.system)
                    Spacer()
                    ZStack(){
                        NavigationLink(destination: ExpenseListView()) {
                            Text("See all here...")
                                .foregroundStyle(.black)
                                .padding(.horizontal, 6)
                                .background(Color.system.opacity(0.8))
                                .cornerRadius(8)
                        }
                        .padding(3)
                    }
                }
                
                List() {
                    ForEach(expenseViewModel.expenses){ expense in
                        TransactionRow(expense: expense)
                    }
                    .onDelete(perform: expenseViewModel.deleteItem)
                }
                .listStyle(InsetListStyle())
                .listRowSpacing(8)
                .padding(.horizontal,8)
                .overlay {
                    if expenseViewModel.expenses.isEmpty { EmptyListView() }
                }
            }
            .padding(.horizontal,2)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    darkModeIcon
                }
                ToolbarItem(placement: .topBarTrailing) {
                    addExpenseIcon
                }
            }
        }
        .tint(.system)
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
