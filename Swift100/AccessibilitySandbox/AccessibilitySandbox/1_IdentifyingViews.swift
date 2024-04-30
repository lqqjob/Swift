//
//  IdentifyingViews.swift
//  AccessibilitySandbox
//
//  Created by liqiang on 2024/4/27.
//

import SwiftUI

struct IdentifyingViews: View {
    let pictures = [
            "ales-krivec-15949",
            "galina-n-189483",
            "kevin-horstmann-141705",
            "nicolas-tissot-335096"
        ]
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    @State private var selectedPictrue = Int.random(in: 0...3)
    var body: some View {
       Image(pictures[selectedPictrue])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPictrue = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPictrue])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
        
        Button {
            selectedPictrue = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedPictrue])
                 .resizable()
                 .scaledToFit()
        }
        .accessibilityLabel(labels[selectedPictrue])
    }
}

#Preview {
    IdentifyingViews()
}
