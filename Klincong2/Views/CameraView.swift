//
//  CameraView.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 07/05/25.
//

import Foundation
import SwiftUI

struct CameraView: View {
    var onCapture: (UIImage) -> Void
    
    var body: some View {
        VStack {
            // Tampilan kamera (misalnya, menggunakan AVFoundation atau library kamera lainnya)
            Text("Camera Preview Here")
                .font(.title)
                .foregroundColor(.white)
            
            Button("Capture") {
                // Ambil gambar dan kirimkan ke callback
                let capturedImage = UIImage() // Ganti dengan gambar yang sebenarnya
                onCapture(capturedImage)
            }
            .foregroundColor(.orange)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CameraView { _ in }
}
