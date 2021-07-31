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
        Picker("Which LEDs", selection: $settings.selectionState) {
            ForEach(SelectionState.allCases, id: \.self) { value in
                Text("\(value.description)").tag(value)
            }
        }
        .pickerStyle(SegmentedPickerStyle())

        AdaptiveStack {
            pickedColor
                .onTapGesture {
                    settings.updateColor(to: pickedColor)
                }
            ColorSlidersView(myColor: $pickedColor)
                .onChange(of: pickedColor) { _ in
                    settings.updateColor(to: pickedColor)
                }

        }
        
        // ------------
    }
}

//struct ColorControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorControllerView()
//    }
//}