//
//  ThreeLevelAccordian.swift
//  Pods
//
//  Created by Amrata Baghel on 30/09/16.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import Foundation
import UIKit

public protocol TLADelegate {
    func didSelectItemAtIndex(_ index: Int)
}

open class ThreeLevelAccordian {

    open var controller: TLAViewController!
    
    open var delegate: TLADelegate! {
        didSet {
            controller.delegate = delegate
        }
    }
    
    public init(cells: [TLACell], options: [TLAOption]?, reuseIdentifier: String) {
        controller = TLAViewController.init(cells: cells, options: options, reuseIdentifier: reuseIdentifier)
        delegate = nil
    }
    
}
