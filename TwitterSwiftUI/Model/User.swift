//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 08/01/22.
//

import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let email: String
    let fullname: String
    let profileImageURL: String
    
    var isCuurentUser: Bool {return Auth.auth().currentUser?.uid == self.id}
    
    init(dictionary: [String:Any]){
        self.id = dictionary["uid"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
    }
}
