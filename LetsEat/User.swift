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
    let userName: String
    let phone: String
    var password: String
    var friendList = [User]()
    var eatInvitationList = [String]()
    var notifications = [String]()
    var timeLine = [[String: String]]()
    var userList = [String]()
    var message = ["time": String(), "day": String(), "location": String()]
    
    init(name: String, surname: String, userName: String, password: String, phone: String) {
        self.name = name
        self.surname = surname
        self.userName = userName
        self.phone = phone
        self.password = password
    }
}