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
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    init(viewModel: V_Register_NonMemberViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            V_Register_NonMemberHeaderView()
            ScrollView {
                if verticalSizeClass == .compact {
                    V_Register_NonMemberCompactHeightView(viewModel: viewModel, showBottomSheetSuccess: $showBottomSheetSuccess)
                } else {
                    V_Register_NonMemberRegularHeightView(viewModel: viewModel, showBottomSheetSuccess: $showBottomSheetSuccess)
                }
            }
        }
        .sheet(isPresented: $showBottomSheetSuccess, content: {
            Text("Send form success")
                .presentationDetents([.fraction(0.15)])
        })
    }
}

#Preview {
    V_Register_NonMember(viewModel: .init(registerService: MockRegisterUseCase()))
}
