//
//  ContentView.swift
//  Moonshot
//
//  Created by liqiang on 2024/3/22.
//

import SwiftUI

struct ContentView: View {
    /// 1、加载特定类型的可编码数据
    let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions:[Mission] = Bundle.main.decode("missions.json")
    let culums = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns:culums) {
                    ForEach(missions) {misson in
                        NavigationLink {
                            MissionView(mission: misson, astronauts: astronauts)
                        } label : {
                            VStack {
                                Image(misson.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100,height: 100)
                                    .padding()
                                VStack {
                                    Text(misson.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(misson.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth:.infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            
                            
                        }
                        
                    }
                }
                .padding([.horizontal,.bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
