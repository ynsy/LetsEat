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
    
    
}
