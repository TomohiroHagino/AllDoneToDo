//
//  PasswordSecureField.swift
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

struct PasswordSecureField: View {
    
    @Binding var text: String
    let placeholder: String

    var body: some View {
            CustomSecureField(
                text: $text,
                placeholder: Text(placeholder))
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        CustomSecureField(
            text: .constant(""),
            placeholder: Text("Password")
        )
    }
}
