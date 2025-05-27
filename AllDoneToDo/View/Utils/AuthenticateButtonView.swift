//
//  AuthenticateButtonView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

import SwiftUI

struct AuthenticateButtonView: View {
    
    var text: String

    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 360, height: 50)
            .background(Color.blue.opacity(0.8))
            .clipShape(Capsule())
        
    }
}

// XCode 15からこのように書ける
#Preview {
    AuthenticateButtonView(text: "Sign In")
}
