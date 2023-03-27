//
//  TodoTableViewCell.swift
//  ToDo
//
//  Created by Cambrian on 2023-03-27.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    var todo: Todo!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completeSwitch: UISwitch!
    @IBOutlet weak var dateCompletedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func toggleCompleteness(_ sender: UISwitch) {
        if sender.isOn {
            todo.isComplete = true
        } else {
            todo.isComplete = false
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
