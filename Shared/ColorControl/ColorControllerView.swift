//
//  ColorControllerView.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/26/21.
//

import SwiftUI

struct ColorControllerView: View {
    @State var myColor:Color = Color(red: 0.4, green: 0.1, blue: 0.7)
    
    var body: some View {
        VStack {
            myColor
            HSBSlidersView(myColor: $myColor)
            RGBSlidersView(myColor: $myColor)
            //ColorPicker("ColorPicker", selection: $myColor)
        }.padding()
    }
}

struct ColorControllerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorControllerView()
    }
}
