//
//  TaskView.swift
//  ToDoTask
//
//  Created by asdirector on 23.12.2023.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack{
            Text("My Tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
                        List {
                            ForEach(realmManager.tasks, id: \.id) {
                                task in
                                if !task.isInvalidated {
                                    TaskRow(task: task.title, completed: task.completed)
                                        .onTapGesture {
                                            realmManager.updateTask(id: task.id, completed: !task.completed)
                                        }
                                        .swipeActions(edge: .trailing){
                                            Button(role: .destructive) {
            
                                                realmManager.deleteTask(id: task.id)
            
                                            } label: {
                                                Label("Sil", systemImage : "trash")
            
                                            }
            
                                }
            
            
            
                            }
            
                             }
                            .listRowSeparator(.hidden)
            
                            } .onAppear {
                                UITableView.appearance().backgroundColor = UIColor.clear
                                UITableViewCell.appearance().backgroundColor = UIColor.clear
                                
                        }
            
                    }.frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Color(hue: 0.619, saturation: 0.381, brightness: 0.934))
                }
        }
        
        
        //
        //struct TasksView_Previews: PreviewProvider {
        //    static var previews: some View {
        //        TaskView()
        //            .environmentObject(RealmManager())
        //    }
        //}


#Preview {
    TaskView()
        
}
