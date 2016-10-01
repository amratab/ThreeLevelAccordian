//
//  AccordianCellButton.swift
//  cleanilycustomers
//
//  Created by Sahil Dhankhar on 30/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import UIKit

class AccordianCellButton: UIButton {
    
    init(type: AccordianCellButtonType) {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.setImage(imageForType(type)!, forState: .Normal)
    }
    
    init(image: UIImage) {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.setImage(image, forState: .Normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func imageForType(type: AccordianCellButtonType) -> UIImage? {
        let bundle = NSBundle(forClass: self.dynamicType)
        switch(type) {
        case .Expand :
            return UIImage(named: "forward_arrow", inBundle: bundle, compatibleWithTraitCollection: nil)
        case .Collapse:
            return UIImage(named: "expand_arrow", inBundle: bundle, compatibleWithTraitCollection: nil)
        }
    }
}
