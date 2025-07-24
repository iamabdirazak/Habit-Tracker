//
//  Habit.swift
//  Habit Tracker
//
//  Created by Abdirazak Mubarak on 1/6/25.
//


import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID
    var name: String
    var isCompleted: Bool
    
    init(name: String, isCompleted: Bool = false) {
        self.id = UUID()
        self.name = name
        self.isCompleted = isCompleted
    }
}