//
//  UserManager.swift
//  LetsEat
//
//  Created by student8 on 11/01/15.
//  Copyright (c) 2015 ynsy. All rights reserved.
//

import Foundation

private let _UserMangaerSharedInstance = UserManager()


class UserManager {
    var user : User?
    init() {
    }
    class var sharedInstance: UserManager {
        return _UserMangaerSharedInstance
    }
}