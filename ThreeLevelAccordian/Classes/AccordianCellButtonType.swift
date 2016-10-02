//
//  AccordianCellButtonType.swift
//  cleanilycustomers
//
//  Created by Amrata Baghel on 30/09/16.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
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