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
                    EmailTextField(text: $email)
                        .padding([.horizontal], 32)
                }
            }
        }
    }
}

// XCode 15からこのように書ける
#Preview {
    LoginView()
}
