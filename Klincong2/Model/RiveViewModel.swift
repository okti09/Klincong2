//
//  RiveViewModel.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 10/05/25.
//

import Foundation
import SwiftUI
import RiveRuntime

struct PreparationTaskView: View {
    let fileName: String
    
    var body: some View {
        // Anda harus punya RiveViewModel di sini
        let riveModel = RiveViewModel(fileName: "animate-processing-task", animationName: "main")
        riveModel.view()
    }
}


//struct PreparationTaskViewModel {
//    let riveModel: RiveViewModel
//
//    init(fileName: String) {
//        // Bisa tambahkan animationName atau stateMachineName kalau butuh
//        self.riveModel = try! RiveViewModel(fileName: fileName)
//    }
//}
struct CongratulationsViewModel {
    let riveModel: RiveViewModel

    init(fileName: String) {
        // Bisa tambahkan animationName atau stateMachineName kalau butuh
        self.riveModel = try! RiveViewModel(fileName: fileName)
    }
}
