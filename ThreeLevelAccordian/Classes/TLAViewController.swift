//
//  TLAViewController.swift
//  Pods
//
//  Created by Sahil Dhankhar on 30/09/16.
//
//

import UIKit

public class TLAViewController: UIViewController {
    
    var cells: [TLACell] = [TLACell]()
    var properties: [TLAOption] = [TLAOption]()
    
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

    public override func viewDidLoad() {
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
            case let .HeaderTextColor(value):
                headerCellTextColor = value
            case let .HeaderTextFont(value):
                headerCellFont = value
            case let .HeaderCellBackgroundColor(value):
                headerCellBackgrondColor = value
            case let .HeaderCellHeight(value):
                headerCellHeight = value
            case let .SubItemTextFont(value):
                subItemCellFont = value
            case let .SubItemTextColor(value):
                subItemCellTextColor = value
            case let .SubItemCellBackgroundColor(value):
                subItemCellBackgrondColor = value
            case let .SubItemCellHeight(value):
                subItemCellHeight = value
            case let .IsMultiline(value):
                isMultiline = value
            case let .ItemTextFont(value):
                itemCellFont = value
            case let .ItemTextColor(value):
                itemCellTextColor = value
            case let .ItemCellBackgroundColor(value):
                itemCellBackgrondColor = value
            case let .ItemCellHeight(value):
                itemCellHeight = value
            case let .ExpandIcon(value):
                customExpandImage = value
            case let .CollapseIcon(value):
                customCollapseImage = value
            case let .UseAccessoryIcons(value):
                useAccessoryImages = value
            case let .UseSingleValues(value):
                useSingleValues = value
            case let .CellFont(value):
                cellFont = value
            case let .CellColor(value):
                cellColor = value
            case let .CellBackgroundColor(value):
                cellBackgroundColor = value
            case let .CellHeight(value):
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
                itemCellTextColor = cellBackgroundColor
            }
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func expand(headerIndex: Int) {
        self.toggleVisible(headerIndex, isHidden: false)
    }
    
    func collapse(headerIndex: Int) {
        self.toggleVisible(headerIndex, isHidden: true)
    }
    
    func isExpandable(headerIndex: Int) -> Bool {
        if self.cells[headerIndex] is TLAHeaderItem {
            if headerIndex + 1 < self.cells.count && !(self.cells[headerIndex+1] is TLASubItem) {
                return true
            }
        } else if !(self.cells[headerIndex] is TLASubItem) {
            if (headerIndex + 1 < self.cells.count && self.cells[headerIndex+1] is TLASubItem) {
                return true
            }
        }
        return false
    }
    
    private func toggleVisible(headerIndex: Int, isHidden: Bool) {
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
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let item = self.cells[indexPath.row]
        
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
    
    
   public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.cells[indexPath.row]
        let value = item.value as? String
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) {
            cell.textLabel?.text = value
//            let labelFont = cell.textLabel?.font
            let label = cell.textLabel!
            if let headerItem = item as? TLAHeaderItem {
                if let headerFont = headerCellFont {
                    cell.textLabel?.font = headerFont
                }
                if let headerImage = headerItem.imageURL, image = UIImage(named: headerImage) {
                    cell.imageView?.image = image
                }
                
                if let accessoryView = accessory(for: indexPath, and: .Expand) {
                    cell.accessoryView = accessoryView
                } else {
                    cell.accessoryType = UITableViewCellAccessoryType.None
                }

                if let headerCellBackgroundColor = self.headerCellBackgrondColor {
                    cell.backgroundColor = headerCellBackgroundColor
                }
                if let headerCellTextColor = self.headerCellTextColor {
                    cell.textLabel?.textColor = headerCellTextColor
                }
            } else if (item as? TLASubItem != nil) {
                if isMultiline {
                    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    label.numberOfLines = 0
                    label.sizeToFit()
                }
                
                cell.imageView?.image = nil
                cell.accessoryView = nil
                cell.accessoryType = UITableViewCellAccessoryType.None
                
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
                
//                label.lineBreakMode = NSLineBreakMode.ByWordWrapping
//                label.numberOfLines = 0
//                label.sizeToFit()
                
                cell.imageView?.image = nil
                
                if let accessoryView = accessory(for: indexPath, and: .Expand) {
                    cell.accessoryView = accessoryView
                } else {
                    cell.accessoryType = UITableViewCellAccessoryType.None
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = self.cells[indexPath.row]
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if item is TLAHeaderItem {
            if self.selectedHeaderIndex == nil {
                self.selectedHeaderIndex = indexPath.row
            } else {
                self.previouslySelectedHeaderIndex = self.selectedHeaderIndex
                self.selectedHeaderIndex = indexPath.row
            }
            
            if let previouslySelectedHeaderIndex = self.previouslySelectedHeaderIndex {
                let previousIndexPath = NSIndexPath(forItem: previouslySelectedHeaderIndex, inSection: 0)
                let previousCell = tableView.cellForRowAtIndexPath(previousIndexPath)
                
                if let accessoryView = accessory(for: previousIndexPath, and: .Expand) {
                    previousCell?.accessoryView = accessoryView
                } else {
                    previousCell?.accessoryType = UITableViewCellAccessoryType.None
                }

                collapse(previouslySelectedHeaderIndex)
            }
            
            var accessoryType: AccordianCellButtonType
            if self.previouslySelectedHeaderIndex != self.selectedHeaderIndex {
                expand(self.selectedHeaderIndex!)
                accessoryType = .Collapse
            } else {
                accessoryType = .Expand

                self.selectedHeaderIndex = nil
                self.previouslySelectedHeaderIndex = nil
            }
            if let accessoryView = accessory(for: indexPath, and: accessoryType) {
                cell?.accessoryView = accessoryView
            } else {
                cell?.accessoryType = UITableViewCellAccessoryType.None
            }
            
        } else if (item as? TLASubItem == nil) {
            if self.selectedItemIndex == nil {
                self.selectedItemIndex = indexPath.row
            } else {
                self.previouslySelectedItemIndex = self.selectedItemIndex
                self.selectedItemIndex = indexPath.row
            }
            
            if let previouslySelectedItemIndex = self.previouslySelectedItemIndex {
                let previousIndexPath = NSIndexPath(forItem: previouslySelectedItemIndex, inSection: 0)
                let previousCell = tableView.cellForRowAtIndexPath(previousIndexPath)

                if let accessoryView = accessory(for: previousIndexPath, and: .Expand) {
                    previousCell?.accessoryView = accessoryView
                } else {
                    previousCell?.accessoryType = UITableViewCellAccessoryType.None
                }
                collapse(previouslySelectedItemIndex)
            }
            
            var accessoryType: AccordianCellButtonType
            if self.previouslySelectedItemIndex != self.selectedItemIndex {
                expand(self.selectedItemIndex!)
                accessoryType = .Collapse
            } else {
                accessoryType = .Expand
                self.selectedItemIndex = nil
                self.previouslySelectedItemIndex = nil
            }
            if let accessoryView = accessory(for: indexPath, and: accessoryType) {
                cell?.accessoryView = accessoryView
            } else {
                cell?.accessoryType = UITableViewCellAccessoryType.None
            }
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        self.updateHiddenItems(tableView)
    }
    
    func accessory(for indexPath: NSIndexPath, and type: AccordianCellButtonType) -> UIView? {
        if useAccessoryImages && isExpandable(indexPath.row) {
            if type == AccordianCellButtonType.Expand {
                if let customExpandImage = self.customExpandImage {
                    return AccordianCellAccessoryView.getCellAccessoryWithCustomImage(customExpandImage)
                }
            }
            if type == .Collapse {
                if let customCollapseImage = self.customCollapseImage {
                    return AccordianCellAccessoryView.getCellAccessoryWithCustomImage(customCollapseImage)
                }
            }
            return AccordianCellAccessoryView.getCellAccessory(type)
        }
        return nil
    }
    
    func updateHiddenItems(tableView: UITableView) {
        for (index, cell) in self.cells.enumerate() {
            if ((cell as? TLASubItem == nil) && cell.isHidden) {
                let indexPath = NSIndexPath(forItem: index, inSection: 0)
                let hiddenCell = tableView.cellForRowAtIndexPath(indexPath)
                if let accessoryView = accessory(for: indexPath, and: .Expand) {
                    hiddenCell?.accessoryView = accessoryView
                } else {
                    hiddenCell?.accessoryType = UITableViewCellAccessoryType.None
                }
            }
        }
    }
}