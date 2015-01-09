//
//  AddFriendVC.swift
//  LetsEat
//
//  Created by student8 on 11/01/15.
//  Copyright (c) 2015 ynsy. All rights reserved.
//

import UIKit

class AddFriendVC: UIViewController {
    var user = UserManager.sharedInstance.user!
    var letsEat = LetsEatManager.sharedInstance.letsEat!
    var friend : User!
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendNameLabel.text = friend.name + friend.surname
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func yesButtonTapped(sender: AnyObject) {
        if isFriend(friend.username){
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "You are already friend with \(friend.name)!"
            alertView.message = "Please select another user"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }else {
            user.friendList.append(friend.username)
            friend.friendList.append(user.username)
            user.notifications.append("You added \(friend.name) \(friend.surname) as being friend in LetsEat")
            friend.notifications.append("\(user.name) \(user.surname) added you as being friend in LetsEat")
            yesButton.enabled = false
        }
        
        //self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBAction func noButtonTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func isFriend(username: String) -> Bool{
        for f in user.friendList {
            if f as NSString == username {
                return true
            }
        }
        return false
    }
}