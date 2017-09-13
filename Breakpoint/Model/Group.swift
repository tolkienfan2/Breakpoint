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
    private var _members: [String]
    private var _key: String
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var members: [String] {
        return _members
    }
    
    var key: String {
        return _key
    }
    
    init(title: String, description: String, members: [String], key: String) {
        self._title = title
        self._description = description
        self._members = members
        self._key = key
    }
}
