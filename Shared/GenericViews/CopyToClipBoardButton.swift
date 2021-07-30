//
//  CopyToClipBoardButton.swift
//  ColorCrossPlatform
//
//  Created by Labtanza on 7/30/21.
//

import SwiftUI

struct CopyToClipBoardButton: View {
    var textToCopy:String
    var buttonLabel = "Copy to Clipboard"
    
    var body: some View {
        Button(buttonLabel) {
            copy(textToCopy)
        }
    }
    
    func copy(_ message:String) {
        #if os(iOS) || os(watchOS) || os(tvOS)
        let pasteboard = UIPasteboard.general
        pasteboard.string = textToCopy
        #elseif os(macOS)
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(message, forType: .string)
        #endif
    }
}

//struct CopyButton: some View {
//    var view:ViewBuilder
//    var textToCopy:String
//
//    Button(view) {
//        copy(textToCopy)
//    }
//
//    func copy(_ message:String) {
//        #if os(iOS) || os(watchOS) || os(tvOS)
//        let pasteboard = UIPasteboard.general
//        pasteboard.string = textToCopy
//        #elseif os(macOS)
//        let pasteboard = NSPasteboard.general
//        pasteboard.clearContents()
//        pasteboard.setString(message, forType: .string)
//        #endif
//    }
//}

//struct ContainerView<Content: View>: View {
//    let content: Content
//    init(@ViewBuilder content: @escaping () -> Content) {
//        self.content = content()
//    }
//
//    var body: some View {
//        // Do something with `content`
//    }
//}
//
struct CopyButton<Label>: View where Label : View {
    var textToCopy:String
    let label: Label
    
    init(textToCopy:String, @ViewBuilder label: @escaping () -> Label) {
        self.textToCopy = textToCopy
        self.label = label()
    }
    
    var body: some View {
        Button(action: copy) {
            self.label
        }
    }
    
        func copy() {
            #if os(iOS) || os(watchOS) || os(tvOS)
            let pasteboard = UIPasteboard.general
            pasteboard.string = textToCopy
            #elseif os(macOS)
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(textToCopy, forType: .string)
            #endif
        }
}

//public struct Button<Label> : View where Label : View {
//
//    /// Creates a button that displays a custom label.
//    ///
//    /// - Parameters:
//    ///   - action: The action to perform when the user triggers the button.
//    ///   - label: A view that describes the purpose of the button's `action`.
//    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label)
//
//    /// The content and behavior of the view.
//    ///
//    /// When you implement a custom view, you must implement a computed
//    /// `body` property to provide the content for your view. Return a view
//    /// that's composed of primitive views that SwiftUI provides, plus other
//    /// composite views that you've already defined:
//    ///
//    ///     struct MyView: View {
//    ///         var body: some View {
//    ///             Text("Hello, World!")
//    ///         }
//    ///     }
//    ///
//    /// For more information about composing views and a view hierarchy,
//    /// see <doc:Declaring-a-Custom-View>.
//    public var body: some View { get }
//
//    /// The type of view representing the body of this view.
//    ///
//    /// When you create a custom view, Swift infers this type from your
//    /// implementation of the required ``View/body-swift.property`` property.
//    public typealias Body = some View


struct CopyToClipBoardButton_Previews: PreviewProvider {
    static var previews: some View {
        CopyToClipBoardButton(textToCopy: "Hello World")
    }
}



