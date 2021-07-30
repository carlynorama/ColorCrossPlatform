//
//  CopyToClipBoardButton.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/30/21.
//

import SwiftUI

struct CopyToClipBoardButton: View {
    var message:String
    
    var body: some View {
        Button("Copy to Pasteboard") {
            copy(message)
        }
    }
    
    func copy(_ message:String) {
        #if os(iOS) || os(watchOS) || os(tvOS)
        let pasteboard = UIPasteboard.general
        pasteboard.string = message
        #elseif os(macOS)
        let color = NSColor.red
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(textFieldText, forType: .string)
        #endif
    }
}

struct CopyToClipBoardButton_Previews: PreviewProvider {
    static var previews: some View {
        CopyToClipBoardButton(message: "Hello World")
    }
}
