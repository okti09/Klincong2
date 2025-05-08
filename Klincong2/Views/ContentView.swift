////
////  ContentView.swift
////  Klincong2
////
////  Created by Asri Oktianawati on 07/05/25.
////
//
////import SwiftUI
///
//struct ContentView: View {
//    @State private var navigateToTasks = false
//    @State private var path: [Route] = []
//    @State private var image: UIImage?
//    
//    let selectedTools = [
//        ToolItem(icon: "alat_Sapu", name: "Sapu"),
//        ToolItem(icon: "alat_Pel", name: "Pel"),
//        ToolItem(icon: "alat_vakum", name: "Vakum"),
//        ToolItem(icon: "alat_KainLap", name: "Kain Lap"),
//        ToolItem(icon: "alat_Kemoceng", name: "Kemoceng"),
//        ToolItem(icon: "alat_Pengki", name: "Pengki"),
//        ToolItem(icon: "alat_SikatWC", name: "Sikat WC"),
//        ToolItem(icon: "alat_Trashbin", name: "Tempat Sampah"),
//        ToolItem(icon: "alat_Spons", name: "Spons")
//    ]
//    
//    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//    
//    var body: some View {
//        NavigationStack(path: $path) {
//            ScrollView {
//                VStack {
//                    Text("Choose Your\n Cleaning Tools")
//                        .font(.title)
//                        .foregroundStyle(.gray)
//                        .multilineTextAlignment(.center)
//                        .fontWeight(.bold)
//                        .padding(.top, 20)
//                    
//                    LazyVGrid(columns: columns, spacing: 20) {
//                        ForEach(selectedTools, id: \.id) { tool in
//                            ServiceCard(imageName: tool.icon, label: tool.name)
//                        }
//                    }
//                    .padding()
//                    
//                    Button(action: {
//                        navigateToCamera(path: &path, selectedTools: selectedTools)
//                    }) {
//                        Text("Done")
//                            .fontWeight(.bold)
//                            .padding()
//                            .disabled(selectedTools.count < 1)
//                            .frame(maxWidth: 220)
//                            .background(
//                                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]),
//                                                startPoint: .leading,
//                                                endPoint: .trailing )
//                            )
//                            .foregroundColor(.gray)
//                            .cornerRadius(30)
//                            .padding()
//                    }
//                }
//                .navigationDestination(for: Route.self) { route in
//                    switch route {
//                    case .camera:
//                        ZStack {
//                            CameraView { capturedImage in
//                                self.image = capturedImage
//                                path.removeLast()
//                            }
//                            
//                            // Blur background kamera
//                            Color.black.opacity(0.3)
//                                .ignoresSafeArea()
//                                .blur(radius: 10)
//                                .allowsHitTesting(false)
//                            
//                            // Teks instruksi di tengah bawah
//                            VStack {
//                                Spacer()
//                                Text("Foto area yang ingin kamu bersihkan")
//                                    .font(.headline)
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .background(Color.black.opacity(0.6))
//                                    .cornerRadius(10)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                    .allowsHitTesting(false)
//                            }
//                        }
//                        .navigationBarBackButtonHidden(true)
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
