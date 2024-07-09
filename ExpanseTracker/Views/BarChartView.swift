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
                    x: .value("Category", expense.category),
                    y: .value("Amount", expense.amount)
                )
                .foregroundStyle(Color.purple.gradient)
                .cornerRadius(4)
            }
        }
        .padding()
        .frame(width: 400, height: screenHeight/2.45)
        .chartPlotStyle { plotContent in
            plotContent
                .background(.black.gradient.opacity(0.4))
        }
        .chartYScale(domain: 0...3000)
    }
}

#Preview {
    BarChartView()
        .environmentObject(ExpenseViewModel())
}

