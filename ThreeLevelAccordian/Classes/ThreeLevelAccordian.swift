//
//  ThreeLevelAccordian.swift
//  Pods
//
//  Created by Sahil Dhankhar on 30/09/16.
//
//

import Foundation
import UIKit

public protocol TLADelegate {
    func didSelectItemAtIndex(index: Int)
}

public class ThreeLevelAccordian {

    public var controller: TLAViewController!
    
    public var delegate: TLADelegate! {
        didSet {
            controller.delegate = delegate
        }
    }
    
    public init(cells: [TLACell], options: [TLAOption]?, reuseIdentifier: String) {
        controller = TLAViewController.init(cells: cells, options: options, reuseIdentifier: reuseIdentifier)
        delegate = nil
    }
    
}