//
//  LetsEat.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

class LetsEat {
    var friendList = [String]()
    //let pendingRequest: [String]
    var eatInvitationList = [String]()
    var notifications = [String]()
    var timeLine = [[String: String]]()
    var userList = [User]()
    var message = ["time": String(), "day": String(), "location": String()]
   
    func searchFriend(username: String){
        for user in userList {
            if user.username == username {
                println("\(user) found.")
            }else {
                println("\(user) could not found.")
            }
        }
    }
    
    func addUserToList(user: User){
        userList.append(user)
    }
    
    
}
