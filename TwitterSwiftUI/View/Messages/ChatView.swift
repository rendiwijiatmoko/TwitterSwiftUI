//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 04/01/22.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(MOCK_MESSAGE){message in
                        MessageView(message: message)
                    }
                    .padding(.top)
                }
            }
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
