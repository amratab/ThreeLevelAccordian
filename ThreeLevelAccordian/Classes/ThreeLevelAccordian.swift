//
//  ThreeLevelAccordian.swift
//  Pods
//
//  Created by Sahil Dhankhar on 30/09/16.
//
//

import Foundation
import UIKit

class ThreeLevelAccordian {
    
    init(tableView: UITableView, cells: [Item]) {
        let controller = TLAViewController()
        controller.tableView = tableView
        controller.cells = cells
    }
    
}