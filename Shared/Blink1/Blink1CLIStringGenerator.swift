//
//  Blink1CommandLineAPI.swift
//  ColorCrossPlatform (iOS)
//
//  Created by Labtanza on 7/29/21.
//

import Foundation
import SwiftUI

struct Blink1CLIStringGenerator {
    
    func updateColor(of device:Blink1Device?, led:Int? = nil, to color:Color) -> String {
        var message = "blink1-tool"
        if device != nil && device?.serialNumber != nil {
            message.append(" -- d \(device!.serialNumber!)")
        }
        
        if led != nil {
            message.append(" --led \(led!)")
        }
        
        message.append(" --rgb=\(color.hexString)")
        
        return message
    }
    
    func update(device:Blink1Device?, to newSettings:Blink1UISettings) -> String {
        
        var commands:String = ""
        let delim = " ; "

        switch newSettings.selectionState {
        case .both:
            if newSettings.color1 == newSettings.color2 {
                let message = updateColor(of: device, led: nil, to: newSettings.colorForState!)
                commands.append(message)
            } else {
                let message1 = updateColor(of: device, led: 1, to: newSettings.color1)
                let message2 = updateColor(of: device, led: 2, to: newSettings.color2)
                commands.append(message1)
                commands.append(delim)
                commands.append(message2)
            }

        case .top:
            let message1 = updateColor(of: device, led: 1, to: newSettings.color1)
            commands.append(message1)
        case .bottom:
            let message2 = updateColor(of: device, led: 2, to: newSettings.color2)
            commands.append(message2)
        default:
            let message1 = updateColor(of: device, led: 1, to: newSettings.color1)
            let message2 = updateColor(of: device, led: 2, to: newSettings.color2)
            commands.append(message1)
            commands.append(delim)
            commands.append(message2)
        }

        return commands
    }
    
    func turnOff(device:Blink1Device?) -> String {
        return updateColor(of: device, to: Color.black)
    }
    
    func turnOn(device:Blink1Device?) -> String {
        return updateColor(of: device, to: Color.white)
    }
    
}
