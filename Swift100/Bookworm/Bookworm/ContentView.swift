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
    @Query(sort: \Book.title) var book1:[Book]
    @Query(sort:\Book.rating,order: .reverse) var book2:[Book]
    @Query(sort:[SortDescriptor(\Book.title)]) var book3:[Book]
    @Query(sort:[SortDescriptor(\Book.title,order: .reverse)]) var book4:[Book]
    @Query(sort:[
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var book5:[Book]

    @State private var showingAddScreen = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) {book in
                    NavigationLink(value:book) {
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
                .onDelete(perform: deleteBooks)
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add book",systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                        
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
                .navigationDestination(for: Book.self) {book in
                    DetailView(book: book)
                    
                }
        }
    }
    
    func deleteBooks(at offsets:IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
