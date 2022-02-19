//
//  AnimatedCheckboxView.swift
//  LearningEnvironment
//
//  Created by Duncan Kent on 19/02/2022.
//

import SwiftUI

struct AnimatedCheckboxView: View {
    
    let accentColor: Color
    let unselectedColor: Color
    @Binding var toggleOn: Bool
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(unselectedColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 160, height: 50, alignment: .leading)
                        .foregroundColor(accentColor),
                    alignment: toggleOn ? .trailing : .leading
                )
            
            HStack {
                
                Text ("Singles")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 150)
                    .foregroundColor(toggleOn ? Color.theme.secondaryText : Color.theme.primaryText)
                
                
                Text ("Doubles")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 150)
                    .foregroundColor(toggleOn ? Color.theme.primaryText : Color.theme.secondaryText)
                
            } // HSTACK
            .frame(maxWidth: .infinity)
            
        } // ZSTACK
        .frame(width: 300, height: 50)
        .onTapGesture {
            toggleOn.toggle()
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1.5), value: toggleOn)
        
        
    }
}

struct AnimatedCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCheckboxView(accentColor: Color.theme.accent,
                             unselectedColor: Color.theme.background2,
                             toggleOn: .constant(false))
    }
}
