//
//  UIViewControllerRepresentableBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 6/13/25.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    @State private var showController:Bool = false;
    @State private var image:UIImage?
    var body: some View {
        Text("Hi")
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
        }
        Button  {
            showController.toggle()
        } label: {
            Text("click here")
        }
        .sheet(isPresented: $showController) {
//            BasicViewControllerRepresentable(string: "New string")
            UIImgePikerControllerRepresentable(image: $image, showPiker: $showController)
        }

    }
}

struct UIImgePikerControllerRepresentable : UIViewControllerRepresentable {
    @Binding var image:UIImage?
    @Binding var showPiker:Bool
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.allowsEditing = false;
        controller.delegate = context.coordinator
        return controller;
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(image:$image,showPicker: $showPiker)
    }
    
    class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        @Binding var image:UIImage?
        @Binding var showPicker:Bool;
        init(image: Binding<UIImage?>,showPicker:Binding<Bool>) {
            self._image = image
            self._showPicker = showPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            showPicker = false
            guard let newImage = info[.originalImage] as? UIImage else {return}
            image = newImage
        }
        
    }
    
}


struct BasicViewControllerRepresentable:UIViewControllerRepresentable {
    let string:String;
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller =  BasicViewController()
        controller.textString = string
        return controller;
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class BasicViewController:UIViewController {
    var textString:String = "hello"
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = textString
        label.frame = view.frame
        label.backgroundColor = UIColor.red
        view.addSubview(label)
    }
    
}
#Preview {
    UIViewControllerRepresentableBootcamp()
}
