//
//  ContentView.swift
//  Bookworm
//
//  Created by liqiang on 2024/4/1.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books:[Book]
    @State private var showingAddScreen = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) {book in
                    HStack {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        VStack(alignment: .leading, content: {
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        })
                    }
                    
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add book",systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                        
                    }
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
        }
    }
}

#Preview {
    ContentView()
}
