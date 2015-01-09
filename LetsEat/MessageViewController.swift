//
//  MessageViewController.swift
//  LetsEat
//
//  Created by student8 on 11/01/15.
//  Copyright (c) 2015 ynsy. All rights reserved.
//

import UIKit


class MessageViewController: UIViewController {
    var user = UserManager.sharedInstance.user!
    var letsEat = LetsEatManager.sharedInstance.letsEat!
    var withWhom: User!
    
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var eatInfoLabel: UILabel!
    
    @IBAction func checkTextFields(sender: AnyObject) {
        if (timeTextField.text != "") && (dateTextField.text != "") && (locationTextField.text != "") {
            doneButton.enabled = true
        }
    }
    @IBAction func doneButtonTapped(sender: AnyObject) {
       var msg =
        [
        "time" : timeTextField.text,
        "day" : dateTextField.text,
        "location" : locationTextField.text,
        "withWhom" : withWhom.username ]
        user.messages.append(msg)
        withWhom.messages.append(msg)
        
        user.notifications.append("You created an Eat Event with \(withWhom.name) \(withWhom.surname)")
        withWhom.notifications.append("\(user.name) \(user.surname) created an Eat Event with you")
        
        for i in user.messages {
            print(i.description)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eatInfoLabel.text = "Create eat event with \(withWhom.name) \(withWhom.surname)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
