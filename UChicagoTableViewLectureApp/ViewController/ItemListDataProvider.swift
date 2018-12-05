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
        
        if let toDoItem = itemManager?.itemAtIndex(indexPath.row) {
        cell.configCellWith(item: toDoItem)
        }
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}

enum Section: Int {
    case ToDo
    case Done
}
