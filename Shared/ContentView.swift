//
//  ContentView.swift
//  Shared
//
//  Created by Carlyn Maw on 7/24/21.
//

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
            Button("Press to dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .padding()
            .background(Color.black)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


