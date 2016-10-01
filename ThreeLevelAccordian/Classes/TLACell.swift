//
//  TLACell.swift
//  Pods
//
//  Created by Sahil Dhankhar on 30/09/16.
//
//

import Foundation


public class TLACell {
    var isHidden: Bool
    var isExpanded: Bool
    var value: AnyObject
    public init(_ hidden: Bool = true, value: AnyObject, isExpanded: Bool = false) {
        self.isHidden = hidden
        self.value = value
        self.isExpanded = isExpanded
    }
}

public class TLAHeaderItem: TLACell {
    var imageURL:String?
    public init (value: AnyObject, imageURL: String) {
        super.init(false, value: value)
        self.imageURL = imageURL
    }
}

public class TLASubItem: TLACell {
    public init(value: AnyObject) {
        super.init(true, value: value)
    }
}
