//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 08/01/22.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    init(){
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            
            self.users = documents.map({User(dictionary: $0.data())})
            
//            documents.forEach{document in
//                let user = User(dictionary: document.data())
//                self.users.append(user)
//            }
        }
    }
}
