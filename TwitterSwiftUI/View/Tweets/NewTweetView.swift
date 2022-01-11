//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 05/01/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Binding var newTweetIsPresented: Bool
    @State var captionText: String = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    
    init(isPresented: Binding<Bool>){
        self._newTweetIsPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented )
    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack(alignment: .top){
                    if let user = AuthViewModel.shared.user{
                        KFImage(URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width:64, height: 64)
                            .clipShape(Circle())
                            .clipped()
                    }
                    
                    TextArea("What's happening...", text: $captionText)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(
                    leading: Button(action: {self.newTweetIsPresented.toggle()}, label: {
                        Text("Cancel")
                    }),
                    trailing:
                        Button(action: {
                            viewModel.uploadTweet(caption: captionText)
                        }, label: {
                            Text("Tweet")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        })
                )
                Spacer()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(false))
    }
}
