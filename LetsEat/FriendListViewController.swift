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
    var json: [NSDictionary]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /*let url = "https://encodable.com/uploaddemo/files/LetsEatDB.json"
        if let nsurl = NSURL(string: url){
            if let nsdata = NSData(contentsOfURL: nsurl){
                json = NSJSONSerialization.JSONObjectWithData(nsdata, options: NSJSONReadingOptions.AllowFragments, error: nil) as [[String: NSArray]]
               
                
            }
        }*/
        //let url = "/Users/ynsy/Desktop/LetsEat/LetsEatDB.json"
        let url = "https://encodable.com/uploaddemo/files/LetsEatDB.json"
        if let nsurl = NSURL(string: url){
            println("link OK")
            if let nsdata = NSData(contentsOfURL: nsurl){
                println("data Ok")
                let json = JSON(data: nsdata)
                for var i = 0; i < 3; i++ {
                    let friend = json[0]["Friends"][i].asString
                    println(friend)
                }
            }
        }
            }
    
    /*func findId() -> Int{
        for var i=0; i<json.count; i++ {
            if self.user.username == json[i]["username"] {
                return i
            }
        }
        return -1
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return user.friendList.count
        //let friendList = json[0]["Friends"].arrayValue
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCellWithIdentifier("FriendListCell") as UITableViewCell
        let friend = user.friendList[indexPath.item]
        cell.textLabel.text = friend.name + " " + friend.surname
        
        return cell*/
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendListCell") as UITableViewCell
        //let friend = json[0]["Friends"][indexPath.item]
        //cell.textLabel.text = friend.stringValue
        
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
    
    @IBAction func BackButtonTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    
}