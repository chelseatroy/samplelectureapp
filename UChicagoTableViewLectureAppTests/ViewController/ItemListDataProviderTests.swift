//
//  ItemListDataSourceTests.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/5/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import XCTest
@testable import UChicagoTableViewLectureApp

class ItemListDataProviderTests: XCTestCase {
    
    func testNumberOfSections_IsTwo() {
        let sut = ItemListDataProvider()
        
        let tableView = UITableView()
        tableView.dataSource = sut
        
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfRowsInFirstSection_istoDoCount() {
        let sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        
        let tableView = UITableView()
        tableView.dataSource = sut
        
        sut.itemManager?.addItem(ToDoItem(title: "Eat Cookies"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.addItem(ToDoItem(title: "Drink Water"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberOfRowsInSecondSection_IsDoneCount() {
        let sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        
        let tableView = UITableView()
        tableView.dataSource = sut
        
        sut.itemManager?.addItem(ToDoItem(title: "Eat Cookies"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 0)
        
        sut.itemManager?.addItem(ToDoItem(title: "Drink Water"))
        _ = sut.itemManager?.checkItemAtIndex(0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)

    }
}
