//
//  V_Register_NonMemberViewModel.swift
//  Register form
//
//  Created by Admin on 03/01/2024.
//

import Foundation
import SwiftUI
import Combine



class V_Register_NonMemberViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthYear: Date = Date()
    @Published var gender: Gender? = nil
    @Published var district: String? = ""
    @Published var phoneNumber: String = ""
    @Published var address: String = ""
    @Published var isAcceptConditions: Bool = false
    
    @Published var validEmailStatus: ValidStatus = .none
    @Published var validPhoneNumberStatus: ValidStatus = .none
    
    
    private var registerUseCase: V_Register_NonMemberUseCase
    private var subcriptions: Set<AnyCancellable> = .init()
    
    init(email: String, firstName: String, lastName: String, gender: Gender?, district: String?, phoneNumber: String, address: String, registerService: V_Register_NonMemberUseCase) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.district = district
        self.phoneNumber = phoneNumber
        self.address = address
        self.registerUseCase = registerService
        
        $email
            .drop(while: { $0.isEmpty })
            .sink { [weak self] email in
                guard let self = self else { return }
                self.validEmailStatus = self.registerUseCase.validateEmail(email)
            }
            .store(in: &subcriptions)
    }
    
    func submitForm() async throws {
        await MainActor.run {
            validEmailStatus = registerUseCase.validateEmail(email)
            validPhoneNumberStatus = registerUseCase.validatePhoneNumber(phoneNumber)
        }
        
        guard !validEmailStatus.isError,
              !validPhoneNumberStatus.isError
        else {
            throw NSError(domain: "Form not valid", code: -1111)
        }
        guard isAcceptConditions else { throw NSError(domain: "Not accept term", code: -1111) }
        
        do {
            try await registerUseCase.registerNonMember(email: email,firstName: firstName, lastName: lastName)
        }
        catch {
            
        }
    }
}

enum ValidStatus {
    case none
    case valid
    case notValid(_ msg: String)
    
    var isError: Bool {
        switch self {
        case .none:
            return false
        case .valid:
            return false
        case .notValid:
            return true
        }
    }
    
    var errorText: String {
        switch self {
        case .none:
            return ""
        case .valid:
            return ""
        case .notValid(let msg):
            return msg
        }
    }
}

protocol V_Register_NonMemberUseCase {
    
    func registerNonMember(email: String,
                           firstName: String,
                           lastName: String) async throws -> Void
    
    func validateEmail(_ email: String) -> ValidStatus
    func validatePhoneNumber(_ email: String) -> ValidStatus
}
