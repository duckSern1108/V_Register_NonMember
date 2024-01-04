//
//  V_Register_NonMemberAcceptConditionText.swift
//  Register form
//
//  Created by Admin on 04/01/2024.
//

import SwiftUI

struct V_Register_NonMemberAcceptConditionText: View {
    
    var acceptText: AttributedString {
        var result = AttributedString("Accept the")
        result.foregroundColor = .black
        return result
    }
    
    var conditionsText: AttributedString {
        var result = AttributedString(" Conditions")
        result.foregroundColor = .PRIMARY_COLOR
        return result
    }
    
    var body: some View {
        Text(acceptText + conditionsText)
    }
}

#Preview {
    V_Register_NonMemberAcceptConditionText()
}
