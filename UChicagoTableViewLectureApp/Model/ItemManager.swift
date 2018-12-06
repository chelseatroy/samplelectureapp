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
        
        for item in exampleData(){
            self.toDos.append(item)
        }
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
    
    func uncheckItemAtIndex(_ index: Int) -> ToDoItem {
        let undoneItem = doneItems.remove(at: index)
        toDos.append(undoneItem)
        
        return undoneItem
    }

}

func exampleData() -> [ToDoItem] {
    let toDoCollection = [ToDoItem(
                            title: "Wake Up",
                            description: "Use soap and water to remove dirt from frame",
                            timestamp: 1546500000,
                            location: Location(name: "Home")),
                          ToDoItem(
                            title: "Put the Coffee On",
                            description: "",
                            timestamp: 1546500000,
                            location: Location(name: "Home")),
                          ToDoItem(
                            title: "Eat Breakfast",
                            description: "",
                            timestamp: 1546500000,
                            location: Location(name: "Home")),
                          ToDoItem(
                            title: "Brush Teeth",
                            description: "",
                            timestamp: 1546500000,
                            location: Location(name: "Home")),
                          ToDoItem(
                            title: "Put on Pants",
                            description: "",
                            timestamp: 1546500000,
                            location: Location(name: "Home")),
                          ToDoItem(
                            title: "Go Outside",
                            description: "",
                            timestamp: 1546500000,
                            location: Location(name: "Home"))
     
     ]
    return toDoCollection
}
