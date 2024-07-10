//
//  LineChartView.swift
//  ExpanseTracker
//
//  Created by admin on 10/07/2024.
//

import SwiftUI
import Charts

struct LineChartView: View {
    
    @EnvironmentObject private var viewModel: ExpenseViewModel
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        Chart {
            ForEach(viewModel.expenses) { expense in
                LineMark(
                    x: .value("Category", expense.category),
                    y: .value("Amount", expense.amount)
                )
                .foregroundStyle(by: .value("Category", expense.category))
                .symbol(by: .value("Category type", expense.category))
            }
        }
        .chartXScale(domain: 0...4000)
        .padding()
        .frame(width: 400, height: screenHeight/2.45)
    }
}


#Preview {
    LineChartView()
        .environmentObject(ExpenseViewModel())
}
