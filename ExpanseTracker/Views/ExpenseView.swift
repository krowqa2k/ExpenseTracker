//
//  ContentView.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI
import Charts

enum ChartCategory: String, CaseIterable, Identifiable {
    case pieChart
    case barChart
    
    var id: String { self.rawValue }
}

struct ExpenseView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    @State private var chartCategory = ChartCategory.barChart
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("My Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 4)
                    .foregroundStyle(.purple)
                
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
                        .padding(.horizontal, 5)
                    Spacer()
                    ZStack(){
                        NavigationLink(destination: ExpenseListView()) {
                            Text("See all here...")
                                .foregroundStyle(.black)
                                .padding(.horizontal, 6)
                                .background(Color(UIColor.secondaryLabel))
                                .cornerRadius(8)
                        }
                        .padding(3)
                    }
                }
                
                List() {
                    ForEach(expenseViewModel.expenses){ expense in
                        TransactionRow(expense: expense)
                            .listRowBackground(Color.purple.opacity(0.3).cornerRadius(12))
                    }
                    .onDelete(perform: expenseViewModel.deleteItem)
                }
                .listStyle(InsetListStyle())
                .listRowSpacing(8)
                .padding(.horizontal,4)
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
