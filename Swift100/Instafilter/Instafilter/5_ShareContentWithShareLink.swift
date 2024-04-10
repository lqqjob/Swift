//
//  ShareContentWithShareLink.swift
//  Instafilter
//
//  Created by liqiang on 2024/4/10.
//

import SwiftUI

struct ShareContentWithShareLink: View {
    var body: some View {
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
        ShareLink(item:URL(string: "https://www.hackingwithswift.com")!,message: Text("Check out the 100 Days of SwiftUI!"))
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
        
        let example = Image("bmy")

        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ShareContentWithShareLink()
}
