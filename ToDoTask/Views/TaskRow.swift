//
//  TaskRow.swift
//  ToDoTask
//
//  Created by asdirector on 23.12.2023.
//

import SwiftUI

struct TaskRow: View {

    var task : String
    var completed : Bool
    
    var body: some View {
        HStack (spacing: 20) {
            Image(systemName: completed ? "checkmark.circle" : "circle")
                .font(.largeTitle)
            Text (task)
        }
    }
}

#Preview {
    TaskRow(task: "Dişlerini Fırçala", completed: true)
}
