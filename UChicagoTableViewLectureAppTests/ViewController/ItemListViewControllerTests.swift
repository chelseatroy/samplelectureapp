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
    func test_OnViewDidLoad_TableViewExists() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        _ = sut.view //accessing the view forces the view to load in a UIViewController
        
        XCTAssertNotNil(sut.tableView)
    }
}
