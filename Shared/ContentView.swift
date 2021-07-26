//
//  ContentView.swift
//  Shared
//
//  Created by Carlyn Maw on 7/24/21.
//

import SwiftUI

struct ContentView: View {
    @State var myColor:Color = Color(red: 0.4, green: 0.1, blue: 0.7)
    
    var body: some View {
        VStack {
            myColor
            HSBSlidersView(myColor: $myColor)
            RGBSlidersView(myColor: $myColor)
            ColorPicker("ColorPicker", selection: $myColor)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
