//
//  FormTextField.swift
//  Register form
//
//  Created by Admin on 03/01/2024.
//

import SwiftUI

struct FormTextField: View {
    var title: String = ""
    var placeholderText: String = ""
    var isRequired: Bool = false
    @Binding var fieldValue: String
    @Binding var validStatus: ValidStatus
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(title)\(isRequired ? "*" : "")")
            TextField(placeholderText, text: $fieldValue)
                .padding(8)
                .background(Color(hex: 0xEDEDED))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.red, lineWidth: validStatus.isError ? 2 : 0)
                )
            if validStatus.isError {
                Text(validStatus.errorText)
                    .foregroundColor(.red)
            } 
        }
    }
}

#Preview {
    FormTextField(title: "Email", isRequired: true, fieldValue: .constant("Email"), validStatus: .constant(.none))
}
