//
//  Switchboard.swift
//  ColorCrossPlatform (iOS)
//
//  Created by Labtanza on 7/29/21.
//

import Foundation

//TODO: make actor
class Switchboard {
    
    
//    enum ConnectionType {
//        case debug
//        //case http
//        //case local process
//        //case usb-hid
//        //case ble-hid
//    }
//
//    enum ConnectionStatus {
//        case presumed //device location can be seen, but not in a way that allows query
//        case verified //device location can be seen, device has provided response
//        case unreachable //location cannot be connected to, device not found, device has wrong id
//    }
//
//    struct StatusResult {
//        let type:ConnectionType
//        let typeMeta:String?
//        let date:Date
//        let status:ConnectionStatus
//        let responseContent:String?
//    }
    
    func send(debug message:String) {
        print(message)
    }
    

}


//extension Switchboard.StatusResult {
//    static var exampleResult:Self {
//        Switchboard.StatusResult(
//            type: .debug,
//            typeMeta: nil,
//            date: Date(),
//            status: .presumed,
//            responseContent: nil
//        )
//    }
//}
