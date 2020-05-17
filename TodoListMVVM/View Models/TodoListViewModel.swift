//
//  TodoListViewModel.swift
//  TodoListMVVM
//
//  Created by Esra Dursun on 30/03/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import Foundation

class TodoListViewModel {
    
    private var todos : [Todo]
    
    var count : Int {
        return todos.count
    }
    
    init() {
        todos = [Todo]()
        //addDummyData()
    }
    
    private func addDummyData(){
        for i in 0...19 {
            todos.append(Todo(task: "Task: \(i)", completed: false, notes: "This is a sample todo list task"))
        }
    }
    
    func itemAt(index : Int) -> Todo {
        return todos[index]
    }
    
    func updateCompletedState(index: Int, newValue: Bool){
        todos[index].completed = newValue
    }
    
    func addNew(todo : Todo){
        todos.append(todo)
    }
    
}
