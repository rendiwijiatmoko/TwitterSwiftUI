//
//  NewMessageView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 05/01/22.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
            
            VStack(alignment:.leading){
                HStack{Spacer()}
                ForEach(viewModel.users, content: {user in
                    Button(
                        action: {
                            self.show.toggle()
                            self.startChat.toggle()
                        },
                        label: {
                            UserCell(user: user)
                        }
                    )
                })
            }
        }.padding()
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView( show: .constant(true), startChat: .constant(true))
    }
}
