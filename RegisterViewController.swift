//
//  RegisterViewController.swift
//  LetsEat
//
//  Created by ynsy on 13/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    let letsEat = LetsEat()
    var user: User!
    
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var SurnameTextField: UITextField!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    
    @IBAction func DoneButtonAction(sender: AnyObject) {
        var name:NSString = NameTextField.text as NSString
        var surname:NSString = SurnameTextField.text as NSString
        var username:NSString = UsernameTextField.text as NSString
        var password:NSString = PasswordTextField.text as NSString
        var phone:NSString = PhoneNumberTextField.text as NSString
        var newUser = User(name: NameTextField.text,
                            surname: SurnameTextField.text,
                            username: UsernameTextField.text,
                            password: PasswordTextField.text,
                            phone: PhoneNumberTextField.text)

        
        letsEat.addUserToList(newUser)
        
        for u in letsEat.userList{
            print(u.name)
        }
        
        user = newUser
        
        var alertView:UIAlertView = UIAlertView()
        alertView.title = "Registration Completed!"
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        
    }
    


    @IBAction func checkFields(sender: AnyObject) {
        if NameTextField.text != "" && SurnameTextField.text != "" && UsernameTextField.text != "" && PasswordTextField.text != "" && PhoneNumberTextField.text != "" {
            DoneButton.enabled = true
        }else {
            DoneButton.enabled = false
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "registerCompleteSegue" {
            let memberVC = segue.destinationViewController as SignInViewController
            memberVC.user = user
            let le = segue.destinationViewController as SignInViewController
            le.letsEat = letsEat
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

