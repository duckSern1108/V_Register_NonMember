//
//  V_Register_NonMember.swift
//  Register form
//
//  Created by Admin on 03/01/2024.
//

import SwiftUI

struct V_Register_NonMember: View {
    @ObservedObject var viewModel: V_Register_NonMemberViewModel
    @State var showBottomSheetSuccess: Bool = false
    
    init(viewModel: V_Register_NonMemberViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            V_Register_NonMemberHeaderView()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Please fill in all required data ... *\nAfter you submit your request check your email")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    FormTextField(title: "Email",
                                  isRequired: true,
                                  fieldValue: $viewModel.email,
                                  validStatus: $viewModel.validEmailStatus)
                    
                    FormTextField(title: "First Name",
                                  isRequired: false,
                                  fieldValue: $viewModel.firstName,
                                  validStatus: .constant(.none))
                    
                    FormTextField(title: "Last Name",
                                  isRequired: false,
                                  fieldValue: $viewModel.lastName,
                                  validStatus: .constant(.none))
                    
                    HStack(spacing: 8) {
                        FormTextField(title: "Birth Year",
                                      isRequired: false,
                                      fieldValue: $viewModel.lastName,
                                      validStatus: .constant(.none))
                        FormSelectField(title: "Gender",
                                        isRequired: false,
                                        options: ["Male", "Female", "Other"],
                                        validStatus: .constant(.none),
                                        value: Binding(
                                            get: { viewModel.gender?.rawValue},
                                            set: {
                                                if let rawValue = $0 {
                                                    viewModel.gender = Gender(rawValue: rawValue) ?? .other
                                                } else {
                                                    viewModel.gender = nil
                                                }
                                            }))
                    }
                    
                    HStack(spacing: 8) {
                        FormSelectField(
                            title: "District",
                            isRequired: false,
                            options: ["A", "B"],
                            validStatus: .constant(.none),
                            value: $viewModel.district)
                        
                        FormTextField(title: "Mobile Phone",
                                      isRequired: false,
                                      fieldValue: $viewModel.phoneNumber,
                                      validStatus: $viewModel.validPhoneNumberStatus)
                    }
                    
                    FormTextField(title: "Address",
                                  isRequired: false,
                                  fieldValue: $viewModel.address,
                                  validStatus: .constant(.none))
                    
                    HStack {
                        CheckBoxView(checked: $viewModel.isAcceptConditions)
                        V_Register_NonMemberAcceptConditionText()
                    }
                    
                    Button {
                        hideKeyboard()
                        Task {
                            do {
                                try await viewModel.submitForm()
                                await MainActor.run {
                                    showBottomSheetSuccess = true
                                }
                            }
                            catch {
                                print(error)
                            }
                        }
                    } label: {
                        Text("Register")
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.SECONDARY_COLOR)
                    .cornerRadius(8)
                }
                .padding([.horizontal, .bottom], 16)
            }
            .sheet(isPresented: $showBottomSheetSuccess, content: {
                Text("Send form success")
                    .presentationDetents([.fraction(0.15)])
            })
            
        }
    }
}

#Preview {
    V_Register_NonMember(viewModel: .init(email: "", firstName: "", lastName: "", gender: .female, district: "", phoneNumber: "", address: "", registerService: MockRegisterUseCase()))
}
