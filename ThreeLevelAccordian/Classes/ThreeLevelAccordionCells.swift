//
//  ThreeLevelAccordionCells.swift
//
//  Created by Amrata Baghel on 29/05/16.
//  Copyright © 2016 amratab. All rights reserved.
//

import Foundation
class ThreeLevelAccordionCells {
    private (set) var items = [Item]()
    
    class Item {
        var isHidden: Bool
        var isExpanded: Bool
        var value: AnyObject
        init(_ hidden: Bool = true, value: AnyObject, isExpanded: Bool = false) {
            self.isHidden = hidden
            self.value = value
            self.isExpanded = isExpanded
        }
    }
    
    class HeaderItem: Item {
        var imageURL:String?
        init (value: AnyObject, imageURL: String) {
            super.init(false, value: value)
            self.imageURL = imageURL
        }
    }
    
    class SubItem: Item{
        init(value: AnyObject) {
            super.init(true, value: value)
        }
    }
    
    func append(item: Item) {
        self.items.append(item)
    }
    
    func removeAll() {
        self.items.removeAll()
    }
    
    func expand(headerIndex: Int) {
        self.toogleVisible(headerIndex, isHidden: false)
    }
    
    func collapse(headerIndex: Int) {
        self.toogleVisible(headerIndex, isHidden: true)
    }
    
    private func toogleVisible(var headerIndex: Int, isHidden: Bool) {
        if !(self.items[headerIndex] is SubItem) {
            if (self.items[headerIndex] is HeaderItem) {
                headerIndex++
                
                while headerIndex < self.items.count && !(self.items[headerIndex] is HeaderItem) {
                    self.items[headerIndex].isHidden = isHidden
                    if (isHidden) {
                        toogleVisible(headerIndex, isHidden: isHidden)
                    }
                    headerIndex+=2
                }
                
            } else {
                headerIndex++
                self.items[headerIndex].isHidden = isHidden
            }
        }
    }
}