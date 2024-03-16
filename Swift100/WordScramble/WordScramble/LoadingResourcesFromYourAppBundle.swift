//
//  LoadingResourcesFromYourAppBundle.swift
//  WordScramble
//
//  Created by liqiang on 2024/3/16.
//

import SwiftUI

struct LoadingResourcesFromYourAppBundle: View {
    var body: some View {
        if let fileUrl = Bundle.main.url(forResource: "Some-file", withExtension: "txt") {
            if let fileContent = try? String(contentsOf: fileUrl) {
                
            }
        }
        
       return Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LoadingResourcesFromYourAppBundle()
}
