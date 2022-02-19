//
//  FormView.swift
//  LearningEnvironment
//
//  Created by Duncan Kent on 19/02/2022.
//

import SwiftUI

struct FormView: View {
    
    @State var playedSingles: Bool = true
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            AnimatedCheckboxView(accentColor: Color.theme.accent,
                                 unselectedColor: Color.theme.secondaryText,
                                 toggleOn: $playedSingles)

        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
