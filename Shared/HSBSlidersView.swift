//
//  HSVSlidersView.swift
//  ColorPlex
//
//  Created by Labtanza on 7/24/21.
//

import SwiftUI

struct HSBSlidersView: View {
    @Binding var myColor:Color //= Color(red: 0.4, green: 0.1, blue: 0.7)//Color.gray //Color.lemonYellow//Color(red: 0.4, green: 0.1, blue: 0.7)
    
    var hueValue: Binding<Double> { Binding (
            get: {
                return myColor.hue
            },
            set: {
                myColor = myColor.updateHSB(H: $0)
            }
        )
    }
    
    var saturationValue: Binding<Double> { Binding (
            get: { myColor.saturation },
            set: {
                myColor = myColor.updateHSB(S: $0)
            }
        )
    }
    
    var brightnessValue: Binding<Double> { Binding (
            get: { myColor.brightness },
            set: {
                myColor = myColor.updateHSB(B: $0)
            }
        )
    }
    
    var body: some View {
        VStack {
            //myColor
            ColorPickerSlider(value: hueValue, label: "Hue")
            ColorPickerSlider(value: saturationValue, label: "Saturation")
            ColorPickerSlider(value: brightnessValue, label: "Brightness")
        }
    }
}

//struct HSVSlidersView_Previews: PreviewProvider {
//    static var previews: some View {
//        HSBSlidersView()
//    }
//}
