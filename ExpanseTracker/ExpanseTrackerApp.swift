//
//  ExpanseTrackerApp.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
    @StateObject var ExpenseTracker: ExpenseViewModel = ExpenseViewModel()
    
    var body: some Scene {
        WindowGroup {
            ExpenseView()
                .environmentObject(ExpenseViewModel())
        }
    }
}
