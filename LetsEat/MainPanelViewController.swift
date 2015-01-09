//
//  MainPanelViewController.swift
//  LetsEat
//
//  Created by ynsy on 17/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class MainPanelViewController: UIViewController {
    var user = UserManager.sharedInstance.user!
    var letsEat = LetsEatManager.sharedInstance.letsEat!
   // @IBOutlet weak var UsernameLabel: UILabel!
    
    @IBOutlet weak var LabelUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelUser.text = "\(user.name)\'s Main Panel"
        println(user.friendList[0])
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //UsernameLabel.text = user.username

        let prefs = NSUserDefaults.standardUserDefaults()
        let isLoggedIn = prefs.integerForKey("ISLOGGEDIN")
        if (isLoggedIn == 1) {
            //self.UsernameLabel.text = prefs.valueForKey("USERNAME") as NSString
            self.reloadInputViews()
            self.performSegueWithIdentifier("ProfileSegue", sender: self)
        }
    }*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      
        if segue.identifier == "NotificationsSegue" {
            let memberVC = segue.destinationViewController as NotificationsViewController
            //memberVC.user = user
            //memberVC.letsEat = letsEat
        } else if segue.identifier == "FriendListSegue" {
            //let memberVC = segue.destinationViewController as FriendListViewController
            //memberVC.user = user
            //memberVC.letsEat = letsEat
        } else if segue.identifier == "TimeLineSegue" {
            let memberVC = segue.destinationViewController as TimeLineViewController
            //memberVC.user = user
            //memberVC.letsEat = letsEat
        } else if segue.identifier == "AddFriendSegue" {
            let memberVC = segue.destinationViewController as AddFriendViewController
            //memberVC.user = user
            //memberVC.letsEat = letsEat
        } else if segue.identifier == "ProfileSegue" {
            //let memberVC = segue.destinationViewController as ProfileViewController
            //memberVC.user = user
            //memberVC.letsEat = letsEat
        }
        
    }
    
}
