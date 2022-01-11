//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 04/01/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
            
            VStack(alignment:.leading){
                HStack{Spacer()}
                ForEach(viewModel.users, content: {user in
                    NavigationLink(destination: UserProfileView(user: user), label: {
                        UserCell(user: user)
                        }
                    )
                })
            }
        }.padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
