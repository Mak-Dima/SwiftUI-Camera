//
//  SelectedImageView.swift
//  SwiftUI-Camera
//
//  Created by Dmytro Maksiutenko on 2026-02-26.
//

import SwiftUI

struct SelectedImageView: View {
    
    @Binding var selectedImage: UIImage
    @Binding var state: ViewState
    
    var body: some View {
        ZStack {
            Image(uiImage: selectedImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()

            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 100) {
                    Button("Delete") {
                        selectedImage = UIImage()
                        state = .initial
                    }
                    Button("Save") {
                        UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
                        state = .initial
                    }
                }
                .buttonStyle(.glass)
                .padding(.bottom, 24)
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    @Previewable @State var image: UIImage = UIImage()
    @Previewable @State var state: ViewState = .showingImage
    SelectedImageView(selectedImage: $image, state: $state)
}
