//
//  Color+Components.swift
//  ColorPlex
//
//  Created by Labtanza on 7/24/21.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension Color {
    #if canImport(UIKit)
    typealias NativeColor = UIColor
    #elseif canImport(AppKit)
    typealias NativeColor = NSColor
    #endif
    
    
    //MARK: -Test Colors
    static let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    static let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)
    static let springGreen = Color(hue: 0.35, saturation: 0.5, brightness: 1)
    static let steelGray = Color(white: 0.4745)
    
    //MARK: -Component Getters
    var redValue:Double {
        Double(self.cgColor?.components?[0] ?? self.rgbComponents.red)
    }
    
    var greenValue:Double {
        Double(self.cgColor?.components?[1] ?? self.rgbComponents.green)
    }
    
    var blueValue:Double {
        Double(self.cgColor?.components?[2] ?? self.rgbComponents.blue)
    }
    
    var alphaValue:Double {
        Double(self.cgColor?.components?[3] ?? self.rgbComponents.opacity)
    }
    
    var redByte:UInt8 {
        let cgfloat:CGFloat = (self.cgColor?.components?[0] ?? self.rgbComponents.red)
        return UInt8(cgfloat * 255)
    }
    
    var greenByte:UInt8 {
        let cgfloat:CGFloat = (self.cgColor?.components?[1] ?? self.rgbComponents.green)
        return UInt8(cgfloat * 255)
    }
    
    var blueByte:UInt8 {
        let cgfloat:CGFloat = (self.cgColor?.components?[2] ?? self.rgbComponents.blue)
        return UInt8(cgfloat * 255)
    }
    
    var hue:Double {
        Double(self.hsbComponents.hue)
    }
    
    var saturation:Double {
        Double(self.hsbComponents.saturation)
    }
    
    var brightness:Double {
        Double(self.hsbComponents.brightness)
    }
    
    //MARK: - Access NativeColor
    
    //https://stackoverflow.com/questions/56586055/how-to-get-rgb-components-from-color-in-swiftui/62994482#62994482
    //Color.red.components.red // 0.9999999403953552 // <- SwiftUI Colors are not pure!
    //guard from example code removed b/c of error on macOS
    var rgbComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0
        
        NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o)
        return (r, g, b, o)
    }
    
    //my HSV Version
    var hsbComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, opacity: CGFloat) {
        
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0
        
        NativeColor(self).getHue(&h, saturation: &s, brightness: &b, alpha: &o)
        return (h, s, b, o)
    }
    
    //MARK: - Component Setters
    
    func updateRGB(red:Double? = nil, green:Double? = nil, blue:Double? = nil) -> Color {
        return Color(
            red: red ?? self.redValue,
            green: green ?? self.greenValue,
            blue: blue ?? self.blueValue
        )
    }
    
    func updateHSB(H:Double? = nil, S:Double? = nil, B:Double? = nil) -> Color {
        return Color(
            hue: H ?? self.hue,
            saturation: S ?? self.saturation,
            brightness: B ?? self.brightness)
    }
    
    //MARK: - Custom Init
    
    init(red: UInt8, green: UInt8, blue: UInt8) {
        self.init(red: Self.convertByte(red), green: Self.convertByte(green), blue: Self.convertByte(blue), opacity: 1)
    }

    static func convertByte(_ byte:UInt8) -> Double {
        return Double(byte/255)
    }
    
    init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: UInt8(red), green: UInt8(green), blue: UInt8(blue))
    }

    init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    init(hexString: String) {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        hexSanitized = hexSanitized.replacingOccurrences(of: "0x", with: "")


        assert((hexSanitized.count) != 6, "Invalid string")
        
        var rgbValue:UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgbValue)
        
        self.init(rgb: Int(rgbValue))
    }
}
