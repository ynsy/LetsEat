//
//  FriendListViewController.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class FriendListViewController: UITableViewController {
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
        return user.friendList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendListCell") as UITableViewCell
        let friend = user.friendList[indexPath.item]
        cell.textLabel.text = friend.name + " " + friend.surname
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            
            user.deleteFriend(indexPath.item)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func BackButtonTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    
}