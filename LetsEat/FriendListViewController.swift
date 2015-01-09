//
//  FriendListViewController.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class FriendListViewController: UITableViewController {
    var user = UserManager.sharedInstance.user!
    var letsEat = LetsEatManager.sharedInstance.letsEat!
    var json: AnyObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    func findId() -> Int{
        for var i=0; i<json.count; i++ {
            if self.user.username == (json as NSArray)[i]["username"] as? NSString {
                return i
            }
        }
        return -1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("count ", user.friendList.count)
        return user.friendList.count
    }
    
    func retrieveUserData(username: String) -> User!{
        for u in letsEat.userList {
            if u.username == username {
                return u
            }
        }
        // it is some joke :)
        return nil
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell") as UITableViewCell
        let friend = retrieveUserData(user.friendList[indexPath.item] as NSString)
        cell.textLabel.text = friend.name + " " + friend.surname
        println(friend.name)
        return cell
    }
    
   /* func findUser(user_name: String) -> User {
        var dictValue = json[user_name].dictionaryValue
        var name: String? = dictValue["first_name"].stringValue
        
        
        var foundUser = User(name: , surname: dictValue?["first_name"].stringValue, username: dictValue?["first_name"].stringValue, password: dictValue?["first_name"].stringValue, phone: dictValue?["first_name"].stringValue)
        
        
    }*/
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            user.deleteFriend(indexPath.item)
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "eatInvitationSegue"{
        let cell = sender as UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        let whom = user.friendList[indexPath!.item] as NSString
        let departmentVC = segue.destinationViewController as MessageViewController
        departmentVC.withWhom = retrieveUserData(whom)
        }
    }
    
   /* @IBAction func BackButtonTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    */
    
    
}