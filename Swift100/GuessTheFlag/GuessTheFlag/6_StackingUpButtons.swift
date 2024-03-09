//
//  StackingUpButtons.swift
//  GuessTheFlag
//
//  Created by liqiang on 2024/3/9.
//

import SwiftUI

struct StackingUpButtons: View {
   @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
        .shuffled() //数组随机
   @State private var correctAnswer = Int.random(in: 0...2)
    
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
//            Color.blue
//                .ignoresSafeArea()
//            LinearGradient(colors: [.blue,.black], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            RadialGradient(stops:[.init(color: .blue, location: 0.3),.init(color: .red, location: 0.3)],center: .top,startRadius: 200,endRadius: 700)
                .ignoresSafeArea()
            VStack{
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing:15){
                     VStack {
                         Text("Tap the flag of")
                             .foregroundStyle(.secondary)
                             .font(.subheadline.weight(.heavy))
                         Text(countries[correctAnswer])
//                             .foregroundStyle(.white)
                             .font(.largeTitle.weight(.semibold))
                     }
                     
                     ForEach(0..<3) {number in
                         Button {
                             flagTapped(number)
                         } label: {
                             Image(countries[number])
                                 .clipShape(.capsule)
                                 .shadow(radius: 5)

                         }
                     }
                 }
                .frame(maxWidth:.infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
              
                
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue",action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number:Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        }else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    StackingUpButtons()
}
