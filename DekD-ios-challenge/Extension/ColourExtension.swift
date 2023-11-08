//
//  ColourExtension.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 8/11/2566 BE.
//

import SwiftUI

extension Color {
    // MARK: = Primary Colours
    static var dekdPrimaryOrange: Color {
        return Color(hex: "fe7003")
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let aShade: UInt64
        let rShade: UInt64
        let gShade: UInt64
        let bShade: UInt64
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (aShade, rShade, gShade, bShade) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (aShade, rShade, gShade, bShade) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (aShade, rShade, gShade, bShade) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (aShade, rShade, gShade, bShade) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(rShade) / 255,
            green: Double(gShade) / 255,
            blue: Double(bShade) / 255,
            opacity: Double(aShade) / 255
        )
    }
}
