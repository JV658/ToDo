//
//  TodoTableViewController.swift
//  ToDo
//
//  Created by Cambrian on 2023-03-06.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todoList: TodoList!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell

        // Configure the cell...
        let row = indexPath.row
        let section = indexPath.section
        let currentTodo = todoList.todos[row]
        
        cell.todo = currentTodo
        
//        cell.textLabel!.text = todoList.todos[row].title
        
        // set the cell title to be the same as todo.title
        cell.titleLabel.text = currentTodo.title
        
        // set the date to be the date, if date is nil hide label
        if let dateCompleted = currentTodo.dateCompleted {
            cell.dateCompletedLabel.text = "completed date"
        } else {
            cell.dateCompletedLabel.alpha = 0
        }
        
        // set UISwitch to on or off based on the completeness
        cell.completeSwitch.isOn = currentTodo.isComplete
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todoList.delete(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        todoList.move(from: fromIndexPath, to: to)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        switch segue.identifier {
        case "add":
            let dst = segue.destination as! DetailsViewController
            
            dst.todoList = todoList
        case "edit":
            // get the destination
            let dst = segue.destination as! DetailsViewController
            // inject todoList
            dst.todoList = todoList
            // inject select todo
            let indexPath = tableView.indexPathForSelectedRow!
            let index = indexPath.row
            let todo = todoList.todos[index]
            dst.todo = todo
            /// HINT: look for a tableView Method that will get the selecte indexPath
        default:
            preconditionFailure("unidentified segue ID: \(segue.identifier)")
        }
    }
}
