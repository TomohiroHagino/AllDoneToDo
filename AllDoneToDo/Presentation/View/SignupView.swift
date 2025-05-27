//
//  SignupView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

import SwiftUI

struct SignupView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @Environment(\.presentationMode) var mode

    var body: some View {
        ZStack {
            BackgroundGradientView()

            VStack {
                LogoView()
                    .padding(.bottom, 25)
                
                VStack(spacing: 20) {
                    UserTextField(text: $firstName, placeholder: "First Name")
                    UserTextField(text: $lastName, placeholder: "Last Name")
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeholder: "Password")
                    PasswordSecureField(text: $confirmPassword, placeholder: "Confirm Password")
                } // VStack end
                .padding(.horizontal, 32)
                
                Button {
                    
                } label: {
                    AuthenticateButtonView(text: "Sign Up")
                        .padding()
                }
                
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("すでにアカウントをお持ちの場合:")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom, 16)
            } // VStack end
        } // ZStack end
    }
}

// XCode 15からこのように書ける
#Preview {
    ZStack {
        BackgroundGradientView()
        SignupView()
    }
}
