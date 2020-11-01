//
//  File.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 01.04.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import Foundation

// step1

class User {
    
    var name: String!
    var username: String!
    var profiliImage: String!
    var uid: String!
    
    init(dictionary: [String: Any]) {

        self.name = dictionary["name"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profiliImage = dictionary["profileImageUrl"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
    }
}
