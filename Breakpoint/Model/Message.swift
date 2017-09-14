//
//  Message.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-11.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import Foundation

class Message {
    
    private var _message: String
    private var _senderId: String
    private var _groupKey: String?
    
    var message: String {
        return _message
    }
    
    var senderId: String {
        return _senderId
    }
    
    var groupKey: String? {
        return _groupKey
    }
    
    init(message: String, senderId: String) {
        self._message = message
        self._senderId = senderId
    }
    
    init(throughGroup groupKey: String, message: String, senderId: String) {
        self._groupKey = groupKey
        self._message = message
        self._senderId = senderId
    }
}
