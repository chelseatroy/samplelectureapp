//
//  ItemCell.swift
//  UChicagoTableViewLectureApp
//
//  Created by Chelsea Dommert on 12/5/18.
//  Copyright © 2018 Chelsea Troy. All rights reserved.
//

import Foundation
import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    func configCellWith(item: ToDoItem) {
        titleLabel.text = item.title
        locationLabel.text = item.location?.name
        
        if let timestamp = item.timestamp {
            let date = Date(timeIntervalSince1970: timestamp)
            dateLabel.text = dateFormatter.string(from: date)
        }
    }
}
