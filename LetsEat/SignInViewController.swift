//
//  SignInViewController.swift
//  LetsEat
//
//  Created by ynsy on 17/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    var user: User!
    var letsEat: LetsEat!
    var signChecker = false

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func SignInButtonTapped(sender: AnyObject) {
        var username:NSString = UsernameTextField.text
        var password:NSString = PasswordTextField.text
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
            signChecker = false
        } else {
            if (checkUserAndPassword(username, password: password)) {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign in Successfull!"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    signChecker = true
                } else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign in Failed!"
                    alertView.message = "Please enter correct Username and Password"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    signChecker = false
                }
            
            }
        }


func checkUserAndPassword(username: String, password: String) -> BooleanType {
    for user in letsEat.userList {
        if user.username == username {
            if (user.password == password){
                return true
            }else{
            return false
            }
        }else{
            return false
        }
    }
    return false
}

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "SignInSegue" && signChecker {
            let memberVC = segue.destinationViewController as MainPanelViewController
            memberVC.user = user
            
        } 
  }
}
