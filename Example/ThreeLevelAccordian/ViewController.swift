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

    override func viewDidLoad() {
        super.viewDidLoad()
        let threeLevelAccordian = ThreeLevelAccordian(tableView: tableView, cells: [Item]())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

