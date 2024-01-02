//
//  ContentView.swift
//  ToDoTask
//
//  Created by asdirector on 23.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false
 
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TaskView()
                .environmentObject(realmManager)
            
            SmallAdButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
            
        }
        .sheet(isPresented: $showAddTaskView){
            AddTaskView()
                .environmentObject(realmManager)
        }
        
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//#Preview {
//    ContentView()
//}
