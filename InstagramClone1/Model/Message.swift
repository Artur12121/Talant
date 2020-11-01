//
//  Message.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 27.05.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit
import Firebase

class Message {
    
    let text, fromId, toId: String
    let timestamp: Timestamp
    let isMessageFromCurrentUser: Bool
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
        self.isMessageFromCurrentUser = Auth.auth().currentUser?.uid == self.fromId
    }
    
}
