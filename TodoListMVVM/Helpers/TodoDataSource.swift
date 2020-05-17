//
//  TodoDataSource.swift
//  TodoListMVVM
//
//  Created by Esra Dursun on 30/03/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import Foundation
import UIKit

protocol TodoItemTappedDelegate: class {
    func setCompletedState(index: Int, completion : @escaping() -> Void)
}

class TodoListDatasourceDelegate : NSObject, UITableViewDelegate, UITableViewDataSource{
    
    var viewModel: TodoListViewModel
    weak var delegate: TodoItemTappedDelegate? = nil
    
    init(viewModel : TodoListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        cell.todo = viewModel.itemAt(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.setCompletedState(index: indexPath.item, completion: {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        })
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
