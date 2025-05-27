//
//  UserTextField.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

//
//  ContentView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/27.
//

import SwiftUI

struct UserTextField: View {
    
    @Binding var text: String
    let placeholder: String

    var body: some View {
        
        CustomTextField(
            text: $text,
            placeholder: Text(placeholder),
            imageName: "person")
        .padding()
        .background(Color(.init(white: 1, alpha: 0.15)))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        UserTextField(text: .constant(""), placeholder: "User")
    }
}
