//
//  ViewController.swift
//  TodoListMVVM
//
//  Created by Esra Dursun on 30/03/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView : UITableView!
    
    var viewModel: TodoListViewModel!
    var dataSource: TodoListDatasourceDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TodoListViewModel()
        dataSource = TodoListDatasourceDelegate(viewModel: viewModel)
        dataSource.delegate = self
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }

    //add a new row refresh our table
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    @IBAction func didTapAddNew(_ sender : UIBarButtonItem){
        performSegue(withIdentifier: "newTodo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newTodo" {
            let vc = segue.destination as! TodoAddViewController
            vc.delegate = self
        }
    }
    
}


extension ViewController: addNewItemProtocol {
    func didAddedNewItem(addVM: AddNewTodoViewModel) {
        if let newTodo = addVM.newTodo {
            viewModel.addNew(todo: newTodo)
        }
    }
    
    
}

extension ViewController : TodoItemTappedDelegate {
    func setCompletedState(index: Int, completion: @escaping () -> Void) {
        let alertViewController = UIAlertController(title: "Mark Completed", message: "Mark this item as completed", preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.viewModel.updateCompletedState(index: index, newValue: true)
            completion()
        }))
        alertViewController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
    
    
}
