//
//  MatchHistoryCell.swift
//  LearningEnvironment
//
//  Created by Duncan Kent on 20/02/2022.
//

import SwiftUI

struct MatchHistoryCell: View {
    
    let matchType: MatchType
    let winStatus: Bool
    
    var body: some View {
        HStack {
            HStack {
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(
                            winStatus ? LinearGradient(colors : [Color.theme.accent.opacity(0.2), Color.theme.accent.opacity(0.01)],                                            startPoint: .leading, endPoint: .trailing) :
                                LinearGradient(colors: [Color.theme.accentReverse.opacity(0.2), Color.theme.accentReverse.opacity(0.01)],
                                                        startPoint: .leading, endPoint: .trailing)
                        )


                    
                    HStack {
                        Rectangle()
                        .frame(width: 4, height: 70, alignment: .center)
                        .foregroundColor(winStatus ? Color.theme.accent : Color.theme.accentReverse)
                        
                        Spacer()
                        
                        Text(winStatus ? "Win" : "Loss")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.theme.primaryText)
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 2, height: 10, alignment: .center)
                            .foregroundColor(.theme.primaryText)
                        
                        Spacer()
                        
                        Text(matchType.rawValue)
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.theme.primaryText)
                            .multilineTextAlignment(.center)
                            
                        
                        Spacer()
                    } // H STACK LEFT
                } // Z STACK
            } // H STACK RIGHT
            Color.blue
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }
}

struct Match {
    
    let matchType: MatchType
    let winStatus: Bool
    let playerNames: [String]
    let teamNames: [String]
    let gameScores: [Int:Int]
    let date: Date
    
}

struct MatchHistoryCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MatchHistoryCell(matchType: .doubles, winStatus: true)
            MatchHistoryCell(matchType: .singles, winStatus: false)
            MatchHistoryCell(matchType: .doublesMixed, winStatus: true)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

enum MatchType: String {
    case singles = "Singles"
    case doubles = "Doubles"
    case doublesMixed = "Mixed Doubles"
    
    var title: String {
        switch self {
        case .doubles:
            return rawValue
        case .singles:
            return rawValue
        case .doublesMixed:
            return rawValue
        }
    }
}

