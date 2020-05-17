//
//  TodoCell.swift
//  TodoListMVVM
//
//  Created by Esra Dursun on 30/03/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    
    
    @IBOutlet private weak var taskName : UILabel!
    @IBOutlet private weak var taskNotes : UILabel!
    
    var todo : Todo? {
        didSet {
            if let todo = todo {
                taskName.text = todo.task
                taskNotes.text = todo.notes
                if todo.completed {
                    accessoryType = .checkmark
                    taskName.attributedText = strikeThrough(text: todo.task)
                    taskNotes.attributedText = strikeThrough(text: todo.notes)
                } else {
                    accessoryType = .none
                }
            }
        }
    }
    
    private func strikeThrough(text : String) -> NSAttributedString {
        let attString = NSMutableAttributedString(string: text)
        attString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attString.length))
        return attString
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
