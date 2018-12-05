
//
//  ItemManagerTests.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/4/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import XCTest
@testable import UChicagoTableViewLectureApp

class ItemManagerTests: XCTestCase {
    var sut: ItemManager!
    
    override func setUp() {
        sut = ItemManager()
    }
    
    func testToDoCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    func testDoneCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func testItemAtIndex_returnsItem() {
        let toDo = ToDoItem(title: "Clean the House")
        sut.addItem(toDo)
        XCTAssertEqual(sut.itemAtIndex(0), toDo)
    }

    func testAddItem_addsItemToCollection() {
        let toDo = ToDoItem(title: "Clean the House")
        sut.addItem(toDo)
        XCTAssertEqual(sut.toDoCount, 1)
        XCTAssertEqual(sut.itemAtIndex(0), toDo)
    }

    func testCheckItemAtIndex_completesItem() {
        let clean = ToDoItem(title: "Clean the House")
        let tomatos = ToDoItem(title: "Plant the Tomatos")

        sut.addItem(clean)
        sut.addItem(tomatos)
        
        XCTAssertEqual(sut.toDoCount, 2)
        XCTAssertEqual(sut.doneCount, 0)

        let doneItem = sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.toDoCount, 1)
        XCTAssertEqual(sut.doneCount, 1)
        XCTAssertEqual(sut.itemAtIndex(0), tomatos)
        XCTAssertEqual(doneItem, clean)
    }
    
    func testCheckedItemAtIndex_returnsItem() {
        let toDo = ToDoItem(title: "Clean the House")
        sut.addItem(toDo)
        _ = sut.checkItemAtIndex(0)

        
        let checkedItem = sut.checkedItemAtIndex(0)
        XCTAssertEqual(checkedItem, toDo)
    }
}
