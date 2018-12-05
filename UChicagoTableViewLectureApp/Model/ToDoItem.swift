//
//  ToDoItem.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/4/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import Foundation

struct ToDoItem: Equatable {
    let title: String
    let description: String?
    let timestamp: Double?
    let location: Location?
    
    init(
        title: String,
        description: String? = nil,
        timestamp: Double? = 0.0,
        location: Location? = nil
        ) {
        self.title = title
        self.description = description
        self.timestamp = timestamp
        self.location = location
    }
}

func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    return true
}
