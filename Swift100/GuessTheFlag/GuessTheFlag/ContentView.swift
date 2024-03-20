//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by liqiang on 2024/3/7.
//

import SwiftUI


struct FlagImage:View {
    var imageName:String
    var body: some View {
    Image(imageName)
            .font(.largeTitle.weight(.semibold))
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
         .shuffled() //数组随机
    @State private var correctAnswer = Int.random(in: 0...2)
     
     
     @State private var showingScore = false
     @State private var scoreTitle = ""
     @State private var score = 0
     @State private var message = ""
     
     @State private var showGameOver = false
     @State private var playCount = 0;
    
    @State private var animationAmount = 0.0
    @State private var clickIndex = -1;
     
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
                              clickIndex = number
                              flagTapped(number)
                              withAnimation {
                                  animationAmount -= 360
                              }
                          } label: {
                             FlagImage(imageName: countries[number])

                          }
                          
                          .opacity(clickIndex == number ? 1 : 0.25)
                          .scaleEffect(clickIndex == number ? 1 : 0.8)
                          .animation(.default,value: clickIndex)
                          .rotation3DEffect(
                            .degrees(clickIndex == number ? animationAmount : 0),
                                                  axis: (x: 0.0, y: 1.0, z: 0.0)
                          )
                      }
                  }
                 .frame(maxWidth:.infinity)
                 .padding(.vertical,20)
                 .background(.regularMaterial)
                 .clipShape(.rect(cornerRadius: 20))
               
                 
                 Text("Score: \(score)")
                     .foregroundStyle(.white)
                     .font(.title.bold())
                 
                 Spacer()
             }
             .padding()
         }
         .alert(scoreTitle, isPresented: $showingScore) {
             Button("Continue",action: askQuestion)
         } message: {
             Text(message)
         }
         .alert("Game Over", isPresented:$showGameOver) {
             Button("Restat") {
                 score = 0
                 askQuestion()
                 playCount = 0;
                 clickIndex = -1
             }
         } message: {
             Text("Your total score is \(score)")
         }
     }
     
     func flagTapped(_ number:Int) {
         if number == correctAnswer {
             scoreTitle = "Correct"
             score += 1
             message = "Your score is \(score)"
         }else {
             scoreTitle = "Wrong"
             message = "Wrong! That’s the flag of \(countries[number])"
         }
         
         showingScore = true
         playCount += 1
         if playCount >= 8 {
             showGameOver = true
         }
     }
     
     func askQuestion() {
         clickIndex = -1
         withAnimation {
             countries.shuffle()
             correctAnswer = Int.random(in: 0...2)
         }
         
     }
 }

#Preview {
    ContentView()
}
