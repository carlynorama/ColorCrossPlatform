//
//  Blink1Device.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/27/21.
//

import Foundation


struct Blink1Device {
    let id:String
    let firmwareVersion:String?
    var serialNumber:String?
    var nickname:String?
//    var LED1:RGBLED
//    var LED2:RGBLED
}

extension Blink1Device {
    static var exampleDevice:Blink1Device = Blink1Device(
        id: UUID().uuidString,
        firmwareVersion: "302",
        serialNumber: "3374299d"//,
        //LED1: RGBLED(),
        //LED2: RGBLED()
    )
}
