//
//  ColorPickerSlider.swift
//  ColorPlex
//
//  Created by Labtanza on 7/24/21.
//

import SwiftUI

struct ColorPickerSlider: View {
    @Binding var value:Double
    var label:String
    let minVal = 0
    let maxVal = 255
    let minText = Text("0")
    let maxText = Text("255")
    
    var mappedValue:Double {
        (value * Double(maxVal-minVal)) + Double(minVal)
    }
    
    var displaySilderValue:String {
        String(format: "%.4f", value)
    }
    
    var displayMappedValue:String {
        String(format: "%05.2f", mappedValue)
    }
    
    var shortLabel:String {
        var slabel = label.prefix(1)
        slabel.append(":")
        return String(slabel)
    }
    
    var body: some View {
        HStack {
            Text(shortLabel)
            Slider(
                value: $value,
                minimumValueLabel: minText,
                maximumValueLabel: maxText
            ) {
                Text(label)
            }
            VStack(alignment: .trailing) {
                Text("\(displaySilderValue)")
                Text("\(displayMappedValue)")
            }.font(.system(.caption, design: .monospaced))
            
        }
    }
}

//struct ColorPickerSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorPickerSlider()
//    }
//}
