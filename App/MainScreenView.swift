//
//  MainScreenView.swift
//  SwiftUI-Camera
//
//  Created by Dmytro Maksiutenko on 2026-02-25.
//

import SwiftUI

public enum ViewState {
    case initial, showingCamera, showingImage
}

struct MainScreenView: View {
    @State var selectedImage: UIImage? = nil
    @State var viewState: ViewState = .initial
    
    var body: some View {
        switch self.viewState {
        case .initial:
            Button("Take a photo") {
                viewState = .showingCamera
            }
        case .showingCamera:
            CameraView(image: $selectedImage, showCamera: $viewState)
        case .showingImage:
            if let selectedImage {
                SelectedImageView(selectedImage: Binding($selectedImage)!, state: $viewState)
            } else {
                VStack(spacing: 12) {
                    Text("Image loading failed")
                    Button("Take a photo") {
                        viewState = .initial
                    }
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}

