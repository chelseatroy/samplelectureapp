//
//  ItemListViewControllerTests.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/5/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import XCTest
@testable import UChicagoTableViewLectureApp

class ItemListViewControllerTests: XCTestCase {
    func test_TableViewExists_OnViewDidLoad() {
        let sut = ItemListViewController()
        _ = sut.view //accessing the view forces the view to load in a UIViewController
        
        XCTAssertNotNil(sut.tableView)
    }
}
