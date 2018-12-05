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
    
    var storyboard: UIStoryboard!
    var tableView: UITableView!
    var controller: ItemListViewController!
    var sut: ItemListDataProvider!
    
    override func setUp() {
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        
        _ = controller.view
        
        tableView = controller.tableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }
    
    func testNumberOfSections_IsTwo() {
        
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfRowsInFirstSection_istoDoCount() {
        sut.itemManager?.addItem(ToDoItem(title: "Eat Cookies"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.addItem(ToDoItem(title: "Drink Water"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberOfRowsInSecondSection_IsDoneCount() {
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
    
    func testCellForRow_returnsItemCell() {
        sut.itemManager?.addItem(ToDoItem(title: "Check Schedule"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
    }
    
    func testCellForRow_dequeueCell() {
        let mockTableView = MockTableView()
        
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        sut.itemManager?.addItem(ToDoItem(title: "Prepare Coffee"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func testConfigCell_getsCalledInCellForRow() {
        let mockTableView = MockTableView()
        
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        let toDoItem = ToDoItem(title: "Write Thesis")
        sut.itemManager?.addItem(toDoItem)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell
        XCTAssertTrue(cell.configCellGotCalled)
        XCTAssertEqual(cell.toDoItem!.title, "Write Thesis")

    }
    
    func testCellInSectionTwo_getsConfiguredWithDoneItem() {
        let mockTableView = MockTableView(
            frame: CGRect(x: 0, y: 0, width: 320, height: 480),
            style: .plain
        )
        
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        let toDoItem = ToDoItem(title: "Get a Library Card")
        let anotherToDoItem = ToDoItem(title: "Bake Pie for Mom")
        sut.itemManager?.addItem(toDoItem)
        sut.itemManager?.addItem(anotherToDoItem)

        _ = sut.itemManager?.checkItemAtIndex(1) // we have now baked the pie!

        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockItemCell
        XCTAssertEqual(cell.toDoItem!.title, "Bake Pie for Mom")
    
    }
    
    func testDeletionButtoninFirstSection_ShowsTitleCheck() {
        let deleteButtonTitle = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(deleteButtonTitle, "Check")
    }
    
    func testDeletionButtoninSecondSection_ShowsTitleUncheck() {
        let deleteButtonTitle = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(deleteButtonTitle, "Uncheck")
    }
    
    func testCheckingAnItem_ChecksItInItemManager() {
        let toDoItem = ToDoItem(title: "Eat Breakfast")
        sut.itemManager?.addItem(toDoItem)
        
        let _ = tableView.dataSource?.tableView?(tableView,
                                         commit: .delete,
                                         forRowAt: IndexPath(row: 0, section: 0)
        )
        
        XCTAssertEqual(sut.itemManager?.toDoCount, 0)
        XCTAssertEqual(sut.itemManager?.doneCount, 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
    }
    
    func testUncheckingAnItem_UnchecksItInItemManager() {
        let toDoItem = ToDoItem(title: "Do Laundry")
        sut.itemManager?.addItem(toDoItem)
        _ = sut.itemManager? .checkItemAtIndex(0)
        tableView.reloadData()
        
        let _ = tableView.dataSource?.tableView?(tableView,
                                                 commit: .delete,
                                                 forRowAt: IndexPath(row: 0, section: 1)
        )
        
        XCTAssertEqual(sut.itemManager?.toDoCount, 1)
        XCTAssertEqual(sut.itemManager?.doneCount, 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 0)
    }



}

extension ItemListDataProviderTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockItemCell: ItemCell {
        var configCellGotCalled = false
        var toDoItem: ToDoItem?
        
        override func configCellWith(item: ToDoItem, checked: Bool = false){
            toDoItem = item
            configCellGotCalled = true
        }
    }
}
