//
//  RiveViewModel.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 10/05/25.
//

import Foundation
import RiveRuntime

struct PreparationTaskViewModel {
    let riveModel: RiveViewModel

    init(fileName: String) {
        // Bisa tambahkan animationName atau stateMachineName kalau butuh
        self.riveModel = try! RiveViewModel(fileName: fileName)
    }
}
struct CongratulationsViewModel {
    let riveModel: RiveViewModel

    init(fileName: String) {
        // Bisa tambahkan animationName atau stateMachineName kalau butuh
        self.riveModel = try! RiveViewModel(fileName: fileName)
    }
}
