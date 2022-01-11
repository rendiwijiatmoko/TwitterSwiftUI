//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 04/01/22.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack{
            HStack(spacing: 12){
                Image("batman")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 52, height: 52)
                    .cornerRadius(28)
                VStack(alignment:.leading, spacing: 4 ){
                    Text("Venom")
                        .font(.system(size: 14, weight: .semibold))
                    Text("It's not who I am underneath, but what I do")
                        .font(.system(size: 14))
                        .lineLimit(2)
                }
                .padding(.trailing)
                .foregroundColor(.black)
            }
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
