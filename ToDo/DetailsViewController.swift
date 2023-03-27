//
//  DetailsViewController.swift
//  ToDo
//
//  Created by Cambrian on 2023-03-20.
//

import UIKit

class DetailsViewController: UIViewController {

    var todoList: TodoList!
    var todoTitleCheck: String = ""
    var todo: Todo!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func save(_ sender: Any) {
        saveToDo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard
            (todo != nil)
        else {return}
        
        titleTextField.text = todo.title
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveToDo()
    }
    
    func saveToDo(){
        
        let title = titleTextField.text!
        
        if title == "" {return}
        if title == todoTitleCheck {return}
        
        todoTitleCheck = title
        
        if todo == nil {
            let newToDo = Todo(title: title)
            todoList.todos.append(newToDo)
            todo = newToDo
        } else {
            todo.title = title
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
