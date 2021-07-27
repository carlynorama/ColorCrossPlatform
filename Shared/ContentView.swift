//
//  ContentView.swift
//  Shared
//
//  Created by Carlyn Maw on 7/24/21.
//

import SwiftUI

struct ContentView: View {
//    @State var color1:Color
//    @State var color2:Color
    
    var body: some View {
        VStack {
            LEDPickerView()
            ColorControllerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
