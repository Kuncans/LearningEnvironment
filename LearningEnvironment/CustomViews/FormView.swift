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
            
            VStack (spacing: 32) {
                
                AnimatedCheckboxView(accentColor: Color.theme.accent,
                                     unselectedColor: Color.theme.background2,
                                     toggleOn: $playedSingles)
                    .padding(.horizontal)
                                
                //Slider(value: $winPercentage, in: 0...1)
                   // .padding(.horizontal)

                                
                HStack {
                    CircleProgressView(progress: $winPercentage,
                                       backgroundColor: Color.theme.background2,
                                       accentColor: Color.theme.accent,
                                       title: "Win Rate")
                        .frame(width: 150, height: 150)
                    
                    CircleProgressView(progress: $winPercentage,
                                       backgroundColor: Color.theme.background2,
                                       accentColor: Color.theme.accentReverse,
                                       title: "Loss Rate")
                        .frame(width: 150, height: 150)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                winPercentage = 0.67
                            }
                        }
                }
                .padding(.horizontal)
                
                BarCompareView(title: "Game 1", scoreOwn: 21, scoreOpponent: 18)
                BarCompareView(title: "Game 2", scoreOwn: 15, scoreOpponent: 21)
                BarCompareView(title: "Game 3", scoreOwn: 21, scoreOpponent: 5)
                
                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
