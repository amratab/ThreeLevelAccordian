//
//  TLAOption.swift
//  Pods
//
//  Created by Amrata Baghel on 30/09/16.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import Foundation

public enum TLAOption {
    case cellFont(UIFont)
    case cellColor(UIColor)
    case cellBackgroundColor(UIColor)
    case cellHeight(CGFloat)
    case useSingleValues(Bool)

    case expandIcon(UIImage)    //Displayed when the cell is not expanded
    case collapseIcon(UIImage)  //Displayed when the cell is already in exapanded state
    case useAccessoryIcons(Bool) //Says if accessory views are to be used or not
    
    case headerTextFont(UIFont)
    case headerTextColor(UIColor)
    case headerCellBackgroundColor(UIColor)
    case headerCellHeight(CGFloat)
    
    case subItemTextFont(UIFont)
    case subItemTextColor(UIColor)
    case subItemCellBackgroundColor(UIColor)
    case subItemCellHeight(CGFloat)
    case isMultiline(Bool) //Says if the innermost cell has multiline text or not
    
    case itemTextFont(UIFont)
    case itemTextColor(UIColor)
    case itemCellBackgroundColor(UIColor)
    case itemCellHeight(CGFloat)
    
}
