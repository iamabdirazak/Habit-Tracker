//
//  HabitStore.swift
//  Habit Tracker
//
//  Created by Abdirazak Mubarak on 1/6/25.
//


import Foundation

class HabitStore: ObservableObject {
    @Published var habits: [Habit] = []
    
    func addHabit(name: String) {
        let newHabit = Habit(name: name)
        habits.append(newHabit)
    }
    
    func toggleCompletion(for habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].isCompleted.toggle()
        }
    }
}