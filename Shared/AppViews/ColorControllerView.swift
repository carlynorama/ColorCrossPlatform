//
//  ColorControllerView.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/29/21.
//

import SwiftUI

struct ColorControllerView: View {
    @Binding var pickedColor:Color
    @Binding var settings:Blink1UISettings
    
    var body: some View {
        // ------------


        VStack {
            Picker("Which LEDs", selection: $settings.selectionState) {
                ForEach(SelectionState.allCases, id: \.self) { value in
                    Text("\(value.description)").tag(value)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            AdaptiveStack {
            pickedColor
                .frame(minWidth:5, minHeight: 5)
                //.layoutPriority(1)
                .onTapGesture {
                    settings.updateColor(to: pickedColor)
                }
            ColorSlidersView(myColor: $pickedColor)
                .onChange(of: pickedColor) { value in
                    settings.updateColor(to: pickedColor)
                }
            }
        }
        
        
        // ------------
    }
}

struct ColorControllerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorControllerView(pickedColor: .constant(Color.blue), settings: .constant(Blink1UISettings.exampleSettings))
    }
}
