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
            ForEach(viewModel.expenses) { stream in
                SectorMark(angle: .value("Stream", stream.amount),
                           angularInset: 1.0)
                    .foregroundStyle(by: .value("Category", stream.category))
                    .cornerRadius(6)
            }
        }
        .padding()
        .frame(width: 400, height: screenHeight/2.45)
    }
}

#Preview {
    PieChartView()
        .environmentObject(ExpenseViewModel())
}
