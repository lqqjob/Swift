//
//  SafariView.swift
//  iAppStore
//
//  Created by Mlqq on 2025/1/20.
//

import SwiftUI
import SafariServices

struct SafariView:UIViewControllerRepresentable {
    let url:URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: url)
        controller.dismissButtonStyle = .close
        return controller
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
}
