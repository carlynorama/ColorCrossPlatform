//
//  LEDPickerView.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/26/21.
//

import SwiftUI

enum SelectionState {
    case top
    case bottom
    case both
    case none
}

struct LEDPickerView: View {
    @State var color1:Color = Color.springGreen
    @State var color2:Color = Color.lemonYellow
    
    @State var topSelected = true
    @State var bottomSelected = true
    
    
    var body: some View {
        VStack {
            Circle()
                .fill(topSelected ? color1 : color1.opacity(0.2))
                .onTapGesture(perform: {
                    topSelected.toggle()
                })
            Circle()
                .fill(bottomSelected ? color2 : color2.opacity(0.2))
                .onTapGesture(perform: {
                    bottomSelected.toggle()
                })
        }
    }
}

struct LEDPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LEDPickerView()
    }
}
