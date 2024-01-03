//
//  ContentView.swift
//  Register form
//
//  Created by Admin on 03/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        V_Register_NonMember(viewModel: .init(email: "", firstName: "", lastName: "", gender: .female, district: "", phoneNumber: "", address: "", registerService: MockRegisterUseCase()))
            
    }
}

#Preview {
    ContentView()
}

class MockRegisterUseCase: V_Register_NonMemberUseCase {
    func validateEmail(_ email: String) -> ValidStatus {
        email.isEmpty ? .notValid("Email is required") : .none
    }
    
    func validatePhoneNumber(_ email: String) -> ValidStatus {
        .none
    }
    
    /// Call api here
    func registerNonMember(email: String, firstName: String, lastName: String) async throws {
        print("Calling register Api Api")
    }
}
