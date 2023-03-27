//
//  Todo.swift
//  ToDo
//
//  Created by Cambrian on 2023-03-06.
//

import Foundation

class Todo: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var title: String
    var isComplete: Bool = false
    var desc: String?
    var dateCompleted: Date?
    
    init(title: String, isComplete: Bool = false) {
        self.title = title
        self.isComplete = isComplete
    }
    
    required init?(coder: NSCoder) {
        title = coder.decodeObject(forKey: "title") as! String
//        isComplete = coder.decodeObject(forKey: "isComplete") as! Bool
        isComplete = coder.decodeBool(forKey: "isComplete")
        desc = coder.decodeObject(forKey: "desc") as! String?
        dateCompleted = coder.decodeObject(forKey: "dateCompleted") as! Date?
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: "title")
        coder.encode(isComplete, forKey: "isComplete")
        coder.encode(desc, forKey: "desc")
        coder.encode(dateCompleted, forKey: "dateCompleted")
    }
    


}
