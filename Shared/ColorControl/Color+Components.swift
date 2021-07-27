//
//  Color+Components.swift
//  ColorPlex
//
//  Created by Labtanza on 7/24/21.
//

import Foundation
import SwiftUI

extension Color {
    //MARK: -Test Colors
    static let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    static let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)
    static let springGreen = Color(hue: 0.35, saturation: 0.5, brightness: 1)
    static let steelGray = Color(white: 0.4745)
    
    //MARK: -Component Getters
    var red:Double {
        Double(self.cgColor?.components?[0] ?? self.rgbComponents.red)
    }
    
    var green:Double {
        Double(self.cgColor?.components?[1] ?? self.rgbComponents.green)
    }
    
    var blue:Double {
        Double(self.cgColor?.components?[2] ?? self.rgbComponents.blue)
    }
    
    var alpha:Double {
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
    var rgbComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0
        
        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            // You can handle the failure here as you want
            return (0, 0, 0, 1)
        }
        
        return (r, g, b, o)
    }
    
    //my HSV Version
    var hsbComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, opacity: CGFloat) {
        
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif
        
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0
        
        guard NativeColor(self).getHue(&h, saturation: &s, brightness: &b, alpha: &o) else {
            // You can handle the failure here as you want
            return (0, 0, 0, 1)
        }
        
        return (h, s, b, o)
    }
    
    //MARK: - Component Setters
    
    func updateRGB(red:Double? = nil, green:Double? = nil, blue:Double? = nil) -> Color {
        return Color(
            red: red ?? self.red,
            green: green ?? self.green,
            blue: blue ?? self.blue
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
}
