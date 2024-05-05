//
//  ResultType.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/1.
//

import SwiftUI
// 无论您如何处理它，Result的优点是，它允许我们将某些工作的全部成功或失败存储在单个值中，将其传递到任何我们需要的地方，并且仅在我们准备好时才读取错误。
struct ResultType: View {
    @State private var output = ""
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    func fetchReadings() async {
        
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data,_) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result;
        do {
            output = try result.get()
        } catch {
            output = "Error: \(error.localizedDescription)"
        }
        
        switch result {
            case .success(let str):
                output = str
            case .failure(let error):
                output = "Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ResultType()
}
