//
//  RGBLED.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/26/21.
//

import Foundation
import SwiftUI

struct RGBLED {
    var red: UInt8
    var green: UInt8
    var blue: UInt8
    
    mutating func setColor(to newColor:Color) {
        red = newColor.redByte
        green = newColor.greenByte
        blue = newColor.blueByte
    }
    
    mutating func turnOff() {
        red = 0
        green = 0
        blue = 0
    }
    
    var isOff:Bool {
        red == 0 && green == 0 && blue == 0
    }
    
    var isOn:Bool {
        !isOff
    }
    
    var color:Color {
        Color(red: red, green: green, blue: blue)
    }
    
}
