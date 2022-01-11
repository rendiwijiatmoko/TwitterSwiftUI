//
//  ProfileHeader.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 05/01/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @Binding var isFollowed: Bool
    let viewModel: ProfileViewModel
    
    var body: some View {
        VStack{
            KFImage(URL(string: viewModel.user.profileImageURL))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width:120, height: 120)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6, x: 0, y: 0)
            Text(viewModel.user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Billioner by day, dark knight by night")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing:12){
                VStack{
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    Text("Followings")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            ProfileActionButton(viewModel: viewModel, isFollowed: $isFollowed)
            Spacer()
        }
    }
}

