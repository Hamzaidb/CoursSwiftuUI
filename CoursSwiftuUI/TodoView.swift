//
//  TodoView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 16/10/2024.
//

import SwiftUI

struct TodoView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskTitle: String = ""

    var body: some View {
        VStack {
            if tasks.isEmpty {
                            Spacer(minLength: 230)
                        }
            
            HStack {
                Text("Ma Todo List")
                    .font(.largeTitle)
                    .padding()
                    .font(.system(size: 24))
                    .fontWeight(.light)
                
                Text("📝")
                    .font(.largeTitle)
            }
            
            HStack {
                TextField("Nouvelle tâche", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: addTask) {
                    Image(systemName: "plus")
                        .padding()
                        .foregroundColor(.blue)
                        .cornerRadius(30)
                }
            }
            .padding(.top, -15.0)

            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                            .strikethrough(task.isCompleted)
                        Spacer()
                        Button(action: {
                            toggleTaskCompletion(task: task)
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                        }
                    }
                }
                .onDelete(perform: deleteTask)
                
            }
            .background(Color.purple)
            .foregroundColor(.black)

        }
        
        .padding()
        .background(Color.white)
    }

    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask)
        newTaskTitle = ""
    }

    private func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    TodoView()
}
