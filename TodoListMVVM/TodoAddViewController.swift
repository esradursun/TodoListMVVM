//
//  TodoAddViewController.swift
//  TodoListMVVM
//
//  Created by Esra Dursun on 30/03/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import UIKit

protocol addNewItemProtocol: class {
    func didAddedNewItem(addVM: AddNewTodoViewModel)
}

class TodoAddViewController: UIViewController {

    @IBOutlet private weak var taskTextField : UITextField!
    @IBOutlet private weak var  notesTextField : UITextField!
    
    var viewModel = AddNewTodoViewModel()
    
    weak var delegate : addNewItemProtocol? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func didTapSaveButton(_ sender: UIBarButtonItem) {
        let todo = Todo(task: taskTextField.text!, completed: false, notes: notesTextField.text!)
        viewModel.newTodo = todo
        self.delegate?.didAddedNewItem(addVM: viewModel)
        navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func didTapSaveButton(_ sender: UIBarButtonItem){

//    }



}
