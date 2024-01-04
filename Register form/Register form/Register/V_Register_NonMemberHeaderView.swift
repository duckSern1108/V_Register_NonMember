//
//  V_Register_NonMemberHeaderView.swift
//  Register form
//
//  Created by Admin on 03/01/2024.
//

import SwiftUI

struct V_Register_NonMemberHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                Spacer()
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
            }
            
            Text("REGISTRATION")
                .foregroundColor(.white)
                .font(.custom("AdobeClean-Black", size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding([.bottom, .horizontal])
        .background(
            LinearGradient(gradient: Gradient(colors: [.SECONDARY_COLOR, .PRIMARY_COLOR]),
                           startPoint: .leading, endPoint: .trailing)
        )
    }
}

#Preview {
    V_Register_NonMemberHeaderView()
}
