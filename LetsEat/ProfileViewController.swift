//
//  ProfileViewController.swift
//  LetsEat
//
//  Created by ynsy on 17/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var SurnameLabel: UILabel!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    var user = UserManager.sharedInstance.user!
    var letsEat = LetsEatManager.sharedInstance.letsEat!
    
    @IBAction func BackButtonTapped(sender: AnyObject) {
        //self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLabel.text =     "Name    : " + user.name
        SurnameLabel.text =  "Surname : " + user.surname
        UsernameLabel.text = "Username: " + user.username
        PhoneLabel.text =    "Phone   : " + user.phone
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

