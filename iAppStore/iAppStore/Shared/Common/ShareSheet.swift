//
//  ShareSheet.swift
//  iAppStore
//
//  Created by liqiang on 2/21/25.
//

import Foundation
import SwiftUI

struct ShareSheet:UIViewControllerRepresentable {
    var items:[Any]
    var excludedActivityTypes:[UIActivity.ActivityType]? = nil
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        controller.excludedActivityTypes = excludedActivityTypes
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
