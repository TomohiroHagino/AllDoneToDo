//
//  CustomSecureField.swift
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

struct CustomSecureField: View {
    
    @Binding var text: String
    let placeholder: Text

    var body: some View {
        
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            HStack{
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
                    .autocapitalization(.none)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
             .ignoresSafeArea()
        CustomSecureField(
            text: .constant(""),
            placeholder: Text("Password")
        )
    }
}
