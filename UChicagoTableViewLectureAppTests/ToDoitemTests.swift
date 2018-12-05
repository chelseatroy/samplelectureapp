//
//  UChicagoTableViewLectureAppTests.swift
//  UChicagoTableViewLectureAppTests
//
//  Created by Chelsea Dommert on 12/3/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import XCTest
@testable import UChicagoTableViewLectureApp

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_shouldSetTitle() {
        let todo = ToDoItem(
            title: "My Awesome Title"
        )
        XCTAssertEqual(todo.title, "My Awesome Title")

    }
    
    func testInit_shouldSetDescription() {
        let todo = ToDoItem(
            title: "Title",
            description: "A description"
        )
        XCTAssertEqual(todo.title, "Title")
        XCTAssertEqual(todo.description, "A description")
        
    }
    
    func testInit_shouldSetTimestamp() {
        let todo = ToDoItem(
            title: "Title",
            timestamp: 2.0
        )
        XCTAssertEqual(todo.timestamp, 2.0)
        
    }
    
    func testInit_shouldSetLocation() {
        let location = Location(name: "Burger King")
        let todo = ToDoItem(
            title: "Title",
            location: location
        )
        XCTAssertEqual(todo.location, location)
        
    }


    
}
