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
    let accentReverse = Color("AccentColorReverse")
    let background = Color("BackgroundColor")
    let background2 = Color("BackgroundColor2")
    let background3 = Color("BackgroundColor3")
    let primaryText = Color("PrimaryText")
    let secondaryText = Color("SecondaryText")
    
}
