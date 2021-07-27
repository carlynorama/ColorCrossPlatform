//
//  Blink1.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/26/21.
//

import Foundation
import SwiftUI


struct Blink1 {
    var LED1:RGBLED
    var LED2:RGBLED
    
    var pendingColor1:Color?
    var pendingColor2:Color?
    
    init() {
        LED1 = RGBLED(red: 0, green: 0, blue: 0)
        LED2 = RGBLED(red: 0, green: 0, blue: 0)
    }
    
    //current color patterns
    //led 1 color
    //led 2 color
    //firmware

}
