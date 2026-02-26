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
    @Binding var showCamera: Bool
    @Environment(\.dismiss) private var dismiss
    
    public init(image: Binding<UIImage?>, showCamera: Binding<Bool>) {
        self._image = image
        self._showCamera = showCamera
    }
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
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
            // Dismiss the picker and then the SwiftUI presentation
            picker.dismiss(animated: true) {
                self.parent.dismiss()
                self.parent.showCamera = false
            }
        }
        
        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true) {
                self.parent.dismiss()
                self.parent.showCamera = false
            }
        }
    }
}

