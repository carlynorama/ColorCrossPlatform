//
//  Color+StringDescriptions.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/29/21.
//

import Foundation
import SwiftUI

extension Color {
    var hexString:String {
        return String(format: "%02lX%02lX%02lX", lroundf(Float(redByte)), lroundf(Float(greenByte)), lroundf(Float(blueByte)))
    }
    
    var rgbCSV:String {
        return "\(redByte), \(greenByte), \(blueByte)"
    }
    
    var hsbCSV:String {
        return "\(Int(hue * 255)), \(Int(saturation * 255)), \(Int(brightness * 255))"
    }
}
