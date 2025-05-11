//
//  CardTaskView.swift
//  Klincong1
//
//  Created by Asri Oktianawati on 03/05/25.
//

import Foundation
import SwiftUI

struct TaskCard: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var isCompleted: Bool = false
    var offset: CGSize = .zero
}

struct CardTaskView: View {
    let taskGroups: [TaskGroup]
   // let tools: [ToolItem]
    @State private var currentGroup = 0
    @State private var isButtonDisabled = false
    @State private var completedGroups: Set<Int> = []
    @State private var showRiveAnimation = false
    @State private var showCongratsScreen = false
    
    let riveViewModel = CongratulationsViewModel(fileName: "congratulations-klincong")
    
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            if showRiveAnimation {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                riveViewModel.riveModel.view()
                    .frame(width: 300, height: 300)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text("Time to Clean Up")
                    .font(.system(size: 28, weight: .regular))
                    .foregroundColor(.black)
                // .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Text("Your Tools")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 8)
                //Spacer().frame(height: 4)
                
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 24)
                if !taskGroups.isEmpty {
                    HStack {
                        Spacer(minLength: 16)
                        TabView(selection: $currentGroup) {
                            ForEach(0..<taskGroups.count, id: \ .self) { idx in
                                VStack(alignment: .leading, spacing: 12) {
                                    ForEach(Array(taskGroups[idx].tasks.enumerated()), id: \ .offset) { tIdx, task in
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text("Task \(tIdx+1)")
                                                .font(.system(size: 15, weight: .semibold))
                                                .foregroundColor(Color.blue)
                                            Text(task.description)
                                                .font(.system(size: 19, weight: .regular))
                                                .foregroundColor(.black)
                                        }
                                    }
                                    Spacer().frame(height: 16)
                                    Button(action: {
                                        if currentGroup == taskGroups.count - 1 {
                                            // Tampilkan animasi
                                            showCongratsScreen = true
                                            
                                            // Sembunyikan animasi setelah beberapa detik (misal 3 detik)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                                showRiveAnimation = false
                                                // Bisa dismiss view atau navigasi ke halaman lain di sini
                                            }
                                        } else {
                                            guard !isButtonDisabled && !completedGroups.contains(currentGroup) else { return }
                                            isButtonDisabled = true
                                            completedGroups.insert(currentGroup)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                currentGroup += 1
                                                isButtonDisabled = false
                                            }
                                        }
                                    }) {
                                        Text(currentGroup == taskGroups.count - 1 ? "All task done" : "DONE")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 14)
                                            .background(
                                                (isButtonDisabled
                                                 || (currentGroup != taskGroups.count - 1 && completedGroups.contains(currentGroup))
                                                 || (currentGroup == taskGroups.count - 1 && completedGroups.count < taskGroups.count - 1)
                                                ) ? Color.gray : Color.orange)
                                            .cornerRadius(30)
                                    }
                                    .disabled(
                                        isButtonDisabled
                                        || (currentGroup != taskGroups.count - 1 && completedGroups.contains(currentGroup))
                                        || (currentGroup == taskGroups.count - 1 && completedGroups.count < taskGroups.count - 1)
                                    )
                                    .padding(.top, 24)
                                    .padding(.horizontal, 24)
                                    .padding(.bottom, 24)
                                }
                                .padding(24)
                                .background(Color(red: 0.82, green: 0.92, blue: 1.0))
                                .cornerRadius(28)
                                .padding(.horizontal, 8)
                                .tag(idx)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(width: 380, height: 420)
                        Spacer(minLength: 16)
                    }
                    HStack(spacing: 8) {
                        ForEach(0..<taskGroups.count, id: \.self) { idx in
                            Circle()
                                .fill(idx == currentGroup ? Color.black : Color.gray.opacity(0.3))
                                .frame(width: 10, height: 10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 16)
                } else {
                    Text("No tasks available.")
                        .foregroundColor(.gray)
                        .padding()
                }
                Spacer()
            }
            .fullScreenCover(isPresented: $showCongratsScreen) {
                CongratulationsView()
            }
        }
    }
}

// Preview hanya untuk Xcode, tidak berpengaruh ke runtime
#Preview {
    let dummyTasks = [
        TaskGroup(tasks: [
            TaskItem(description: "Pick up trash"),
            TaskItem(description: "Wipe table"),
            TaskItem(description: "Sweep floor"),
        ]),
        TaskGroup(tasks: [
            TaskItem(description: "Wipe table surface"),
            TaskItem(description: "Clean up spilled water"),
            TaskItem(description: "Arrange chairs neatly")
        ]),
        TaskGroup(tasks: [
            TaskItem(description: "Sweep floor under the table"),
            TaskItem(description: "Mop the kitchen floor"),
            TaskItem(description: "Take out the trash bin")
        ])
    ]
    CardTaskView(taskGroups: dummyTasks)
}


