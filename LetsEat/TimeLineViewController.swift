//
//  TimeLineViewController.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class TimeLineViewController: UITableViewController {
    var user = UserManager.sharedInstance.user!
    var letsEat = LetsEatManager.sharedInstance.letsEat!
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
        return user.messages.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimeLineCell") as UITableViewCell
        let tL = user.messages[indexPath.item] as NSDictionary
        var t = tL["time"] as NSString
        var d = tL["day"] as NSString
        var l = tL["location"] as NSString
        var u = tL["withWhom"] as NSString
        let time = "Time: " + t
        let day = " Day: " + d
        let location = " Location: " + l
        let with = "With " + findUser(u).name
        
        
        cell.textLabel.text = with
        cell.detailTextLabel?.text = time + day + location
        //"time": String(), "day": String(), "location": String()
        return cell
    }
    
    func findUser(username: String) -> User! {
        for u in letsEat.userList {
            if u.username == username {
                return u
            }
        }
        return nil
    }
    
    
}