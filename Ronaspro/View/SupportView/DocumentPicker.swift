//
//  DocumentPicker.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 29.01.2021.
//

import SwiftUI
import UniformTypeIdentifiers
import FirebaseStorage

struct DocumentPicker: UIViewControllerRepresentable {
    
    
    @Binding var files: Set<LocalFileForFB>
    var taskID: String
    
    
    func makeCoordinator() -> DocumentPicker.Coordinator {
        return DocumentPicker.Coordinator(parentInit: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.content])
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
        
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        
        var parent: DocumentPicker
        
        init(parentInit: DocumentPicker) {
            parent = parentInit
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let fileName = urls.first?.lastPathComponent {
                let object = LocalFileForFB(name: fileName, path: urls.first!)
                parent.files.insert(object)
                print(urls.first!)
            }
            
        }
    }
    
}
