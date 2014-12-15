//
//  Message.swift
//  LetsEat
//
//  Created by ynsy on 14/12/14.
//  Copyright (c) 2014 ynsy. All rights reserved.
//

class Message {
    let time: String
    let day: String
    let location: String
    let withWhom: String
    
    
    init(time: String, day: String, location: String, withWhom: String){
        self.time = time
        self.day = day
        self.location = location
        self.withWhom = withWhom
    }
    
    func inviteFriend(){
        
    }
}