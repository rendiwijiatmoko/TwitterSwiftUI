//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Rendi Wijiatmoko on 05/01/22.
//

import SwiftUI

struct RegistrationView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var fullname: String = ""
    @State var username: String = ""
    @State var showImagePicker: Bool = false
    @State var selectedUIImage:UIImage?
    @State var image: Image?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage() {
        guard let selectedUIImage = selectedUIImage else {
            return
        }
         image = Image(uiImage: selectedUIImage)
    }
    
    var body: some View {
        VStack{
            Button(action: {showImagePicker.toggle()}, label: {
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width:140, height: 140)
                            .clipped()
                            .clipShape(Circle())
                            .padding(.top, 88)
                            .padding(.bottom,16)
                    } else {
                        Image("plus_photo")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width:140, height: 140)
                            .padding(.top, 88)
                            .padding(.bottom,16)
                            .foregroundColor(.white)
                    }
                }
            }).sheet(isPresented: $showImagePicker,onDismiss: loadImage, content: {
                ImagePicker(image: $selectedUIImage)
            })
            
            VStack(spacing:20){
                CustomTextField(text: $email,placeholder:Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                CustomTextField(text: $fullname, placeholder:Text("Fullname"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                CustomTextField(text: $username,placeholder:Text("Username"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                CustomSecuredField(text: $password,placeholder:Text("Password")
                )
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            
            Button(action: {
                guard let image = selectedUIImage else {
                    return
                }
                viewModel.registerUser(email: email, password: password, username: username, fullname: fullname, profileImage: image)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(width:360, height: 50)
                    .background(Color(.white))
                    .clipShape(Capsule())
                    .padding()
            })
            
            Spacer()
            
            Button(action: {mode.wrappedValue.dismiss()}, label: {
                HStack{
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
            })
        }
        .background(Color(#colorLiteral(red: 0.1825715601, green: 0.6299551129, blue: 0.9542170167, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
