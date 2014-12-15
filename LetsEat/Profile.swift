//
//  Profile.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

class Profile {
    let name: String
    let surname: String
    let userName: String
    var phone = ""
    var password = ""
    var friendList = [String]()
    //let pendingRequest: [String]
    var eatInvitationList = [String]()
    var notifications = [String]()
    var timeLine = [[String: String]]()
    var userList = [String]()
    var message = ["time": String(), "day": String(), "location": String()]
    
    init(name: String, surname: String, userName: String) {
        self.name = name
        self.surname = surname
        self.userName = userName
        //self.phone = phone
        //self.password = password
        //self.friendList = friendList
        //self.pendingRequest = pendingRequest
        //self.eatInvitationList = eatInvitationList
        //self.notifications = notifications
    }
    
    
    
    
    
    func inviteFriend(time: String, day: String, location: String, withWhom: Profile){
        message.updateValue("time", forKey: time)
        message.updateValue("day", forKey: day)
        message.updateValue("location", forKey: location)
        //message.updateValue("withWhom", forKey: withWhom)
        withWhom.timeLine.append(message)
        
    
    }
    
    
    
    
    
    
}
