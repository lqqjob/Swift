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
    @State private var selectedProspects = Set<Prospect>()
    var body: some View {
        NavigationStack {
            List(prospects,selection: $selectedProspects) {prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    if prospect.isContacted {
                        Button("Mark Uncontacted",systemImage: "person.crop.circle.badge.xmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    }else {
                        Button("Mark Contacted",systemImage: "person.crop.circle.fill.badge.checkmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                    }
                   
                }
                .tag(prospect)
                
            }
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Scan", systemImage: "qrcode.viewfinder") {
//                            isShowingScanner = true
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                            
                    }
                    if selectedProspects.isEmpty == false {
                        ToolbarItem(placement: .bottomBar) {
                            Button("Delete Selected", action: delete)
                        }
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
    
    func delete() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
