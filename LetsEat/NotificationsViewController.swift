//
//  NotificationsViewController.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class NotificationsViewController: UITableViewController {
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
        return user.notifications.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("NotificationsCell") as UITableViewCell
        cell.textLabel.text = user.notifications[indexPath.item]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            user.deleteNotification(indexPath.item)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func BackButtonTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
}
