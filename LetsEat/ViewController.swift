//
//  ViewController.swift
//  LetsEat
//
//  Created by ynsy on 12/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var json: [[String: String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://encodable.com/uploaddemo/files/LetsEatDB.json"
        if let nsurl = NSURL(string: url){
            if let nsdata = NSData(contentsOfURL: nsurl){
                 json = NSJSONSerialization.JSONObjectWithData(nsdata, options: NSJSONReadingOptions.AllowFragments, error: nil) as [[String: String]]
                
        
            }
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

