//
//  Location.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/4/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import Foundation
import MapKit

struct Location: Equatable {
    let name: String?
    let coordinate: CLLocationCoordinate2D?
    
    init(
        name: String? = "",
        coordinate: CLLocationCoordinate2D? = nil
        ){
        self.name = name
        self.coordinate = coordinate
    }
}

func ==(lhs: Location, rhs: Location) -> Bool {
    return true
}
