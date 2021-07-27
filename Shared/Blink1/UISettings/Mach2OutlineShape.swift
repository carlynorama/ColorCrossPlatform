//
//  Mach2OutlineShape.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/27/21.
//

import SwiftUI


struct Mach2OutlineShapeMach2OutlineShape: Shape {
    var usbjackLengthRatio = 0.3
    
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Mach2OutlineShapeView: View {
    var body: some View {
        //Mach2OutlineShapeMach2OutlineShape()
        HStack {
            Mach2OutlineShapeMach2OutlineShape()
                .aspectRatio(8/3, contentMode: .fit)
        }
    }
}

struct Mach2OutlineShape_Previews: PreviewProvider {
    static var previews: some View {
        Mach2OutlineShapeView()
    }
}
