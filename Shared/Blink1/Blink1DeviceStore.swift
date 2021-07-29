//
//  Blink1DeviceStore.swift
//  ColorCrossPlatform (iOS)
//
//  Created by Labtanza on 7/28/21.
//

import Foundation

//actor
class Blink1DeviceStore:ObservableObject {
    //@Published var devices:[Blink1Device] = [Blink1Device.exampleDevice]
//    @Published var records:[Blink1DeviceRecord] = [Blink1DeviceRecord.exampleRecord]
    @Published var message = ""
//
    private var switchboard:Switchboard = Switchboard()
//    typealias ConnectionType = Switchboard.ConnectionType
//    typealias StatusResult = Switchboard.StatusResult
//
    private let messageMaker = Blink1CLIStringGenerator()
    
    public func getMessage(_ newSettings:Blink1UISettings, device:Blink1Device? = nil) -> String {
        return messageMaker.update(device: device, to: newSettings)
    }
    
    //this should be async
    public func pushSettingsToDevice(_ newSettings:Blink1UISettings, device:Blink1Device? = nil) {
        print("updating....")
        message = messageMaker.update(device: device, to: newSettings)
        switchboard.send(debug: message)
        
        //if no device get the device at index 0?
        //if there is no device at index 0 -> throw
        
        //else find the device record index
        //if there is no record for the device, try to create one
        
        //How to handle "Any" or "All"?

        //Switchboard is given deivce record
        // - looks for it at last known location
        // - looks for it elsewhere?
        
        //guard - Blink1Device or Store gives the Switchboard a formatted message
        
        //async - device operator
        //  - verifies message is properly formatted -> throws
        //  - relays message
        //  - does the connection type return result? if so, handle it -> throws?
    }
    
//    struct Blink1DeviceRecord {
//        var device:Blink1Device
//        var firstSeenDate:Date?
//        var lastSeenDate:Date?
//        var lastSeenConnectionType:ConnectionType
//        var lastStatusCheck:Date?
//        var lastStatusResult:StatusResult
//    }
}

//extension Blink1DeviceStore.Blink1DeviceRecord {
//    static var exampleRecord:Self {
//        Blink1DeviceStore.Blink1DeviceRecord(
//            device: Blink1Device.exampleDevice,
//            firstSeenDate: Date(),
//            lastSeenDate: Date(),
//            lastSeenConnectionType: .debug,
//            lastStatusResult: .exampleResult
//        )
//    }
//}
