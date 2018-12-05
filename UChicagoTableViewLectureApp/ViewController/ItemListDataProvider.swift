//
//  ItemListDataSource.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/5/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import Foundation
import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var itemManager: ItemManager?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        guard let itemManager = itemManager else {fatalError()}
        guard let itemSection = Section(rawValue: indexPath.section) else { fatalError() }
        
        let item: ToDoItem
        
        switch itemSection {
        case .ToDo:
            item = itemManager.itemAtIndex(indexPath.row)
        case .Done:
            item = itemManager.checkedItemAtIndex(indexPath.row)
        }

        cell.configCellWith(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else {return 0}
        guard let itemSection = Section(rawValue: section) else { fatalError() }
        
        switch itemSection {
        case .ToDo:
            return itemManager.toDoCount
        case .Done:
            return itemManager.doneCount
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        guard let itemSection = Section(rawValue: indexPath.section) else {fatalError()}
        
        let buttonTitle: String
        switch itemSection{
        case .ToDo:
            buttonTitle = "Check"
        case .Done:
            buttonTitle = "Uncheck"
        }
        
        return buttonTitle
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let itemManager = itemManager else {fatalError()}
        guard let itemSection = Section(rawValue: indexPath.section) else { fatalError() }

        switch itemSection{
        case .ToDo:
            _ = itemManager.checkItemAtIndex(indexPath.row)
        case .Done:
            _ = itemManager.uncheckItemAtIndex(indexPath.row)
        }

        tableView.reloadData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}

enum Section: Int {
    case ToDo
    case Done
}
