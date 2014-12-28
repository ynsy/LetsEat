//
//  User.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

class User {
    let name: String
    let surname: String
    let username: String
    let phone: String
    var password: String
    var friendList = [User]()
    var eatInvitationList = [String]()
    var notifications = [String]()
    var timeLine = [[String: String]]()
    var message = ["time": String(), "day": String(), "location": String()]
    var letsEat:LetsEat!
    
    init(name: String, surname: String, username: String, password: String, phone: String) {
        self.name = name
        self.surname = surname
        self.username = username
        self.phone = phone
        self.password = password
    }

    func searchFriend(username: String){
        for user in letsEat.userList {
            if user.username == username {
                println("\(user) found.")
            }else {
                println("\(user) could not found.")
            }
        }
    }
    
    func addFriend(user: User) {
        self.friendList.append(user)
        user.friendList.append(self)
    }
    
    func deleteFriend(index: Int){
        self.friendList.removeAtIndex(index)
    }
    
    func deleteNotification(index: Int){
        self.notifications.removeAtIndex(index)
    }
}