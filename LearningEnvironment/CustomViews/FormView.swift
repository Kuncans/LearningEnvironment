//
//  FormView.swift
//  LearningEnvironment
//
//  Created by Duncan Kent on 19/02/2022.
//

import SwiftUI

struct FormView: View {
    
    @State var playedSingles: Bool = true
    @State var winPercentage: Float = 0.0
    
    var body: some View {
        
        ZStack {
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                AnimatedCheckboxView(accentColor: Color.theme.accent,
                                     unselectedColor: Color.theme.background2,
                                     toggleOn: $playedSingles)
                
                Spacer()
                
                Slider(value: $winPercentage, in: 0...1)
                    .padding(.horizontal)
                
                CircleProgressView(progress: $winPercentage,
                                   backgroundColor: Color.theme.background2,
                                   accentColor: Color.theme.accent,
                                   title: "Win Rate")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            winPercentage = 0.52
                        }
                    }
                
                Spacer()
                
            }
           
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
