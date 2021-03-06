//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 04/01/22.
//

import SwiftUI

struct FeedView: View {
    @State var newTweet: Bool = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                VStack{
                    ForEach(viewModel.tweets){ tweet  in
                        NavigationLink(destination: TweetDetailView(tweet: tweet)) {
                            TweetCell(tweet: tweet)
                        }
                    }
                    .padding()
                }
            }
            Button(action: {
                newTweet.toggle()
            }, label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $newTweet){
                    NewTweetView(isPresented: $newTweet)
                }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
