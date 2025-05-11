//
//  TaskModel.swift
//  Klincong2
//
//  Created by Asri Oktianawati on 11/05/25.
//

import Foundation

struct TaskItem: Hashable, Equatable, Identifiable {
    let id = UUID()
    var description: String
}

struct TaskGroup: Hashable, Equatable {
    var tasks: [TaskItem]
}
