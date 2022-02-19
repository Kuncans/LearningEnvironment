//
//  CircleProgressView.swift
//  LearningEnvironment
//
//  Created by Duncan Kent on 19/02/2022.
//

import SwiftUI

struct CircleProgressView: View {
    
    @Binding var progress: Float
    let backgroundColor: Color
    let accentColor: Color
    let title: String
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.largeTitle)
                .foregroundColor(Color.theme.primaryText)
                .padding(.bottom, 24)
            
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 25)
                    .foregroundColor(backgroundColor)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(progress))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(accentColor)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 1.5), value: progress)
                
                Text("\(progress * 100, specifier: "%.0f")%")
                    .font(.largeTitle)
                    .foregroundColor(Color.theme.primaryText)
                
            }
            .frame(width: 200, height: 200)
        }
        

    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView(progress: .constant(0.43), backgroundColor: Color.theme.background2, accentColor: Color.theme.accent, title: "Win Rate")
    }
}
