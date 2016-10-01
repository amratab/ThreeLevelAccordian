//
//  AccordianCellButtonType.swift
//  cleanilycustomers
//
//  Created by Sahil Dhankhar on 30/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import Foundation
import UIKit

enum AccordianCellButtonType {
    case Expand
    case Collapse
}

class AccordianCellAccessoryView {
    static internal func getCellAccessory(type: AccordianCellButtonType) -> UIView{
        return AccordianCellButton.init(type: type) as UIView
    }
    
    static internal func getCellAccessoryWithCustomImage(image: UIImage) -> UIView{
        return AccordianCellButton.init(image: image) as UIView
    }
}