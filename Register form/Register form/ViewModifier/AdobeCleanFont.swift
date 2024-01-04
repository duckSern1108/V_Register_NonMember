//
//  AdobeCleanFont.swift
//  Register form
//
//  Created by Admin on 04/01/2024.
//

import SwiftUI


struct AdobeCleanFont: ViewModifier {
    var size: CGFloat
    var weight: Font.Weight

    func body(content: Content) -> some View {
        content
            .font(.adobeClean(size: size, weight: weight))            
    }
}

extension View {
    func adobeCleanFont(size: CGFloat, weight: Font.Weight = .black) -> some View {
        modifier(AdobeCleanFont(size: size, weight: weight))
    }
}
