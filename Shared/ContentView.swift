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
            })
            
            ColorControllerView(pickedColor: $pickedColor, settings: $settings)
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            UpdateMessage(settings: $settings).environmentObject(store)
        }
    }
    

}

struct UpdateMessage:View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var store:Blink1DeviceStore
    @Binding var settings:Blink1UISettings
    
    var body: some View {
        VStack {
            Text(store.getMessage(settings))
            CopyToClipBoardButton(textToCopy: store.getMessage(settings))
            CopyButton(textToCopy: store.getMessage(settings)) {
                Text("Test")
            }.buttonStyle(ExampleStyle())
            Button("Press to dismiss") {
                presentationMode.wrappedValue.dismiss()
            }.buttonStyle(ExampleStyle())
            .font(.title)
            .padding()
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ExampleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.springGreen)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

