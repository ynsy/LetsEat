//
//  AddFriendViewController.swift
//  LetsEat
//
//  Created by ynsy on 17/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class AddFriendViewController: UITableViewController {
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
        return letsEat.userList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AddFriendCell") as UITableViewCell
        let friend = letsEat.userList[indexPath.item] as User
        cell.textLabel.text = friend.name + " " + friend.surname
        println(friend.name)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddFriendVCSegue" {
        let cell = sender as UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        let friend = letsEat.userList[indexPath!.item] as User
        let departmentVC = segue.destinationViewController as AddFriendVC
        departmentVC.friend = friend
        }
    }

    
    @IBAction func backButtonTapped(sender: AnyObject) {
        //self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}
