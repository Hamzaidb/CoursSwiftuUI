//
//  TaskModel.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 16/10/2024.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

