//
//  EmptyListView.swift
//  ExpanseTracker
//
//  Created by admin on 10/07/2024.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "creditcard.trianglebadge.exclamationmark")
                    .resizable()
                    .frame(width: 100, height: 60)
                    .scaledToFit()
                
                Text("No expenses for now...")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                NavigationLink(destination: ExpenseAddView()) {
                    Text("Add something now!")
                        .padding(.vertical, 4)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
    }
}

#Preview {
    EmptyListView()
}
