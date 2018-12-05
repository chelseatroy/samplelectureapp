//
//  ItemCelITests.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/5/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import XCTest
@testable import UChicagoTableViewLectureApp

class ItemCellTests: XCTestCase {
    
    func testItemCell_hasLabels() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        
        _ = controller.view
        let tableView = controller.tableView
        
        let dataProvider = FakeDataSource()
        tableView!.dataSource = dataProvider
        
        let cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell
        XCTAssertNotNil(cell.titleLabel)
        XCTAssertNotNil(cell.locationLabel)
        XCTAssertNotNil(cell.dateLabel)
    }
    
    func testConfigWithTitle_setsLabels() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        
        _ = controller.view
        let tableView = controller.tableView
        
        let dataProvider = FakeDataSource()
        tableView!.dataSource = dataProvider
        
        let cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell
        
        cell.configCellWith(item: ToDoItem(
            title: "Wash Bicycle",
            description: "Use soap and water to remove dirt from frame",
            timestamp: 1546500000,
            location: Location(name: "Home")
            
            ))
        XCTAssertEqual(cell.titleLabel.text, "Wash Bicycle")
        XCTAssertEqual(cell.locationLabel.text, "Home")
        XCTAssertEqual(cell.dateLabel.text!, "01/03/2019")
    }
    
    func testTitle_forCheckedTasks_IsStruckThrough() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        
        _ = controller.view
        let tableView = controller.tableView
        
        let dataProvider = FakeDataSource()
        tableView!.dataSource = dataProvider
        
        let cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell
        
        let item = ToDoItem(
            title: "Wash Bicycle",
            description: "Use soap and water to remove dirt from frame",
            timestamp: 1546500000,
            location: Location(name: "Home"))
        
        cell.configCellWith(item:item, checked: true)
        let attributedString = NSAttributedString(string: item.title, attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
        
        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
        XCTAssertEqual(cell.locationLabel.text, nil)
        XCTAssertEqual(cell.dateLabel.text, nil)
    }

}

extension ItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
