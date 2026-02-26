//
//  SwiftUI_CameraApp.swift
//  SwiftUI-Camera
//
//  Created by Dmytro Maksiutenko on 2026-02-25.
//

import SwiftUI

@main
struct SwiftUI_CameraApp: App {
    @State var selectedImage: UIImage? = nil
    var body: some Scene {
        WindowGroup {
            CameraView(image: $selectedImage)
        }
    }
}
