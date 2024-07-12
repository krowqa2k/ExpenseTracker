//
//  Extensions.swift
//  ExpanseTracker
//
//  Created by admin on 27/06/2024.
//

import Foundation
import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
