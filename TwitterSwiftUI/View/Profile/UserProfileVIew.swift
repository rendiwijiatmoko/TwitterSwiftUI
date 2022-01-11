//
//  UserProfileVIew.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 05/01/22.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter:TweetFillerOptions = .tweets
    
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding()
                FillterButtonView(selectedOption: $selectedFilter)
                
//                ForEach(0..<9){tweet in
//                    TweetCell()
//                        .padding(.horizontal)
//                }
            }
        }
        .navigationTitle(viewModel.user.username)
    }
}
