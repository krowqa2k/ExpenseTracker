//
//  ChartView.swift
//  ExpanseTracker
//
//  Created by admin on 09/07/2024.
//

import SwiftUI
import Charts

struct PieChartView: View {
    
    @EnvironmentObject private var viewModel: ExpenseViewModel
    let screenHeight: CGFloat = UIScreen.main.bounds.height
   
    var body: some View {
        Chart {
            ForEach(viewModel.categoryExpenseSummary()) { categorySummary in
                SectorMark(
                    angle: .value("Category", categorySummary.totalAmount),
                    angularInset: 1.0
                )
                .foregroundStyle(by: .value("Category", categorySummary.category.rawValue))
                .cornerRadius(6)
            }
        }
        .padding()
        .frame(width: 400, height: screenHeight/2.45)
        .overlay {
            if viewModel.expenses.isEmpty {
                ContentUnavailableView.init("No Transactions", systemImage: "cart.badge.questionmark", description: Text("Add at least one transaction to see it on the chart!"))
            }
        }
    }
}

#Preview {
    PieChartView()
        .environmentObject(ExpenseViewModel())
}
