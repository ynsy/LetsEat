//
//  LetsEatManager.swift
//  LetsEat
//
//  Created by student8 on 11/01/15.
//  Copyright (c) 2015 ynsy. All rights reserved.
//

import Foundation

private let _LetsEatMangaerSharedInstance = LetsEatManager()


class LetsEatManager {
    var letsEat : LetsEat?
    init() {
    }
    class var sharedInstance: LetsEatManager {
        return _LetsEatMangaerSharedInstance
    }
}