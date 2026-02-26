//
//  CameraView.swift
//  SwiftUI-Camera
//
//  Created by Dmytro Maksiutenko on 2026-02-25.
//

import Foundation
import UIKit
import SwiftUI

public struct CameraView: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var state: ViewState
    @Environment(\.dismiss) private var dismiss
    
    public init(image: Binding<UIImage?>, showCamera: Binding<ViewState>) {
        self._image = image
        self._state = showCamera
    }
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        public func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true) {
                self.parent.dismiss()
                self.parent.state = .showingImage
            }
        }
        
        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true) {
                self.parent.dismiss()
                self.parent.state = .initial
            }
        }
    }
}

