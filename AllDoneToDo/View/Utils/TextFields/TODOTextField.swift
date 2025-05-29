//
//  TODOTextField.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/29.
//

import SwiftUI

struct TODOTextField: View {
    
    @Binding var text: String
    let placeholder: String

    var body: some View {
        CustomTextField(
            text: $text,
            placeholder: Text(placeholder),
            imageName: "checkmark.square",
            foregroundColor: .gray
        )
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    TODOTextField(text: .constant(""), placeholder: "Title")
}
