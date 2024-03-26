//
//  ContentView.swift
//  iExpense
//
//  Created by liqiang on 2024/3/20.
//

import SwiftUI

struct ExpenseItem:Identifiable,Codable {
    var id = UUID()
    let name:String
    let type:String
    let amount:Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodeItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodeItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                //由于我们的费用项目现在保证是唯一可识别的，我们不再需要告诉ForEach用于标识符的属性——它知道将有一个id属性，并且它将是唯一的，因为这是Identifiable协议的重点。
                ForEach(expenses.items) {item in
                    HStack {
                        VStack(alignment:.leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount,format:.currency(code: "USD"))
                            .foregroundStyle(item.amount < 10 ? .blue : item.amount < 100 ? .red : .yellow)
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
//                Button("Add Expense",systemImage: "plus") {
//
//                    showingAddExpense.toggle()
//                }
                NavigationLink("Add Expense") {
                       AddView(expenses: expenses)
                }
            }
        }
        .sheet(isPresented:$showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


struct AddView : View {
    @State private var name = "Name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    var expenses:Expenses
    let types = ["Business","Personal"]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form {
//                TextField("Name",text: $name)
                Picker("Type",selection: $type) {
                    ForEach(types,id: \.self)  {
                        Text($0)
                    }
                }
                
                TextField("Amount",value: $amount,format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let expense = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(expense)
                        expenses.items.sort {
                            if $0.type == $1.type  {
                              return  $0.amount > $1.amount
                            }
                            return  $0.type > $1.type
                        }
                        dismiss()
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
