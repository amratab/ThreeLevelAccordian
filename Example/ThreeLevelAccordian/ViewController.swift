//
//  ViewController.swift
//  ThreeLevelAccordian
//
//  Created by Amrata Baghel on 09/30/2016.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import UIKit
import ThreeLevelAccordian

class ViewController: UIViewController, TLADelegate, UIActionSheetDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var cells = [TLACell]()
    var delegateController: TLAViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Checklist"
        let s = UIActionSheet()
        s.delegate = self
        let backgroundColor = UIColor(red: 237.0 / 255.0, green: 254.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
        let textColor = UIColor(red: 31.0 / 255.0, green: 217.0 / 255.0, blue: 185.0 / 255.0, alpha: 1.0)
        
        
        cells.append(TLAHeaderItem(value: "Bathroom" as AnyObject, imageURL: "bathroom_grey_32.png"))
        cells.append(TLACell(value: "Shower" as AnyObject))
        cells.append(TLASubItem(value: "Shower pores should be cleaned effectively by brushing." as AnyObject))
        cells.append(TLACell(value: "Tap" as AnyObject))
        cells.append(TLASubItem(value: "Taps must be washed with soap and all the salt removed." as AnyObject))
        cells.append(TLACell(value: "Toilet" as AnyObject, imageURL: "toilet_grey_32.png"))
        cells.append(TLASubItem(value: "Should be made stains and germs free." as AnyObject))

        cells.append(TLAHeaderItem(value: "Bedroom" as AnyObject, imageURL: "bedroom_grey_32.png"))
        cells.append(TLACell(value: "Bed" as AnyObject))
        cells.append(TLASubItem(value: "Remove all the dust." as AnyObject))
        cells.append(TLACell(value: "Dressing" as AnyObject))

        
        cells.append(TLAHeaderItem(value: "Kitchen" as AnyObject, imageURL: "kitchen_grey_32.png"))
        cells.append(TLACell(value: "Utensils" as AnyObject))
        cells.append(TLASubItem(value: "There are many type of utensils like tongs, rolling pin, pan, non stick pans. Wash them all." as AnyObject))
        cells.append(TLACell(value: "Sink" as AnyObject))
        cells.append(TLASubItem(value: "Clean the sink" as AnyObject))
        
        cells.append(TLAHeaderItem(value: "Hallway" as AnyObject, imageURL: "hallway_grey_32.png"))
        cells.append(TLACell(value: "Stairs" as AnyObject, imageURL: "stairs_grey_32.png"))
        cells.append(TLASubItem(value: "One stair, two stair, three stair, all stairs clean clean." as AnyObject))
        cells.append(TLACell(value: "Hall" as AnyObject))
        cells.append(TLASubItem(value: "Clean the hall" as AnyObject, imageURL: "hall_grey_32.png"))
        
        cells.append(TLAHeaderItem(value: "Lounge" as AnyObject, imageURL: "lounge_grey_32.png"))
        cells.append(TLACell(value: "Dining Area" as AnyObject, imageURL: "dining_area_grey_32.png"))
        cells.append(TLASubItem(value: "All tables and chairs scrubbed for dust and germs." as AnyObject))
        
        
        cells.append(TLAHeaderItem(value: "Study Room" as AnyObject, imageURL: "study_room_grey_32.png"))
        
        cells.append(TLAHeaderItem(value: "Conservatory" as AnyObject, imageURL: "conservatory_grey_32.png"))
        cells.append(TLACell(value: "Utilities" as AnyObject, imageURL: "utility_room_grey_32.png"))
        cells.append(TLASubItem(value: "Clean! Clean!" as AnyObject))
        
        
        cells.append(TLAHeaderItem(value: "Entrance" as AnyObject, imageURL: "entrance_grey_32.png"))
        cells.append(TLACell(value: "Back Room" as AnyObject, imageURL: "back_room_grey_32.png"))
        cells.append(TLASubItem(value: "Clean! Clean!" as AnyObject))
        
        
        let options: [TLAOption] = [
            .useAccessoryIcons(true),
            .expandIcon(UIImage(named: "MyExpandIcon.png")!),
            .collapseIcon(UIImage(named: "MyCollapseIcon.png")!),
            .headerTextFont(UIFont.systemFont(ofSize: CGFloat(15.0))),
            .headerTextColor(textColor),
            .headerCellBackgroundColor(backgroundColor),
            .subItemTextFont(UIFont.systemFont(ofSize: CGFloat(12.0))),
            .subItemTextColor(UIColor.black),
            .subItemCellBackgroundColor(UIColor.white),
            .itemTextFont(UIFont.systemFont(ofSize: CGFloat(14.0))),
            .itemTextColor(UIColor.black),
            .itemCellBackgroundColor(UIColor.white),
            ]
        
        let threeLevelAccordian = ThreeLevelAccordian.init(cells: cells, options: options, reuseIdentifier: "checklistAccordianCell")
        threeLevelAccordian.delegate = self
        delegateController = threeLevelAccordian.controller
        tableView.dataSource = delegateController
        tableView.delegate = delegateController
        tableView.reloadData()
    }
    
    func didSelectItemAtIndex(_ index: Int) {
        if self.cells[index] as? TLASubItem != nil {
            let alertController = UIAlertController(title: "Clicked", message: "Clicked \(index)", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

