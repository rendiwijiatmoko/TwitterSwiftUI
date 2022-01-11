//
//  ProfileActionButton.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 05/01/22.
//

import SwiftUI

struct ProfileActionButton: View {
    let viewModel: ProfileViewModel
    @Binding var isFollowed: Bool
    
    var body: some View {
        if viewModel.user.isCuurentUser {
            Button(action: {}, label: {
                Text("Edit Profile")
                    .frame(width:340, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }).cornerRadius(20)
        }else{
            HStack{
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Followed" : "Follow")
                        .frame(width:170, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }).cornerRadius(20)
                
                Button(action: {}, label: {
                    Text("Message")
                        .frame(width:170, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                }).cornerRadius(20)
            }
        }
        
    }
}

