//
//  LocationTests.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/4/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import XCTest
import MapKit

@testable import UChicagoTableViewLectureApp

class LocationTests: XCTestCase {
    func testInit_shouldSetName() {
        let location = Location(name: "Pizza Palace")
        XCTAssertEqual(location.name, "Pizza Palace")
    }
    
    func testInit_shouldSetCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(coordinate: coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, 1)
        XCTAssertEqual(location.coordinate?.longitude, 2)
    }
}
