//
//  Blink1.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/26/21.
//
// TODO: Selection state for setting vs selection state for sending

import Foundation
import SwiftUI



struct Blink1UISettings {
    
    private(set) var color1:Color
    private(set) var color2:Color
    
    var selectionState:SelectionState
    
    init() {
        //LED1 = RGBLED(red: 0, green: 0, blue: 0)
        //LED2 = RGBLED(red: 0, green: 0, blue: 0)
        color1 = Color.black
        color2 = Color.black
        selectionState = .both
    }
    
    mutating func updateColor(to newColor:Color) {
        switch selectionState {
        case .top:
            color1 = newColor
        case .bottom:
            color2 = newColor
        case .both:
            color1 = newColor
            color2 = newColor
        case .none:
            print("No led selected")
        }
    }
    
    var colorForState:Color? {
        switch selectionState {

        case .top:
            return color1
        case .bottom:
            return color2
        case .both:
            assert(self.color2 != self.color1, "Which color???")
            return color1
        case .none:
            return nil
        }
    }

}
