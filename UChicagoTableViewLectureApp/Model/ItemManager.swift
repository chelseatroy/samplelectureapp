//
//  File.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/4/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import Foundation

class ItemManager {
    fileprivate var toDos: [ToDoItem]
    fileprivate var doneItems: [ToDoItem]
    
    var toDoCount: Int {return self.toDos.count}
    var doneCount: Int {return self.doneItems.count}
    
    init(
        toDos: [ToDoItem] = [],
        doneItems: [ToDoItem] = []
        ){
        self.toDos = toDos
        self.doneItems = doneItems
    }
    
    func addItem(_ item: ToDoItem) {
        self.toDos.append(item)
    }
    
    func itemAtIndex(_ index: Int) -> ToDoItem {
        return toDos[index]
    }
    
    func checkedItemAtIndex(_ index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    func checkItemAtIndex(_ index: Int) -> ToDoItem {        
        let doneItem = toDos.remove(at: index)
        doneItems.append(doneItem)
        
        return doneItem
    }
}
