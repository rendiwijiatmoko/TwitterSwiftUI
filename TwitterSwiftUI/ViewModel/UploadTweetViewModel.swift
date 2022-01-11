//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 10/01/22.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>){
        self._isPresented = isPresented
    }
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else {return}
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String:Any] = ["uid":user.id,
                                  "caption":caption,
                                  "fullname":user.fullname,
                                  "timestamp": Timestamp(date: Date()),
                                  "username":user.username,
                                  "profileImageURL": user.profileImageURL,
                                  "likes":0,
                                  "id":docRef.documentID]
        docRef.setData(data) { _ in
            print("DEBUG: Successfuly add new tweet...")
            self.isPresented = false
        }
    }
}
