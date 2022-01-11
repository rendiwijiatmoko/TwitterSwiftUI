//
//  TweetDetailView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 10/01/22.
//

import SwiftUI
import Kingfisher

struct TweetDetailView: View {
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment:.leading, spacing: 16) {
            HStack {
                KFImage(URL(string: tweet.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                VStack(alignment:.leading){
                    Text(tweet.fullname)
                        .font(.system(size: 14, weight: .bold))
                    Text("@\(tweet.username)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            Text(tweet.caption)
                .font(.system(size: 22))
                .multilineTextAlignment(.leading)
            Text("00:00 11/01/2021")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
        
            TweetActionView()
            
            Divider()
            
            Spacer()
        }
        .padding()
    }
}

//struct TweetDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetDetailView()
//    }
//}
