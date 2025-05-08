//
//  ToolsPicker.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 08/05/25.
//

import Foundation
import SwiftUI

struct CleaningsTools: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct ToolsPicker: View {
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

    let solutionTools: [CleaningTool] = [
        .init(name: "Disinfectant", imageName: "img_disinfektan"),
        .init(name: "Soap", imageName: "img_sabun"),
        .init(name: "Bleach", imageName: "img_bleach"),
        .init(name: "Floor Cleaner", imageName: "img_floorcleaner")
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            Color("biruy").ignoresSafeArea()

            VStack(spacing: 0) {
                // 🟡 HEADER
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
                    .background(Color("kuneng"))
                    .edgesIgnoringSafeArea(.top)

                    Image("img_okcat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 275, height: 205)
                        .rotationEffect(.degrees(-25))
                        .offset(x: 125, y: -5)
                }

                // 🔽 SCROLLABLE TOOL SECTIONS
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        sectionView(title: "Dry", tools: dryTools)
                        sectionView(title: "Wet", tools: wetTools)
                        sectionView(title: "Solution", tools: solutionTools)
                        
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
                                .padding(.bottom, 24)
                        }
                        .disabled(selectedTools.isEmpty)
                        .shadow(radius: 10)

                       Spacer().frame(height: 120) // biar gak ketutup tombol
                    }
                }
            }

//            // 🟧 FLOATING BUTTON
//            Button(action: {
//                print("Continue tapped with tools: \(selectedTools.map { $0.name })")
//            }) {
//                Text("Continue")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(selectedTools.isEmpty ? Color.gray : Color.orange)
//                    .cornerRadius(20)
//                    .padding(.horizontal)
//                    .padding(.bottom, 24)
//            }
//            .disabled(selectedTools.isEmpty)
//            .shadow(radius: 10)
        }
    }

    // 🔁 SECTIONS
    @ViewBuilder
    func sectionView(title: String, tools: [CleaningTool]) -> some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.white)
            .padding(.leading)

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(tools) { tool in
                    ToolCard(tool: tool, isSelected: selectedTools.contains(tool)) {
                        toggleSelection(tool)
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    // 🔁 TOGGLE PILIHAN
    func toggleSelection(_ tool: CleaningTool) {
        if selectedTools.contains(tool) {
            selectedTools.remove(tool)
        } else {
            selectedTools.insert(tool)
        }
    }
}

struct ToolsCard: View {
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
                    .opacity(isSelected ? 1.0 : 0.4)
                    .animation(.easeInOut(duration: 0.3), value: isSelected)

                Text(tool.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(width: 200, height: 215)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 5)
            )
        }
    }
}

#Preview {
    ToolPickerView()
}
