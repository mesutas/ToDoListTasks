//
//  RealmManager.swift
//  ToDoTask
//
//  Created by asdirector on 23.12.2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks : [Task] = []
    
    init() {
        openRealm()
    }
    
    func openRealm () {
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
            
        }catch {
            print("Realm açılıyor\(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle,"completed": false])
                    localRealm.add(newTask)
                    getTask()
                    print("Yeni görev eklendi.\(newTask)")
                }
            } catch {
                print("Görev eklerken hata oluştu!\(error)")
                
            }
        }
    }
    
    func getTask () {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in tasks.append(task)
            }
        }
        
    }
    
    func updateTask(id: ObjectId, completed : Bool){
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTask()
                    print ("Updated task with id\(id)! completed statüs:\(completed)")
                }
                
            } catch {
                print("Görevler yüklenemedi!\(error)")
            }
        }
        
    }
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTask()
                    print("Deleted task with id\(id)")
                }
                
            } catch {
                print("Görev silinirken hata oluştu:\(error)")
            }
        }
    }
}
