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
        Button("Take a photo") {
            showCamera = true
        }
        .sheet(isPresented: $showCamera) {
            CameraView(image: $selectedImage)
        }
    }
}

#Preview {
    MainScreenView()
}
