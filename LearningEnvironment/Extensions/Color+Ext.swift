//
//  Color+Ext.swift
//  LearningEnvironment
//
//  Created by Duncan Kent on 19/02/2022.
//
import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let primaryText = Color("PrimaryText")
    let secondaryText = Color("SecondaryText")
    
}
