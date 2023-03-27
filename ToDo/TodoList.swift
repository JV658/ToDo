//
//  TodoList.swift
//  ToDo
//
//  Created by Cambrian on 2023-03-06.
//

import Foundation

class TodoList{
    var todos: [Todo] = []
    private let todoURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appending(path: "todo.archive")
    }()
    
    init(){
        print(todoURL)
        
        let data = try? Data(contentsOf: todoURL)
        
        if data == nil { return }

        todos = try! NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: Todo.self, from: data!)!
        
//        todos.append(Todo(title: "vacuum"))
//        todos.append(Todo(title: "walk the dog"))
//        todos.append(Todo(title: "do the dishes"))
//        todos.append(Todo(title: "sleep"))
//        todos.append(Todo(title: "do homework"))
    }
    
    func save(){
        do{
            let encodedTodos = try NSKeyedArchiver.archivedData(withRootObject: todos, requiringSecureCoding: true)
            try encodedTodos.write(to: todoURL)
            print("All objects were saved")
        } catch let err{
            preconditionFailure(err.localizedDescription)
        }
        
    }
    
    func delete(at indexPath: IndexPath){
        let row = indexPath.row
        
        todos.remove(at: row)
    }
    
    func move(from fromIndexPath: IndexPath, to toIndexPath: IndexPath){
        let tmp = todos[fromIndexPath.row]
        
        delete(at: fromIndexPath)
        
        todos.insert(tmp, at: toIndexPath.row)
    }
}
