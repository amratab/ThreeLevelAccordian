//
//  ThreeLevelAccordian.swift
//  Pods
//
//  Created by Sahil Dhankhar on 30/09/16.
//
//

import Foundation
import UIKit

public class ThreeLevelAccordian {

    public var controller: TLAViewController!
    
    public init(cells: [TLACell], options: [TLAOption]?, reuseIdentifier: String) {
        controller = TLAViewController.init(cells: cells, options: options, reuseIdentifier: reuseIdentifier)
    }
    
}