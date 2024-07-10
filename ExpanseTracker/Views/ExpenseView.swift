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
    case lineChart
    
    var id: String { self.rawValue }
}

struct ExpenseView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var expenseViewModel: ExpenseViewModel // Poprawna nazwa zmiennej
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    @State private var chartCategory = ChartCategory.barChart
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("My Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .foregroundStyle(.purple)
                
                Picker("Chart", selection: $chartCategory){
                    Image(systemName: "chart.bar.fill")
                        .tag(ChartCategory.barChart)
                    Image(systemName: "chart.pie.fill")
                        .tag(ChartCategory.pieChart)
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .tag(ChartCategory.lineChart)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                if chartCategory == ChartCategory.pieChart {
                    PieChartView()
                } else if chartCategory == ChartCategory.barChart {
                    BarChartView()
                } else {
                    LineChartView()
                }
                
                
                HStack(){
                    Text("Latest transactions: ")
                        .padding(.horizontal)
                    Spacer()
                    ZStack(){
                        NavigationLink(destination: ExpenseListView()) {
                            Text("See all here...")
                                .foregroundStyle(.black)
                                .padding(.horizontal)
                                .background(Color(UIColor.secondaryLabel))
                                .cornerRadius(8)
                        }
                        .padding(3)
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
