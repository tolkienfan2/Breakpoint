//
//  Group.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-12.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import Foundation

class Group {

    private var _title: String
    private var _description: String
    private var _noOfMembers: Int
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var noOfMembers: Int {
        return _noOfMembers
    }
    
    init(title: String, description: String, members: Int) {
        self._title = title
        self._description = description
        self._noOfMembers = members
    }
}
