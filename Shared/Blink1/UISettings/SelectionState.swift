//
//  SelectionState.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/27/21.
//

import Foundation
import SwiftUI

enum SelectionState:CaseIterable {
    case top
    case bottom
    case both
    case none
    
    var description:String {
        switch self {
        case .top:
            return "top"
        case .bottom:
            return "bottom"
        case .both:
            return "both"
        case .none:
            return "neither"
        }
    }
    
    mutating func toggleTop() {
        switch self {
        case .top:
            self = .none
        case .bottom:
            self = .both
        case .both:
            self = .bottom
        case .none:
            self = .top
        }
    }
    
    mutating func toggleBottom() {
        switch self {
        case .top:
            self = .both
        case .bottom:
            self = .none
        case .both:
            self = .top
        case .none:
            self = .bottom
        }
    }
}
