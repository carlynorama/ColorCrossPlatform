//
//  LEDPickerView.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/26/21.
//

import SwiftUI



struct CurrentSettingView: View {
    @Binding var blink1:Blink1UISettings
    
    //    @Binding var color1:Color //= Color.springGreen
    //    @Binding var color2:Color //= Color.lemonYellow
    //
    var topSelected:Bool {
        get {
            blink1.selectionState == .both || blink1.selectionState == .top
        }
        set {
            
        }
        
    }
    
    var bottomSelected:Bool {
        get {
            blink1.selectionState == .both || blink1.selectionState == .bottom
        }
    }
    
    
    
    
    
    var body: some View {
        VStack(spacing:0) {
            Rectangle()
                .fill(topSelected ? blink1.color1 : blink1.color1.opacity(0.2))
                .onTapGesture(perform: {
                    blink1.selectionState.toggleTop()
                })
            Rectangle()
                .fill(bottomSelected ? blink1.color2 : blink1.color2.opacity(0.2))
                .onTapGesture(perform: {
                    blink1.selectionState.toggleBottom()
                })
        }.aspectRatio(8/3, contentMode: .fit)
    }
}

struct LEDPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSettingView(blink1: .constant(Blink1UISettings()))
    }
}
