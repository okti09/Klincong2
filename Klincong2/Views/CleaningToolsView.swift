//
//  CleaningToolsView.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 08/05/25.
//

import Foundation
import SwiftUI

struct CleaningTool: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct CleaningToolsView: View {
    
    let tools: [CleaningTool] = [
        CleaningTool(name: "Broom", imageName: "img_sapu"),
        CleaningTool(name: "Mop", imageName: "mop"),
        CleaningTool(name: "Dustpan", imageName: "dustpan"),
        CleaningTool(name: "Vacuum", imageName: "vacuum"),
        CleaningTool(name: "Duster", imageName: "duster"),
        CleaningTool(name: "Sponge", imageName: "sponge"),
        CleaningTool(name: "Vacuum", imageName: "vacuum"),
        CleaningTool(name: "Duster", imageName: "duster"),
        CleaningTool(name: "Sponge", imageName: "sponge")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer(minLength: 40)
            
            // Title
            VStack(spacing: 4) {
                Text("Here is Your")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Cleaning Tools")
                    .font(.title)
                    .fontWeight(.black)
            }
            
            // Grid
            LazyVGrid(columns: columns, spacing: 32) {
                ForEach(tools) { tool in
                    VStack(spacing: 10) {
                        Image(tool.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 60)
                        Text(tool.name)
                            .font(.subheadline)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            
            Spacer()
            
            // Button
            Button(action: {
                print("Capture started!")
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
        //.background(Color.yellow.opacity(0.3).ignoresSafeArea())
        .background(
            Image("img_cleaningtools")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}
#Preview {
    CleaningToolsView()
}
