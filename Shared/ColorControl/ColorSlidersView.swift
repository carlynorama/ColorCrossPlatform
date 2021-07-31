//
//  ColorControllerView.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/26/21.
//

import SwiftUI

struct ColorSlidersView: View {
    @Binding var myColor:Color //= Color(red: 0.4, green: 0.1, blue: 0.7)
    
    var body: some View {
        VStack {
            HSBSlidersView(myColor: $myColor)
            RGBSlidersView(myColor: $myColor)
            //ColorPicker("ColorPicker", selection: $myColor)
        }
    }
}

//struct ColorControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorControllerView()
//    }
//}
