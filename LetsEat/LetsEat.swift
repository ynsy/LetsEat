//
//  LetsEat.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

class LetsEat {
    //let pendingRequest: [String]
    var eatInvitationList = [String]()
    var notifications = [String]()
    var timeLine = [[String: String]]()
    var userList = [User]()
    var message = ["time": String(), "day": String(), "location": String()]
   
    
    
    func addUserToList(user: User){
        userList.append(user)
    }
    
    private func getJSON() -> JSON{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let defaultItems = userDefaults.arrayForKey("a") {
            return JSON(defaultItems)
        } else {
            var filepath = NSBundle.mainBundle().pathForResource("LetsEatDB", ofType: "json")!
            var error:NSError?
            // Retrieve Data
            var JSONData = NSData(contentsOfFile: filepath, options: NSDataReadingOptions.DataReadingMapped, error:&error)!
            var jsonerror:NSError?
            // We don't know the type of object we'll receive back so use AnyObject
            let swiftObject:AnyObject = NSJSONSerialization.JSONObjectWithData(JSONData, options: NSJSONReadingOptions.AllowFragments, error:&jsonerror)!
            
            userDefaults.setObject(swiftObject, forKey: "json")
            
            return JSON(swiftObject)
        }
    }

    
}
