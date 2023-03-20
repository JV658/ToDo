//
//  TodoList.swift
//  ToDo
//
//  Created by Cambrian on 2023-03-06.
//

import Foundation

class TodoList{
    var todos: [Todo] = []
    
    init(){
        todos.append(Todo(title: "vacuum"))
        todos.append(Todo(title: "walk the dog"))
        todos.append(Todo(title: "do the dishes"))
        todos.append(Todo(title: "sleep"))
        todos.append(Todo(title: "do homework"))
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
