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
    
    var message: String {
        return _message
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(message: String, senderId: String) {
        self._message = message
        self._senderId = senderId
    }
}
