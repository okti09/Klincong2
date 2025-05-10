//
//  CleaningToolsView.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 08/05/25.
//

import Foundation
import SwiftUI

struct CleaningToolsView: View {
    let tools: [CleaningTool] // Menerima alat dari halaman sebelumnya

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer(minLength: 40)
            
            // Judul
            VStack(spacing: 4) {
                Text(tools.isEmpty ? "No Tools Selected" : "Here is Your")
                    .font(.title3)
                    .fontWeight(.bold)
                if !tools.isEmpty {
                    Text("Cleaning Tools")
                        .font(.title)
                        .fontWeight(.black)
                }
            }

            // Grid alat yang dipilih
            LazyVGrid(columns: columns, spacing: 32) {
                ForEach(tools) { tool in
                    VStack(spacing: 10) {
                        Image(tool.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 90)
                        Text(tool.name)
                            .font(.subheadline)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            
            Spacer()
            
            // Tombol aksi
            Button(action: {
                print("Capture started with tools: \(tools.map { $0.name })")
            }) {
                Text("START CAPTURE TO CLEAN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(30)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 32)
        }
        .navigationBarBackButtonHidden(true)
        .background(
            Image("img_cleaningtools") // Pastikan ada di asset
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}
#Preview {
    CleaningToolsView(tools: [
        .init(name: "Broom", imageName: "img_sapu"),
        .init(name: "Mop", imageName: "img_pel")
    ])
}
