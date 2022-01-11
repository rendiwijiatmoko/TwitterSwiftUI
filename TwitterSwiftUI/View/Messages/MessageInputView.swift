//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 04/01/22.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    
    var body: some View {
        HStack{
            TextField("Message...", text: $messageText)
            Button(action: {}, label: {
                Text("Send")
            })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant("Message..."))
    }
}
