//
//  ProspectsView.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/5.
//

import SwiftUI
import SwiftData
struct ProspectsView: View {
    enum FilterType {
        case none,contacted,uncontacted
    }
    let filter:FilterType
    @Query(sort:\Prospect.name) var prospects:[Prospect]
    @Environment(\.modelContext) var modelContext
    var title:String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted pepple"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    var body: some View {
        NavigationStack {
            List(prospects) {prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
                
            }
                .navigationTitle(title)
                .toolbar {
                    Button("Scan",systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "Paul Hudson", emailAddress: "paul@hackingwithswift.com", isContacted: false)
                        modelContext.insert(prospect)
                    }
                }
        }
    }
    
    init(filter:FilterType) {
        self.filter = filter
        if filter != .none {
            let showContactedOnly = filter == .contacted
            _prospects = Query(filter:#Predicate{
                $0.isContacted == showContactedOnly
            },sort: [SortDescriptor(\Prospect.name)])
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
