//
//  ConversationsView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 04/01/22.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            NavigationLink(isActive: $showChat, destination: {ChatView()}, label: {})
            
            ScrollView{
                VStack(){
                    ForEach(0..<20){_ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
                            })
                    }
                }
            }
            Button(action: {self.isShowingNewMessageView.toggle()}, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .sheet(
                    isPresented: $isShowingNewMessageView,
                    content: {
                        NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
                    })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
