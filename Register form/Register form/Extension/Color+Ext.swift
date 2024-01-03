//
//  Color+Ext.swift
//  Register form
//
//  Created by Admin on 03/01/2024.
//

import SwiftUI


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension Color {
    static let PRIMARY_COLOR: Color = .init(hex: 0x9A1E32)
    static let SECONDARY_COLOR: Color = .init(hex: 0xD10058)
}
