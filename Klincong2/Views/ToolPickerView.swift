//
//  ToolSelectionView.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 08/05/25.
//

import Foundation
import SwiftUI

//Kode 3
struct CleaningToolPicker: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct ToolPickerView: View {
    @State private var selectedTools: Set<CleaningTool> = []
    
    let dryTools: [CleaningTool] = [
        .init(name: "Broom", imageName: "img_sapu"),
        .init(name: "Dustpan", imageName: "img_pengki"),
        .init(name: "Vacuum", imageName: "img_vakum"),
        .init(name: "Duster", imageName: "img_kemoceng"),
        .init(name: "Cloth", imageName: "img_lap"),
        .init(name: "Trash Bin", imageName: "img_kotaksampah")
    ]
    
    let wetTools: [CleaningTool] = [
        .init(name: "Mop", imageName: "img_pel"),
        .init(name: "Toilet Brush", imageName: "img_sikat"),
        .init(name: "Sponge", imageName: "img_spons")
    ]
    
    let SolutionTools: [CleaningTool] = [
        .init(name: "Mop", imageName: "img_pel"),
        .init(name: "Toilet Brush", imageName: "img_sikat"),
        .init(name: "Toilet Brush", imageName: "img_sikat"),
        .init(name: "Toilet Brush", imageName: "img_sikat"),
        .init(name: "Sponge", imageName: "img_spons")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("biruy").ignoresSafeArea()
            VStack(spacing: 0) {
                
                ZStack(alignment: .topTrailing) {
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer().frame(height: 60)
                        
                        Text("Tools You’ve\nGot at Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Tap to choose!")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.6))
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.kuneng)
                    .zIndex(0)
                    
                    Image("img_okcat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 275, height: 205)
                        .rotationEffect(.degrees(-25))
                        .offset(x: 125, y: -5)
                        .zIndex(1)
                }
                .frame(maxWidth: .infinity)
                .clipped()
                
                // Pilihan Tools
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Dry Section
                        Text("Dry")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(dryTools) { tool in
                                    ToolCard(tool: tool, isSelected: selectedTools.contains(tool)) {
                                        toggleSelection(tool)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Wet Section
                        Text("Wet")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(wetTools) { tool in
                                    ToolCard(tool: tool, isSelected: selectedTools.contains(tool)) {
                                        toggleSelection(tool)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        //Solution Section
                        Text("Solution")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(SolutionTools) { tool in
                                    ToolCard(tool: tool, isSelected: selectedTools.contains(tool)) {
                                        toggleSelection(tool)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        Spacer().frame(height: 100)
                    }
                    //Spacer().frame(height: 100)
                    .padding(.top, 24)
                }
            }
            VStack {
                Spacer()
                Button(action: {
                    print("Continue tapped with tools: \(selectedTools.map { $0.name })")
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedTools.isEmpty ? Color.gray : Color.orange)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        //.padding(.bottom, 24)
                }
                .padding(.bottom, 24)
                .disabled(selectedTools.isEmpty) // tombol disable kalau belum ada yang dipilih
            }
        }
    }
    
    func toggleSelection(_ tool: CleaningTool) {
        if selectedTools.contains(tool) {
            selectedTools.remove(tool)
        } else {
            selectedTools.insert(tool)
        }
    }
}
struct ToolCard: View {
    let tool: CleaningTool
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 10) {
                Image(tool.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .saturation(isSelected ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: isSelected)
                    .opacity(isSelected ? 1.0 : 0.4)
                Text(tool.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(width: 200, height: 215)
            .background(Color.white)
            .cornerRadius(20)
            // .shadow(color: isSelected ? .blue.opacity(5) : .clear, radius: 5, x: 0, y: 5)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 5))
    }
}

#Preview {
    ToolPickerView()
}
