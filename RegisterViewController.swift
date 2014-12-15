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
    
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var SurnameTextField: UITextField!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    
    @IBAction func DoneButtonAction(sender: AnyObject) {
        let user = User(name: NameTextField.text, surname: SurnameTextField.text , userName: UsernameTextField.text, password: PasswordTextField.text, phone: PhoneNumberTextField.text)
        
        letsEat.addUserToList(user)
    }
    
    @IBAction func checkFields(sender: AnyObject) {
        if NameTextField.text != "" && SurnameTextField.text != "" && UsernameTextField.text != "" && PasswordTextField.text != "" && PhoneNumberTextField.text != "" {
            DoneButton.enabled = true
        }else {
            DoneButton.enabled = false
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

