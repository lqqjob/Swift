//
//  UIViewRepresentableBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 6/11/25.
//

import SwiftUI

struct UIViewRepresentableBootcamp: View {
    @State private var text:String = ""
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Text("SwiftUI:")
                TextField("Type here",text:$text)
                    .frame(height: 55)
                    .background(.gray)
            }
            HStack {
                Text("UIKit:")
                UITextFieldViewRepresentable(text: $text)
                    .updatePlaceHolder("New placeholder!!!")
                    .frame(height: 55)
                    .background(.gray)
            }
        }
    }
}





struct UITextFieldViewRepresentable:UIViewRepresentable {
    @Binding var text:String
    var placeHolder:String
    let placeHolderColor:UIColor
    
    init(text: Binding<String>, placeHolder: String = "Default placeholder", placeHolderColor: UIColor = .red) {
        self._text = text
        self.placeHolder = placeHolder
        self.placeHolderColor = placeHolderColor
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    func updatePlaceHolder(_ text:String) -> UITextFieldViewRepresentable {
        var viewRepresentbale = self
        viewRepresentbale.placeHolder = text
        return viewRepresentbale
    }

    func makeUIView(context: Context) -> UITextField {
        let textfield = getTextField()
        textfield.delegate = context.coordinator
        return textfield;
    }
    private func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: "holder string", attributes: [.foregroundColor:UIColor.red])
        textField.attributedPlaceholder = placeholder
        return textField;
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator:NSObject,UITextFieldDelegate {
        @Binding var text:String
        init(text: Binding<String>) {
            self._text = text
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

#Preview {
    UIViewRepresentableBootcamp()
}
