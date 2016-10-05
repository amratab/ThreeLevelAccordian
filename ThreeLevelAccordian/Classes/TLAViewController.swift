//
//  TLAViewController.swift
//  Pods
//
//  Created by Amrata Baghel on 30/09/16.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import UIKit

open class TLAViewController: UIViewController {
    
    var cells: [TLACell] = [TLACell]()
    var properties: [TLAOption] = [TLAOption]()
    var delegate: TLADelegate!
    //used for display
    
    var textColor: UIColor!
    var font: UIFont!
    var cellBackgroundColor: UIColor!
    
    //Cell Type specific
    
    //Header cell
    var headerCellHeight: CGFloat = 60.0
    var headerCellFont: UIFont!
    var headerCellBackgrondColor: UIColor!
    var headerCellTextColor: UIColor!
    
    //SubItem cell
    var subItemCellHeight: CGFloat = 44.0
    var subItemCellFont: UIFont!
    var subItemCellBackgrondColor: UIColor!
    var subItemCellTextColor: UIColor!
    var isMultiline: Bool = true
    
    //Item cell
    var itemCellHeight: CGFloat = 44.0
    var itemCellFont: UIFont!
    var itemCellBackgrondColor: UIColor!
    var itemCellTextColor: UIColor!
    
    //Custom Accessory images
    var customExpandImage: UIImage!
    var customCollapseImage: UIImage!
    var useAccessoryImages: Bool = true
    
    
    //used while working
    var cellReuseIdentifier: String = "TLACell"
    var selectedHeaderIndex: Int?
    var selectedItemIndex: Int?
    var selectedSubItemIndex: Int?
    var previouslySelectedHeaderIndex: Int?
    var previouslySelectedItemIndex: Int?

    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(cells: [TLACell], options: [TLAOption]?, reuseIdentifier: String) {
        super.init(nibName: "TLAViewController", bundle: nil)
        self.cells = cells
        if let options = options {
            self.properties = options
        }
        self.cellReuseIdentifier = reuseIdentifier
        finalizeProperties()
    }
    
    func finalizeProperties() {

        var cellFont: UIFont!
        var cellColor: UIColor!
        var cellBackgroundColor: UIColor!
        var cellHeight: CGFloat!
        var useSingleValues: Bool = false
        
        for option in properties {
            
            switch (option) {
            case let .headerTextColor(value):
                headerCellTextColor = value
            case let .headerTextFont(value):
                headerCellFont = value
            case let .headerCellBackgroundColor(value):
                headerCellBackgrondColor = value
            case let .headerCellHeight(value):
                headerCellHeight = value
            case let .subItemTextFont(value):
                subItemCellFont = value
            case let .subItemTextColor(value):
                subItemCellTextColor = value
            case let .subItemCellBackgroundColor(value):
                subItemCellBackgrondColor = value
            case let .subItemCellHeight(value):
                subItemCellHeight = value
            case let .isMultiline(value):
                isMultiline = value
            case let .itemTextFont(value):
                itemCellFont = value
            case let .itemTextColor(value):
                itemCellTextColor = value
            case let .itemCellBackgroundColor(value):
                itemCellBackgrondColor = value
            case let .itemCellHeight(value):
                itemCellHeight = value
            case let .expandIcon(value):
                customExpandImage = value
            case let .collapseIcon(value):
                customCollapseImage = value
            case let .useAccessoryIcons(value):
                useAccessoryImages = value
            case let .useSingleValues(value):
                useSingleValues = value
            case let .cellFont(value):
                cellFont = value
            case let .cellColor(value):
                cellColor = value
            case let .cellBackgroundColor(value):
                cellBackgroundColor = value
            case let .cellHeight(value):
                cellHeight = value
            }
        }
        
        if useSingleValues {
            if let cellFont = cellFont {
                headerCellFont = cellFont
                subItemCellFont = cellFont
                itemCellFont = cellFont
            }
            if let cellHeight = cellHeight {
                headerCellHeight = cellHeight
                subItemCellHeight = cellHeight
                itemCellHeight = cellHeight
            }
            if let cellColor = cellColor {
                headerCellTextColor = cellColor
                subItemCellTextColor = cellColor
                itemCellTextColor = cellColor
            }
            if let cellBackgroundColor = cellBackgroundColor {
                headerCellBackgrondColor = cellBackgroundColor
                subItemCellBackgrondColor = cellBackgroundColor
                itemCellBackgrondColor = cellBackgroundColor
            }
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func expand(_ headerIndex: Int) {
        self.toggleVisible(headerIndex, isHidden: false)
    }
    
    func collapse(_ headerIndex: Int) {
        self.toggleVisible(headerIndex, isHidden: true)
    }
    
    func isExpandable(_ headerIndex: Int) -> Bool {
        if self.cells[headerIndex] is TLAHeaderItem {
            if headerIndex + 1 < self.cells.count && !(self.cells[headerIndex+1] is TLASubItem) &&
            !(self.cells[headerIndex+1] is TLAHeaderItem) {
                return true
            }
        } else if !(self.cells[headerIndex] is TLASubItem) {
            if (headerIndex + 1 < self.cells.count && self.cells[headerIndex+1] is TLASubItem) {
                return true
            }
        }
        return false
    }
    
    fileprivate func toggleVisible(_ headerIndex: Int, isHidden: Bool) {
        var headerIdx = headerIndex
        if !(self.cells[headerIdx] is TLASubItem) {
            if (self.cells[headerIdx] is TLAHeaderItem) {
                headerIdx = headerIdx+1
                
                while headerIdx < self.cells.count && !(self.cells[headerIdx] is TLAHeaderItem) {
                    if !(self.cells[headerIdx] is TLASubItem) {
                        self.cells[headerIdx].isHidden = isHidden
                        if (isHidden) {
                            toggleVisible(headerIdx, isHidden: isHidden)
                        }
                    }
                    headerIdx = headerIdx+1
                }
                
            } else {
                headerIdx = headerIdx+1
                if (self.cells[headerIdx] is TLASubItem) {
                    self.cells[headerIdx].isHidden = isHidden
                }
            }
        }
    }

}


extension TLAViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = self.cells[(indexPath as NSIndexPath).row]
        
        if item is TLAHeaderItem {
            return headerCellHeight
        } else if (item.isHidden) {
            return 0
        } else if (item as? TLASubItem != nil) {
            if isMultiline {
                tableView.estimatedRowHeight = 100
                return UITableViewAutomaticDimension
            } else {
                return subItemCellHeight
            }
            
        } else {
            return itemCellHeight
        }
    }
    
    
   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.cells[(indexPath as NSIndexPath).row]
        let value = item.value as? String
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) {
            cell.textLabel?.text = value
            let label = cell.textLabel!
            cell.imageView?.image = nil
            if let headerImage = item.imageURL, let image = UIImage(named: headerImage) {
                cell.imageView?.image = image
            }
            if let accessoryView = accessory(for: indexPath, and: .expand) {
                cell.accessoryView = accessoryView
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
                cell.accessoryView = nil
            }

            if let _ = item as? TLAHeaderItem {
                if let headerFont = headerCellFont {
                    cell.textLabel?.font = headerFont
                }
                
                
                if let headerCellBackgroundColor = self.headerCellBackgrondColor {
                    cell.backgroundColor = headerCellBackgroundColor
                }
                if let headerCellTextColor = self.headerCellTextColor {
                    cell.textLabel?.textColor = headerCellTextColor
                }
            } else if (item as? TLASubItem != nil) {
                if isMultiline {
                    label.lineBreakMode = NSLineBreakMode.byWordWrapping
                    label.numberOfLines = 0
                    label.sizeToFit()
                }
                
                cell.accessoryView = nil
                cell.accessoryType = UITableViewCellAccessoryType.none
                
                if let subItemCellBackgrondColor = self.subItemCellBackgrondColor {
                    cell.backgroundColor = subItemCellBackgrondColor
                }
                if let subItemCellTextColor = self.subItemCellTextColor {
                    cell.textLabel?.textColor = subItemCellTextColor
                }
                if let subItemCellFont = self.subItemCellFont {
                    cell.textLabel?.font = subItemCellFont
                }
            } else {
                if let itemCellBackgrondColor = self.itemCellBackgrondColor {
                    cell.backgroundColor = itemCellBackgrondColor
                }
                if let itemCellTextColor = self.itemCellTextColor {
                    cell.textLabel?.textColor = itemCellTextColor
                }
                if let itemCellFont = self.itemCellFont {
                    cell.textLabel?.font = itemCellFont
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.cells[(indexPath as NSIndexPath).row]
        let cell = tableView.cellForRow(at: indexPath)
        if item is TLAHeaderItem {
            if self.selectedHeaderIndex == nil {
                self.selectedHeaderIndex = (indexPath as NSIndexPath).row
            } else {
                self.previouslySelectedHeaderIndex = self.selectedHeaderIndex
                self.selectedHeaderIndex = (indexPath as NSIndexPath).row
            }
            
            if let previouslySelectedHeaderIndex = self.previouslySelectedHeaderIndex {
                let previousIndexPath = IndexPath(item: previouslySelectedHeaderIndex, section: 0)
                let previousCell = tableView.cellForRow(at: previousIndexPath)
                
                if let accessoryView = accessory(for: previousIndexPath, and: .expand) {
                    previousCell?.accessoryView = accessoryView
                } else {
                    previousCell?.accessoryType = UITableViewCellAccessoryType.none
                    previousCell?.accessoryView = nil
                }

                collapse(previouslySelectedHeaderIndex)
            }
            
            var accessoryType: AccordianCellButtonType
            if self.previouslySelectedHeaderIndex != self.selectedHeaderIndex {
                expand(self.selectedHeaderIndex!)
                accessoryType = .collapse
            } else {
                accessoryType = .expand

                self.selectedHeaderIndex = nil
                self.previouslySelectedHeaderIndex = nil
            }
            if let accessoryView = accessory(for: indexPath, and: accessoryType) {
                cell?.accessoryView = accessoryView
            } else {
                cell?.accessoryType = UITableViewCellAccessoryType.none
                cell?.accessoryView = nil
            }
            
        } else if (item as? TLASubItem == nil) {
            if self.selectedItemIndex == nil {
                self.selectedItemIndex = (indexPath as NSIndexPath).row
            } else {
                self.previouslySelectedItemIndex = self.selectedItemIndex
                self.selectedItemIndex = (indexPath as NSIndexPath).row
            }
            
            if let previouslySelectedItemIndex = self.previouslySelectedItemIndex {
                let previousIndexPath = IndexPath(item: previouslySelectedItemIndex, section: 0)
                let previousCell = tableView.cellForRow(at: previousIndexPath)

                if let accessoryView = accessory(for: previousIndexPath, and: .expand) {
                    previousCell?.accessoryView = accessoryView
                } else {
                    previousCell?.accessoryType = UITableViewCellAccessoryType.none
                    previousCell?.accessoryView = nil
                }
                collapse(previouslySelectedItemIndex)
            }
            
            var accessoryType: AccordianCellButtonType
            if self.previouslySelectedItemIndex != self.selectedItemIndex {
                expand(self.selectedItemIndex!)
                accessoryType = .collapse
            } else {
                accessoryType = .expand
                self.selectedItemIndex = nil
                self.previouslySelectedItemIndex = nil
            }
            if let accessoryView = accessory(for: indexPath, and: accessoryType) {
                cell?.accessoryView = accessoryView
            } else {
                cell?.accessoryType = UITableViewCellAccessoryType.none
                cell?.accessoryView = nil
            }
        }
        if let delegate = delegate {
            delegate.didSelectItemAtIndex((indexPath as NSIndexPath).row)
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        self.updateHiddenItems(tableView)
    }
    
    func accessory(for indexPath: IndexPath, and type: AccordianCellButtonType) -> UIView? {
        if useAccessoryImages && isExpandable((indexPath as NSIndexPath).row) {
            if type == AccordianCellButtonType.expand {
                if let customExpandImage = self.customExpandImage {
                    return AccordianCellAccessoryView.getCellAccessoryWithCustomImage(customExpandImage)
                }
            }
            if type == .collapse {
                if let customCollapseImage = self.customCollapseImage {
                    return AccordianCellAccessoryView.getCellAccessoryWithCustomImage(customCollapseImage)
                }
            }
            return AccordianCellAccessoryView.getCellAccessory(type)
        }
        return nil
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func updateHiddenItems(_ tableView: UITableView) {
        for (index, cell) in self.cells.enumerated() {
            if ((cell as? TLASubItem == nil) && cell.isHidden) {
                let indexPath = IndexPath(item: index, section: 0)
                let hiddenCell = tableView.cellForRow(at: indexPath)
                if let accessoryView = accessory(for: indexPath, and: .expand) {
                    hiddenCell?.accessoryView = accessoryView
                } else {
                    hiddenCell?.accessoryType = UITableViewCellAccessoryType.none
                    hiddenCell?.accessoryView = nil
                }
            }
        }
    }
}
