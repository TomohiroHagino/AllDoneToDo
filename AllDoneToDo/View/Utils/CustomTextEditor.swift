//
//  CustomTextEditoeView.swift
//  AllDoneToDo
//
//  Created by Tomohiro Hagino on 2025/05/29.
//

import SwiftUI

struct CustomTextEditor: View {
    
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    var foregroundColor: Color?
    
    init(
        text: Binding<String>,
        placeholder: Text,
        imageName: String,
        foregoundColor: Color?
    ) {
        self._text = text
        self.placeholder = placeholder
        self.imageName = imageName
        if let safeForegroundColor = foregroundColor {
            self.foregroundColor = safeForegroundColor
        }
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                HStack {
                    if text.isEmpty {
                        placeholder
                            .foregroundColor(foregroundColor ?? Color(.init(white: 1, alpha: 0.8)))
                            .padding(.leading, 60)
                    }
                    Spacer()
                }
                .padding([.vertical], 10)
                Spacer()
            }
            
            HStack {
                VStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(.gray))
                        .padding([.vertical], 10)
                        .padding(.leading, 15)
                    Spacer()
                }
                
                TextEditor(text: $text)
                    .autocapitalization(.none)
                    .foregroundColor(.black)
//                    .padding()
                    .background(.clear)
            }

        }
        .frame(height: 120)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()

        CustomTextEditor(
            text: .constant("Description"),
            placeholder: Text("Description"),
            imageName: "line.3.horizontal",
            foregoundColor: .black
        )
    }
}
