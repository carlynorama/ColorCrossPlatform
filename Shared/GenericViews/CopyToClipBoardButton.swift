//
//  CopyToClipBoardButton.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/30/21.
//

import SwiftUI

struct CopyButton<Label>: View where Label : View {
    var textToCopy:String
    let label: Label
    
    init(textToCopy:String, @ViewBuilder label: @escaping () -> Label) {
        self.textToCopy = textToCopy
        self.label = label()
    }
    
    var body: some View {
        Button(action: copy) {
            self.label
        }
    }
    
    func copy() {
        #if os(iOS) || os(watchOS) || os(tvOS)
        let pasteboard = UIPasteboard.general
        pasteboard.string = textToCopy
        #elseif os(macOS)
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(textToCopy, forType: .string)
        #endif
    }
}
