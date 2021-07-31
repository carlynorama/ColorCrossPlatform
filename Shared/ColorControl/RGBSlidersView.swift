//
//  RGBSlidersView.swift
//  ColorPlex
//
//  Created by Labtanza on 7/24/21.
//

import SwiftUI

struct RGBSlidersView: View {
    @Binding var myColor:Color// = Color(red: 0.4, green: 0.1, blue: 0.7)//Color.gray //Color.lemonYellow//Color(red: 0.4, green: 0.1, blue: 0.7)
    
    var redValue: Binding<Double> { Binding (
            get: {
                return myColor.redValue
            },
            set: {
                myColor = myColor.updateRGB(red: $0)
            }
        )
    }
    
    var greenValue: Binding<Double> { Binding (
            get: { myColor.greenValue },
            set: {
                myColor = myColor.updateRGB(green: $0)
            }
        )
    }
    
    var blueValue: Binding<Double> { Binding (
            get: { myColor.blueValue },
            set: {
                myColor = myColor.updateRGB(blue: $0)
            }
        )
    }
    
    var body: some View {
        VStack {
            //myColor
            ColorPickerSlider(value: redValue, label: "Red")
            ColorPickerSlider(value: greenValue, label: "Green")
            ColorPickerSlider(value: blueValue, label: "Blue")
        }
    }
}

//struct RGBSlidersView_Previews: PreviewProvider {
//    static var previews: some View {
//        RGBSlidersView()
//    }
//}
