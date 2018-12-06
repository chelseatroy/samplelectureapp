//
//  ItemListViewController.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/5/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import Foundation
import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: ItemListDataProvider!
    
    override func viewDidLoad() {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        dataProvider.itemManager = ItemManager()
        
        super.viewDidLoad()
    }

}
