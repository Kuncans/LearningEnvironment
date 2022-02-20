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
    
    @State private var scoreOwnAnimate: Int = 0
    @State private var scoreOpponentAnimate: Int = 0

    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundColor(Color.theme.primaryText)
            
            HStack {
                
                Text("\(scoreOwn)")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color.theme.primaryText)
                
                HStack {
                    ProgressView(value: CGFloat(scoreOwnAnimate), total: 21)
                        .progressViewStyle(.linear)
                        .tint(scoreOwn == 21 ? Color.theme.accent : Color.theme.primaryText)
                        .background(Color.theme.background)
                        .rotationEffect(Angle(degrees: 180))
                        .animation(.spring(response: 0.2, dampingFraction: 0.9, blendDuration: 0.5), value: scoreOwnAnimate)
                        .scaleEffect(x: 1.0, y: 2.0, anchor: .center)

                }

                HStack {
                    ProgressView(value: CGFloat(scoreOpponentAnimate), total: 21)
                        .progressViewStyle(.linear)
                        .tint(scoreOpponent == 21 ? Color.theme.accentReverse : Color.theme.primaryText)
                        .background(Color.theme.background)
                        .animation(.spring(response: 0.2, dampingFraction: 0.9, blendDuration: 0.5), value: scoreOpponentAnimate)
                        .scaleEffect(x: 1.0, y: 2.0, anchor: .center)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(scoreOpponent)")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color.theme.primaryText)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 16)
            .padding(.horizontal)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                scoreOwnAnimate = scoreOwn
                scoreOpponentAnimate = scoreOpponent
            }
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
