//
//  Blink1HTTPURL.swift
//  ColorCrossPlatform (iOS)
//
//  Created by Labtanza on 7/31/21.
// https://github.com/todbot/blink1/blob/master/docs/app-url-api-examples.md

import Foundation


//'http://localhost:8934/blink1/fadeToRGB?rgb=%23ffcc00

struct Blink1HTTPComandUrl {
    var host:String
    var base = "blink1"
    var command:String
    var settings:[String: String] = [:]
    
    var urlString:String {
        var string = "http://\(host)/\(base)/\(command)/"
        
        if settings.count > 0 {
            string.append("?")
            for (key, value) in settings {
                string.append("\(key)=\(value)")
            }
        }
        
        return string
    }
}

