//
//  TimeLineViewController.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class TimeLineViewController: UITableViewController {
    let user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.timeLine.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimeLineCell") as UITableViewCell
        let tL = user.timeLine[indexPath.item]
        let time = "Time: " + tL["time"]!
        let day = " Day: " + tL["day"]!
        let location = " Location: " + tL["location"]!
        cell.textLabel.text = time + day + location
        //"time": String(), "day": String(), "location": String()
        return cell
    }
    
    
    
    
}