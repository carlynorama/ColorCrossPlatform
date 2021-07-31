//
//  GeneralColorPickerView.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/31/21.
//

import SwiftUI

struct GeneralColorPickerView: View {
    @State var pickedColor:Color //@State vs @Binding
    var perform: (Color) -> Void
    
    var body: some View {
        AdaptiveStack {
            pickedColor
                .onTapGesture {
                    perform(pickedColor)
                }
            ColorSlidersView(myColor: $pickedColor)
                .onChange(of: pickedColor) { value in
                    perform(value)
                }

        }
    }
}

//struct GeneralColorPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeneralColorPickerView()
//    }
//}
