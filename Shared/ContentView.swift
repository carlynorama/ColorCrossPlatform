//
//  ContentView.swift
//  Shared
//
//  Created by Carlyn Maw on 7/24/21.
//

import SwiftUI

struct ContentView: View {
    @State var pickedColor:Color = Color.springGreen
    @State var blink1:Blink1UISettings = Blink1UISettings()
    
    
    
    
    var body: some View {
        VStack {
            LEDPickerView(blink1: $blink1)
            Picker("Whyich", selection: $blink1.selectionState) {
                ForEach(SelectionState.allCases, id: \.self) { value in
                    Text("\(value.description)").tag(value)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            pickedColor
                .onTapGesture {
                    blink1.updateColor(to: pickedColor)
                }
            ColorControllerView(myColor: $pickedColor)
                .onChange(of: pickedColor, perform: { value in
                    blink1.updateColor(to: pickedColor)
                })
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


