//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 10/01/22.
//

import Firebase

struct Tweet: Identifiable {
    let id: String
    let username: String
    let caption: String
    let fullname: String
    let profileImageURL: String
    let likes: Int
    let timestamp: Timestamp
    
    init(dictionary: [String:Any]){
        self.id = dictionary["id"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
