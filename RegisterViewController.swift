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
        var name:NSString = NameTextField.text as NSString
        var surname:NSString = SurnameTextField.text as NSString
        var username:NSString = UsernameTextField.text as NSString
        var password:NSString = PasswordTextField.text as NSString
        var phone:NSString = PhoneNumberTextField.text as NSString
        
        //  letsEat.addUserToList(user)
        
        var post:NSString = "name=\(name)&surname=\(surname)&username=\(username)&phone=\(phone)&password=\(password)"
        
        NSLog("PostData: %@",post);
        
        var url:NSURL = NSURL(string: "http://dipinkrishna.com/jsonsignup.php")!
        
        var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        
        var postLength:NSString = String( postData.length )
        
        var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        var reponseError: NSError?
        var response: NSURLResponse?
        
        var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
        
        if ( urlData != nil ) {
            let res = response as NSHTTPURLResponse!;
            
           // NSLog("Response code: %ld", res.statusCode);
            
            if (res.statusCode >= 200 && res.statusCode < 300)
            {
                var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                
                //NSLog("Response ==> %@", responseData);
                
                var error: NSError?
                
                let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
                
                
                let success:NSInteger = jsonData.valueForKey("success") as NSInteger
                
               // NSLog("Success: %ld", success);
                
                if(success == 1)
                {
                    //NSLog("Sign Up SUCCESS");
                    
                    var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                } else {
                    var error_msg:NSString
                    
                    if jsonData["error_message"] as? NSString != nil {
                        error_msg = jsonData["error_message"] as NSString
                    } else {
                        error_msg = "Unknown Error"
                    }
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign Up Failed!"
                    alertView.message = error_msg
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    
                }
                
            } else {
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign Up Failed!"
                alertView.message = "Connection Failed"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
        }  else {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Connection Failure"
            if let error = reponseError {
                alertView.message = (error.localizedDescription)
            }
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
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

