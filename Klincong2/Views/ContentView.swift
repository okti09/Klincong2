//
//  ContentView.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 07/05/25.
//

import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            ToolPickerView()
//        }
//    }
//}

enum MainRoute: Hashable {
    case camera
    case task([TaskGroup])
}

struct ToolItem: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    let name: String
}

struct ContentView: View {
    @State private var path: [MainRoute] = []
    @State private var image: UIImage?
    @State private var showInstructions = true

    let allTools: [(String, String)] = [
        ("alat_Sapu", "Sapu"),
        ("alat_Pel", "Pel"),
        ("alat_vakum", "Vakum"),
        ("alat_KainLap", "Kain Lap"),
        ("alat_Kemoceng", "Kemoceng"),
        ("alat_Pengki", "Pengki"),
        ("alat_SikatWC", "Sikat WC"),
        ("alat_Trashbin", "Tempat Sampah"),
        ("alat_Spons", "Spons")
    ]
    @State private var selectedTools: [(String, String)] = []

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    Text("Choose Your\n Cleaning Tools")
                        .font(.title)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(allTools, id: \.0) { tool in
                            let isSelected = selectedTools.contains(where: { $0.0 == tool.0 })
                            ServiceCard(imageName: tool.0, label: tool.1, isSelected: isSelected) {
                                if isSelected {
                                    selectedTools.removeAll(where: { $0.0 == tool.0 })
                                } else {
                                    selectedTools.append(tool)
                                }
                            }
                        }
                    }
                    .padding()

                    Button(action: {
                        if selectedTools.count >= 1 {
                            showInstructions = true
                            path.append(.camera)
                        }
                    }) {
                        Text("Done")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: 220)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]),
                                               startPoint: .leading,
                                               endPoint: .trailing)
                            )
                            .foregroundColor(.gray)
                            .cornerRadius(30)
                            .padding()
                    }
                }
                .navigationDestination(for: MainRoute.self) { route in
                    switch route {
                    case .camera:
                        CameraContentView(selectedTools: selectedTools.map { $0.1 }) { taskGroups in
                            path.append(.task(taskGroups))
                        }
                        .navigationBarBackButtonHidden(true)
                    case .task(let taskGroups):
                        CardTaskView(taskGroups: taskGroups)
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
