//
//  EmailTextField.swift
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

struct EmailTextField: View {
    
    @Binding var text: String

    var body: some View {
            CustomTextField(
                text: $text,
                placeholder: Text("Email"),
                imageName: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        EmailTextField(text: .constant("Email"))
    }
}
