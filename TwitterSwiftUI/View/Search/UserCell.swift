//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 04/01/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack(spacing:12){
            KFImage(URL(string: user.profileImageURL))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(56/2)
            VStack(alignment: .leading, spacing: 4){
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold ))
                Text(user.fullname)
                    .font(.system(size: 14 ))
            }
            .padding(.trailing)
            .foregroundColor(.black)
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell(user: .constant())
//    }
//}
