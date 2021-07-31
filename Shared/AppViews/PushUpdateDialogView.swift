//
//  PushUpdateDialogView.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/30/21.
//

import SwiftUI

struct PushUpdateDialogView: View {

        @Environment(\.presentationMode) var presentationMode
        
        @EnvironmentObject var store:Blink1DeviceStore
        @Binding var settings:Blink1UISettings
        
        var body: some View {
            VStack {
                Text(store.getMessage(settings))
                CopyButton(textToCopy: store.getMessage(settings)) {
                    Text("Copy to Clipboard")
                }
                Button("Press to dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        
    
}

struct PushUpdateDialogView_Previews: PreviewProvider {
    static let previewStore = Blink1DeviceStore()
    
    static var previews: some View {
        PushUpdateDialogView(settings: .constant(Blink1UISettings.exampleSettings)).environmentObject(previewStore)
    }
}
