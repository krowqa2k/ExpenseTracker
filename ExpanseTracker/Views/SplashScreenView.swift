//
//  SplashScreenView.swift
//  ExpanseTracker
//
//  Created by admin on 13/07/2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @State var isHomeRootScreen = false
    @State var scaleAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            if isHomeRootScreen {
                ExpenseView()
            } else {
                Image("AppLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scaleAmount)
                    .frame(width: 80)
            }
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 1)) {
                scaleAmount = 0.6
            }
            withAnimation(.easeInOut(duration: 1).delay(1)){
                scaleAmount = 35
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isHomeRootScreen = true
            }
        })
    }
}

#Preview {
    SplashScreenView()
        .environmentObject(ExpenseViewModel())
}
