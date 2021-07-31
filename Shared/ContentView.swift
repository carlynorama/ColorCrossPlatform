//
//  ContentView.swift
//  Shared
//
//  Created by Carlyn Maw on 7/24/21.
//
// TODO: Confirm message do what I think they do

import SwiftUI


struct ContentView: View {
    @StateObject var store = Blink1DeviceStore()
    @State var pickedColor:Color = Color.springGreen
    @State var settings:Blink1UISettings = Blink1UISettings()
    
    @State var showSheet = false
    
    
    var body: some View {
        VStack {
            CurrentSettingView(blink1: $settings)
            
            Button(action: {
                showSheet = true
            }, label: {
                Text("Send Settings to Device")
            }).disabled(settings.selectionState == .none)
            
            pickedColor
        
            ColorControllerView(pickedColor: $pickedColor, settings: $settings)
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            PushUpdateDialogView(settings: $settings)
                .environmentObject(store)
                .padding()
        }
    }
    

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

