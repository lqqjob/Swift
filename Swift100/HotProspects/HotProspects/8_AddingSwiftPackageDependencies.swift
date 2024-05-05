//
//  AddingSwiftPackageDependencies.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/3.
//

import SwiftUI
import SamplePackage
struct AddingSwiftPackageDependencies: View {
    let possibleNumbers = 1...60//创建从1到60的数字范围
    var results:String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    var body: some View {
        Text(results)
    }
}

#Preview {
    AddingSwiftPackageDependencies()
}
