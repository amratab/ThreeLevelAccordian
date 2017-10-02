//
//  AccordianCellButton.swift
//  cleanilycustomers
//
//  Created by Amrata Baghel on 09/30/2016.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import UIKit

class AccordianCellButton: UIButton {
    
    init(type: AccordianCellButtonType) {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.setImage(imageForType(type)!, for: UIControlState())
    }
    
    init(image: UIImage) {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.setImage(image, for: UIControlState())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func imageForType(_ type: AccordianCellButtonType) -> UIImage? {
        let bundle = Bundle(for: Swift.type(of: self))
        switch(type) {
        case .expand :
            return UIImage(named: "forward_arrow", in: bundle, compatibleWith: nil)
        case .collapse:
            return UIImage(named: "expand_arrow", in: bundle, compatibleWith: nil)
        }
    }
}
