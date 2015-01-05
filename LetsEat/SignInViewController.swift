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
    var letsEat =  LetsEat()
    //let json: [NSDictionary]!
    var signChecker = false

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://encodable.com/uploaddemo/files/LetsEatDB.json"
        if let nsurl = NSURL(string: url){
            println("link OK ")
            if let nsdata = NSData(contentsOfURL: nsurl){
                println("data OK")
                //let json = JSON(data: nsdata)
                //println(json[0]["first_name"])
                
                if let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(nsdata, options: NSJSONReadingOptions.AllowFragments, error: nil){
                    var x = (json as NSArray)[0]["username"]
                    println("altin top: \(x)")
                    println((json as NSArray)[0]["password"])
                    for var i = 0; i < 10; i++ {
                        if let n = (json as NSArray)[i]["first_name"] as? NSString {
                            if let l = (json as NSArray)[i]["last_name"] as? NSString {
                                if let us = (json as NSArray)[i]["username"] as? NSString {
                                    if let p = (json as NSArray)[i]["password"] as? NSString {
                                        if let ph = (json as NSArray)[i]["phone"] as? NSString {
                                            if let fr = ((json as NSArray)[i] as NSDictionary)["Friends"] as? NSArray {
                                                if let me = ((json as NSArray)[i] as NSDictionary)["Messages"] as? NSArray{
                                                        var u = User(name: n, surname: l, username: us, password: p, phone: ph, friendList: fr, messages: me)
                                                        letsEat.addUserToList(u)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
    }
    
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
            }else
            {
            return false
            }
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
    
    func parseJSON(){
        
    }
}
