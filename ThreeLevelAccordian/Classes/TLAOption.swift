//
//  TLAOption.swift
//  Pods
//
//  Created by Amrata Baghel on 30/09/16.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import Foundation

public enum TLAOption {
    case CellFont(UIFont)
    case CellColor(UIColor)
    case CellBackgroundColor(UIColor)
    case CellHeight(CGFloat)
    case UseSingleValues(Bool)

    case ExpandIcon(UIImage)    //Displayed when the cell is not expanded
    case CollapseIcon(UIImage)  //Displayed when the cell is already in exapanded state
    case UseAccessoryIcons(Bool) //Says if accessory views are to be used or not
    
    case HeaderTextFont(UIFont)
    case HeaderTextColor(UIColor)
    case HeaderCellBackgroundColor(UIColor)
    case HeaderCellHeight(CGFloat)
    
    case SubItemTextFont(UIFont)
    case SubItemTextColor(UIColor)
    case SubItemCellBackgroundColor(UIColor)
    case SubItemCellHeight(CGFloat)
    case IsMultiline(Bool) //Says if the innermost cell has multiline text or not
    
    case ItemTextFont(UIFont)
    case ItemTextColor(UIColor)
    case ItemCellBackgroundColor(UIColor)
    case ItemCellHeight(CGFloat)
    
}