//
//  CrossPlatformSizeClass.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/30/21.
//

import SwiftUI

#if os(macOS)
enum UserInterfaceSizeClass {
    case compact
    case regular
}

struct HorizontalSizeClassEnvironmentKey: EnvironmentKey {
    static let defaultValue: UserInterfaceSizeClass = .regular
}
struct VerticalSizeClassEnvironmentKey: EnvironmentKey {
    static let defaultValue: UserInterfaceSizeClass = .regular
}

extension EnvironmentValues {
    var horizontalSizeClass: UserInterfaceSizeClass {
        get { return self[HorizontalSizeClassEnvironmentKey] }
        set { self[HorizontalSizeClassEnvironmentKey] = newValue }
    }
    var verticalSizeClass: UserInterfaceSizeClass {
        get { return self[VerticalSizeClassEnvironmentKey] }
        set { self[VerticalSizeClassEnvironmentKey] = newValue }
    }
}
#endif
