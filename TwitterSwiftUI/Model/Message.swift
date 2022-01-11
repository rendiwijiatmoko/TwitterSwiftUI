//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 04/01/22.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGE: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "hey, what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "Not much, you?", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "How's the marvel universe?", isCurrentUser: true),
    .init(id: 3, imageName: "spiderman", messageText: "it's pretty good dude", isCurrentUser: false),
    .init(id: 4, imageName: "spiderman", messageText: "How's your bettle with the Joker?", isCurrentUser: false),
    .init(id: 5, imageName: "batman", messageText: "hemm, not going so hot..", isCurrentUser: true)
]
