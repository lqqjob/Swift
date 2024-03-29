//
//  MissionView.swift
//  Moonshot
//
//  Created by liqiang on 2024/3/24.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember:Hashable {
        let role:String
        let astronaut:Astronaut
    }
    
    let crew:[CrewMember]
    
    let mission:Mission
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {width,axis in
                        width * 0.6
                    }
                    .padding(.top)
                Rectangle()
                    .frame(height:2)
                    .foregroundColor(.lightBackground)
                    .padding(.vertical)
                Text("Crew")
                    .font(.title.bold())
                    .padding(.bottom,5)
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom,5)
                    Text(mission.description)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(crew,id: \.role) {crewMember in
                            NavigationLink(value:crewMember) {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width:104,height: 72)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white,lineWidth: 1)
                                        )
                                }
                                
                                VStack(alignment: .leading, content: {
                                    Text(crewMember.astronaut.name)
                                        .foregroundStyle(.white)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundStyle(.white.opacity(0.5))
                                })
                            }
//                            NavigationLink {
//                                AstronautView(astronaut: crewMember.astronaut)
//                            } label : {
//                                HStack {
//                                    Image(crewMember.astronaut.id)
//                                        .resizable()
//                                        .frame(width:104,height: 72)
//                                        .clipShape(.capsule)
//                                        .overlay(
//                                            Capsule()
//                                                .strokeBorder(.white,lineWidth: 1)
//                                        )
//                                }
//                                
//                                VStack(alignment: .leading, content: {
//                                    Text(crewMember.astronaut.name)
//                                        .foregroundStyle(.white)
//                                        .font(.headline)
//                                    Text(crewMember.role)
//                                        .foregroundStyle(.white.opacity(0.5))
//                                })
//                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    .navigationDestination(for: CrewMember.self) { selected in
                        AstronautView(astronaut: selected.astronaut)
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission,astronauts:[String:Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            }else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions:[Mission] = Bundle.main.decode("missions.json")
    let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
  return  MissionView(mission: missions[0],astronauts: astronauts)
        .preferredColorScheme(.dark)
}
