//
//  AddNewTodoViewModel.swift
//  TodoListMVVM
//
//  Created by Esra Dursun on 30/03/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import Foundation

class AddNewTodoViewModel {
    
    private var todoItem : Todo?
    
    var newTodo : Todo? {
        get {
            return todoItem
        }
        set {
            todoItem = newValue
        }
    }
    
}
