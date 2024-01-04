//
//  FormSelectField.swift
//  Register form
//
//  Created by Admin on 03/01/2024.
//

import SwiftUI

struct FormSelectField: View {
    var title: String = ""
    var placeholderText: String = ""
    var isRequired: Bool = false
    var options: [String] = []
    
    @Binding var validStatus: ValidStatus
    @Binding var value: String?
    
    @State private var showListOptions: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(title)\(isRequired ? "*" : "")")
            HStack {
                Text((value?.isEmpty ?? true) ? placeholderText : value!)
                Spacer()
                Text(Image(systemName: "chevron.down"))
            }
            .padding(8)
            .background(Color(hex: 0xEDEDED))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.red, lineWidth: validStatus.isError ? 2 : 0)
            )
            .onTapGesture {
                showListOptions = true
            }
            
            if validStatus.isError {
                Text(validStatus.errorText)
                    .foregroundColor(.red)
            }
        }
        .sheet(isPresented: $showListOptions, content: {
            List(content: {
                ForEach(options, id: \.hashValue) { _opt in
                    Button(action: {
                        showListOptions = false
                        value = _opt
                    }, label: {
                        Text(_opt)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.PRIMARY_COLOR)
                    })                    
                }
            })
            .listStyle(.plain)
            .presentationDetents([.fraction(0.3)])
        })
    }
}

#Preview {
    FormSelectField(validStatus: .constant(.none), value: .constant(""))
}
