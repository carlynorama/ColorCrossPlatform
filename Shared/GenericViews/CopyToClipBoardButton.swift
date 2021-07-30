//
//  CopyToClipBoardButton.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/30/21.
//

import SwiftUI

struct CopyToClipBoardButton: View {
    var text:String
    
    var body: some View {
        Button("Copy to Clipboard") {
            copy(text)
        }
    }
    
    func copy(_ message:String) {
        #if os(iOS) || os(watchOS) || os(tvOS)
        let pasteboard = UIPasteboard.general
        pasteboard.string = text
        #elseif os(macOS)
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(message, forType: .string)
        #endif
    }
}

struct CopyToClipBoardButton_Previews: PreviewProvider {
    static var previews: some View {
        CopyToClipBoardButton(text: "Hello World")
    }
}
