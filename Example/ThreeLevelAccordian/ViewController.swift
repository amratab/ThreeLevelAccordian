//
//  ViewController.swift
//  ThreeLevelAccordian
//
//  Created by Amrata Baghel on 09/30/2016.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import UIKit
import ThreeLevelAccordian

class ViewController: UIViewController, TLADelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var cells = [TLACell]()
    var delegateController: TLAViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Checklist"
        
        let backgroundColor = UIColor(red: 237.0 / 255.0, green: 254.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
        let textColor = UIColor(red: 31.0 / 255.0, green: 217.0 / 255.0, blue: 185.0 / 255.0, alpha: 1.0)
        
        
        cells.append(TLAHeaderItem(value: "Bathroom", imageURL: "bathroom_grey_32.png"))
        cells.append(TLACell(value: "Shower"))
        cells.append(TLASubItem(value: "Shower pores should be cleaned effectively by brushing."))
        cells.append(TLACell(value: "Tap"))
        cells.append(TLASubItem(value: "Taps must be washed with soap and all the salt removed."))
        cells.append(TLACell(value: "Toilet", imageURL: "toilet_grey_32.png"))
        cells.append(TLASubItem(value: "Should be made stains and germs free."))

        cells.append(TLAHeaderItem(value: "Bedroom", imageURL: "bedroom_grey_32.png"))
        cells.append(TLACell(value: "Bed"))
        cells.append(TLASubItem(value: "Remove all the dust."))
        cells.append(TLACell(value: "Dressing"))

        
        cells.append(TLAHeaderItem(value: "Kitchen", imageURL: "kitchen_grey_32.png"))
        cells.append(TLACell(value: "Utensils"))
        cells.append(TLASubItem(value: "There are many type of utensils like tongs, rolling pin, pan, non stick pans. Wash them all."))
        cells.append(TLACell(value: "Sink"))
        cells.append(TLASubItem(value: "Clean the sink"))
        
        cells.append(TLAHeaderItem(value: "Hallway", imageURL: "hallway_grey_32.png"))
        cells.append(TLACell(value: "Stairs", imageURL: "stairs_grey_32.png"))
        cells.append(TLASubItem(value: "One stair, two stair, three stair, all stairs clean clean."))
        cells.append(TLACell(value: "Hall"))
        cells.append(TLASubItem(value: "Clean the hall", imageURL: "hall_grey_32.png"))
        
        cells.append(TLAHeaderItem(value: "Lounge", imageURL: "lounge_grey_32.png"))
        cells.append(TLACell(value: "Dining Area", imageURL: "dining_area_grey_32.png"))
        cells.append(TLASubItem(value: "All tables and chairs scrubbed for dust and germs."))
        
        
        cells.append(TLAHeaderItem(value: "Study Room", imageURL: "study_room_grey_32.png"))
        
        cells.append(TLAHeaderItem(value: "Conservatory", imageURL: "conservatory_grey_32.png"))
        cells.append(TLACell(value: "Utilities", imageURL: "utility_room_grey_32.png"))
        cells.append(TLASubItem(value: "Clean! Clean!"))
        
        
        cells.append(TLAHeaderItem(value: "Entrance", imageURL: "entrance_grey_32.png"))
        cells.append(TLACell(value: "Back Room", imageURL: "back_room_grey_32.png"))
        cells.append(TLASubItem(value: "Clean! Clean!"))
        
        
        let options: [TLAOption] = [
            .UseAccessoryIcons(true),
            .ExpandIcon(UIImage(named: "MyExpandIcon.png")!),
            .CollapseIcon(UIImage(named: "MyCollapseIcon.png")!),
            .HeaderTextFont(UIFont.systemFontOfSize(CGFloat(15.0))),
            .HeaderTextColor(textColor),
            .HeaderCellBackgroundColor(backgroundColor),
            .SubItemTextFont(UIFont.systemFontOfSize(CGFloat(12.0))),
            .SubItemTextColor(UIColor.blackColor()),
            .SubItemCellBackgroundColor(UIColor.whiteColor()),
            .ItemTextFont(UIFont.systemFontOfSize(CGFloat(14.0))),
            .ItemTextColor(UIColor.blackColor()),
            .ItemCellBackgroundColor(UIColor.whiteColor()),
            ]
        
        let threeLevelAccordian = ThreeLevelAccordian.init(cells: cells, options: options, reuseIdentifier: "checklistAccordianCell")
        threeLevelAccordian.delegate = self
        delegateController = threeLevelAccordian.controller
        tableView.dataSource = delegateController
        tableView.delegate = delegateController
        tableView.reloadData()
    }
    
    func didSelectItemAtIndex(index: Int) {
        if self.cells[index] as? TLASubItem != nil {
            let alertController = UIAlertController(title: "Clicked", message: "Clicked \(index)", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}

