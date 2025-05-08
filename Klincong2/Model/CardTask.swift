//
//  CardTask.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 07/05/25.
//

import Foundation

struct TaskCard: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var isCompleted: Bool = false
    var offset: CGSize = .zero
}
