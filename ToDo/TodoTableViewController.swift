//
//  TodoTableViewController.swift
//  ToDo
//
//  Created by Cambrian on 2023-03-06.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func reloadTableView(_ sender: Any) {
        tableView.reloadData()
    }
    
    @IBAction func addToDo(_ sender: Any) {
        print("pre adding \(todoList.todos.count)")
        
        let alert = UIAlertController(title: "Add ToDo", message: nil, preferredStyle: .alert)
        
        alert.addTextField(){
            textfield in
            textfield.placeholder = "ToDo Title"
        }
        
        let actionCancel = UIAlertAction(title: "Cancal", style: .cancel)
        
        let actionOK = UIAlertAction(title: "OK", style: .default){
            [self] _ in
            
            let textField = alert.textFields![0]
            let todoTile = textField.text!
            
            let newToDo = Todo(title: todoTile)
            todoList.todos.append(newToDo)
            
            tableView.reloadData()
            
            print(todoList.todos.count)
        }
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)

        
        self.present(alert, animated: true)
    }
    
    @IBAction func toggleEditMode(_ sender: UIButton) {
        // get the name of the sender
        
        /**
         if its edit
            change name (setTitle) "done"
            turn on edit mode (tableView.editmode = true)
        if its done
            change name to "edit"
            turn off edit mode
         */
    
        
        
        let senderName = sender.titleLabel!.text
        
        if senderName == "Edit" {
            sender.setTitle("Done", for: .normal)
//            tableView.isEditing = true
            tableView.setEditing(true, animated: true)
        } else {
            sender.setTitle("Edit", for: .normal)
//            tableView.isEditing = false
            tableView.setEditing(false, animated: true)
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)

        // Configure the cell...
        let row = indexPath.row
        let section = indexPath.section
        
        cell.textLabel!.text = todoList.todos[row].title

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
