//
//  FillterButtonView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 05/01/22.
//

import SwiftUI

enum TweetFillerOptions:Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct FillterButtonView: View {
    @Binding var selectedOption: TweetFillerOptions
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFillerOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetFillerOptions.allCases.count)
        return ((UIScreen.main.bounds.width/count) * rawValue)+16
    }
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                ForEach(TweetFillerOptions.allCases, id:\.self){option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .frame(width:underlineWidth)
                    })
                }
            }
            Rectangle()
                .frame(width:underlineWidth, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FillterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FillterButtonView(selectedOption: .constant(.replies))
    }
}
