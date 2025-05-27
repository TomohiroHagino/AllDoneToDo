//
//  LoginView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""

    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            VStack {
                LogoView()
                
                VStack(spacing: 20) {
                    EmailTextField(
                        text: $email
                    ).padding([.horizontal], 32)

                    PasswordSecureField(
                        text: $password,
                        placeholder: "Password"
                    ).padding([.horizontal], 32)
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("パスワードを忘れた?")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .semibold ))
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        AuthenticateButtonView(text: "Sign In")
                            .padding()
                    }
                }
                

            }
        }
    }
}

// XCode 15からこのように書ける
#Preview {
    LoginView()
}
