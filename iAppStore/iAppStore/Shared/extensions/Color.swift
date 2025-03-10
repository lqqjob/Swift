//
//  Color.swift
//  iAppStore
//
//  Created by liqiang on 20/01/2025.
//

import Foundation
import SwiftUI

extension Color {
    public static var tsmg_blue: Color {
        Color("tsmg_blue", bundle: nil)
    }
    static var tsmg_systemBackground: Color {
        Color(UIColor.systemBackground)
    }
    static var tsmg_tertiarySystemGroupedBackground: Color {
        Color(UIColor.tertiarySystemGroupedBackground)
    }
    static var tsmg_label:Color {
        Color(UIColor.label)
    }
    static var tsmg_placeholderText:Color {
        Color(UIColor.placeholderText)
    }
    static var tsmg_secondaryLabel: Color {
        Color(UIColor.secondaryLabel)
    }
    static var tsmg_tertiaryLabel: Color {
        Color(UIColor.tertiaryLabel)
    }
}
