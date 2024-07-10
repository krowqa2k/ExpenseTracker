//
//  BarChartView.swift
//  ExpanseTracker
//
//  Created by admin on 09/07/2024.
//

import SwiftUI
import Charts

struct BarChartView: View {
    
    @EnvironmentObject private var viewModel: ExpenseViewModel
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        Chart {
            ForEach(viewModel.expenses) { expense in
                BarMark(
                    x: .value("Category", expense.category.rawValue),
                    y: .value("Amount", expense.amount)
                )
                .foregroundStyle(by: .value("Category", expense.category.rawValue))
                .cornerRadius(4)
            }
        }
        .padding()
        .frame(width: 400, height: screenHeight/2.45)
        .overlay {
            if viewModel.expenses.isEmpty {
                ContentUnavailableView.init("No Transactions", systemImage: "cart.badge.questionmark", description: Text("Add at least one transaction to see it on the chart!"))
            }
        }
        .chartPlotStyle { plotContent in
            if viewModel.expenses.isEmpty {
                plotContent
                    .background()
            } else {
                plotContent
                    .background(.black.gradient.opacity(0.4))
            }
        }
    }
}



#Preview {
    BarChartView()
        .environmentObject(ExpenseViewModel())
}

