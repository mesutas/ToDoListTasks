//
//  AddTaskView.swift
//  ToDoTask
//
//  Created by asdirector on 23.12.2023.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Yeni Görev Ekle")
                .font(.title3).bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            
            TextField("Görev adı girin",text: $title)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled(true)
            
            Button {
                if title != "" {
                    realmManager.addTask(taskTitle: title)
                }
                
                dismiss()
            } label: {
                Text("Görev ekle")
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(Color(hue: 0.328, saturation: 0.796, brightness: 0.408)))
                    .cornerRadius(30)
                        
            }
            Spacer()
           
        }.padding(.top, 40)
         .padding(.horizontal)
         .background(Color(hue: 0.619, saturation: 0.096, brightness: 0.926))
        
    
        
    }
    
}
//
//struct AddTasksView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskView()
//            .environmentObject(RealmManager())
//    }
//}



#Preview {
    AddTaskView()
        .environmentObject(RealmManager())
}
