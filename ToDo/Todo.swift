//
//  Todo.swift
//  ToDo
//
//  Created by Cambrian on 2023-03-06.
//

import Foundation

class Todo {
    var title: String
    var isComplete: Bool = false
    
    init(title: String, isComplete: Bool = false) {
        self.title = title
        self.isComplete = isComplete
    }
}
