//
//  ProtocolBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 6/26/25.
//

import SwiftUI


protocol ColorThemeProtocal {
    var primary:Color { get }
    var secondary:Color { get }
    var tertiary:Color { get }
}

protocol ButtonTextProtocol {
    var buttonText:String {get}
}

protocol ButtonPressedProtocol {
    func buttonPressed()
}

struct DefaultColorTheme : ColorThemeProtocal {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AnotherColorTheme:ColorThemeProtocal {
    var primary: Color = .blue
    var secondary: Color = .red
    var tertiary: Color = .purple
}

protocol ButtonDataSoureProtocol:ButtonTextProtocol,ButtonPressedProtocol {
    
}

class DefaultDataSoure : ButtonDataSoureProtocol {
    var buttonText: String = "Protocols are awesome!"
    func buttonPressed() {
        print("Button was pressed")
    }
}
class AlternativeDataSoure:ButtonTextProtocol {
    var buttonText: String = "Protocols are lame."
}

struct ProtocolBootcamp: View {
    let colorTheme:ColorThemeProtocal
    let dataSource:ButtonDataSoureProtocol
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

#Preview {
    ProtocolBootcamp(colorTheme: DefaultColorTheme(), dataSource: DefaultDataSoure())
}
