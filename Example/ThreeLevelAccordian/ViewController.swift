//
//  ViewController.swift
//  ThreeLevelAccordian
//
//  Created by Amrata Baghel on 09/30/2016.
//  Copyright (c) 2016 Amrata Baghel. All rights reserved.
//

import UIKit
import ThreeLevelAccordian

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cells = [TLACell]()
    var delegateController: TLAViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        cells.append(TLAHeaderItem(value: "Header1", imageURL: "bathroom_darkgreen"))
        cells.append(TLACell(value: "Middle item1"))
        cells.append(TLASubItem(value: "Lower item1"))
        cells.append(TLACell(value: "Middle item2"))
        cells.append(TLASubItem(value: "Lower item2"))
        cells.append(TLACell(value: "Middle item3"))
//        cells.append(TLASubItem(value: "Lower item3"))

        cells.append(TLAHeaderItem(value: "Header2", imageURL: "bathroom_darkgreen"))
        cells.append(TLACell(value: "Middle item21"))
        cells.append(TLASubItem(value: "Lower item21"))
        cells.append(TLACell(value: "Middle item22"))
//        cells.append(TLASubItem(value: "Lower item22"))

        cells.append(TLACell(value: "Middle item23"))
        cells.append(TLASubItem(value: "Lower item23"))
        cells.append(TLAHeaderItem(value: "Header3", imageURL: "bathroom_darkgreen"))
        cells.append(TLACell(value: "Middle item31"))
//        cells.append(TLASubItem(value: "Lower item31"))

        cells.append(TLACell(value: "Middle item32"))
        cells.append(TLASubItem(value: "Lower item32"))
        cells.append(TLACell(value: "Middle item33"))
        cells.append(TLASubItem(value: "Lower item33"))
        
        
        let options: [TLAOption] = [ .CellBackgroundColor(UIColor.lightGrayColor()),
                                       .CellColor(UIColor.blueColor()),
                                       .CellFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
                                       .CellHeight(100.0),
                                       .UseSingleValues(false),
                                       
                                       .UseAccessoryIcons(true),
                                       .ExpandIcon(UIImage(named: "MyExpandIcon.png")!),
                                       .CollapseIcon(UIImage(named: "MyCollapseIcon.png")!),
            
                                       .HeaderTextFont(UIFont(name: "HelveticaNeue-Medium", size: 20.0)!),
                                       .HeaderTextColor(UIColor.redColor()),
                                       .HeaderCellBackgroundColor(UIColor.cyanColor()),
                                       .HeaderCellHeight(150.0),
                                       
                                       .SubItemTextFont(UIFont(name: "HelveticaNeue-Medium", size: 10.0)!),
                                       .SubItemTextColor(UIColor.purpleColor()),
                                       .SubItemCellBackgroundColor(UIColor.darkGrayColor()),
                                       .SubItemCellHeight(100.0),
                                       .IsMultiline(false),
                                       
                                       .ItemTextFont(UIFont(name: "HelveticaNeue-Medium", size: 15.0)!),
                                       .ItemTextColor(UIColor.brownColor()),
                                       .ItemCellBackgroundColor(UIColor.whiteColor()),
                                       .ItemCellHeight(50.0)]
        
        let threeLevelAccordian = ThreeLevelAccordian.init(cells: cells, options: options, reuseIdentifier: "checklistAccordianCell")
        delegateController = threeLevelAccordian.controller
        tableView.dataSource = delegateController
        tableView.delegate = delegateController
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

