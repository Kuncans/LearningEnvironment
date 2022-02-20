//
//  BarCompareView.swift
//  LearningEnvironment
//
//  Created by Duncan Kent on 20/02/2022.
//

import SwiftUI

struct BarCompareView: View {

    let title: String
    let scoreOwn: Int
    let scoreOpponent: Int
    

    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundColor(Color.theme.primaryText)
            
            HStack {
                
                Text("\(scoreOwn)")
                
                HStack {
                    ProgressView(value: CGFloat(scoreOwn), total: 21)
                        .progressViewStyle(.linear)
                        .tint(scoreOwn == 21 ? Color.theme.accent : Color.theme.primaryText)
                        .rotationEffect(Angle(degrees: 180))
                        .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1.5).delay(3.0), value: scoreOwn)

                }

                HStack {
                    ProgressView(value: CGFloat(scoreOpponent), total: 21)
                        .progressViewStyle(.linear)
                        .tint(scoreOpponent == 21 ? Color.theme.accentReverse : Color.theme.primaryText)
                        .background(Color.theme.background3)
                        .animation(.spring().delay(3.0), value: scoreOpponent)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(scoreOpponent)")
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 16)
            .padding(.horizontal)
        }
    }
}

struct BarCompareView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarCompareView(title: "Game 1", scoreOwn: 21, scoreOpponent: 21)
            BarCompareView(title: "Game 1", scoreOwn: 15, scoreOpponent: 21)
            BarCompareView(title: "Game 1", scoreOwn: 21, scoreOpponent: 7)
        }
        .padding(.bottom)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
