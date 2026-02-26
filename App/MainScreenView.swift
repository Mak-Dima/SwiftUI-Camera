//
//  MainScreenView.swift
//  SwiftUI-Camera
//
//  Created by Dmytro Maksiutenko on 2026-02-25.
//

import SwiftUI

struct MainScreenView: View {
    @State var selectedImage: UIImage? = nil
    @State var showCamera: Bool = false
    
    var body: some View {
        if showCamera {
            CameraView(image: $selectedImage, showCamera: $showCamera)
        } else {
            Button("Take a photo") {
                showCamera = true
            }
        }
    }
}

#Preview {
    MainScreenView()
}
