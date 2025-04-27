//
//  TabBarItem.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/27/25.
//

import Foundation
import SwiftUI
enum TabBarItem:Hashable {
   case home,favorites,profile,message
    
    var iconName:String {
        switch self {
        case .home:return "house"
        case .favorites:return "heart"
        case .profile:return "person"
        case .message:return "message"
        }
    }
    
    var title:String {
        switch self {
        case .home:return "home"
        case .favorites:return "Favorites"
        case .profile:return "Profile"
        case .message:return "Message"
        }
    }
    
    var color:Color {
        switch self {
        case .home:return Color.red
        case .favorites: return Color.blue
        case .profile: return Color.green
        case .message: return Color.orange
        }
    }
}
