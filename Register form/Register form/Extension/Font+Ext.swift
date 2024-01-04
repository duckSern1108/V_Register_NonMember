//
//  Font+Ext.swift
//  Register form
//
//  Created by Admin on 04/01/2024.
//

import SwiftUI


extension Font {
    static func adobeClean(size: CGFloat, weight: Weight = .black) -> Font {
        switch weight {
        case .black:
            return .custom("AdobeClean-Black", size: size)
        default:
            return .custom("AdobeClean-Black", size: size)
        }
    }
}
