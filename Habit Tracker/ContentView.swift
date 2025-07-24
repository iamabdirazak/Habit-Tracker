//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Abdirazak Mubarak on 1/6/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var habitStore = HabitStore()
    @State private var newHabitName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Add Habit Section
                HStack {
                    TextField("New Habit", text: $newHabitName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Button(action: {
                        guard !newHabitName.isEmpty else { return }
                        habitStore.addHabit(name: newHabitName)
                        newHabitName = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                    .padding(.trailing)
                }
                .padding(.top)
                
                // Habit List Section
                List {
                    ForEach(habitStore.habits) { habit in
                        HStack {
                            Text(habit.name)
                            Spacer()
                            Button(action: {
                                habitStore.toggleCompletion(for: habit)
                            }) {
                                Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(habit.isCompleted ? .green : .gray)
                                    .font(.title2)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
        }
        .environmentObject(habitStore)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
