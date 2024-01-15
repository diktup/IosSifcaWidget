//
//  TextFieldPlaceholderStyle.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 14/1/2024.
//

import SwiftUI

public struct TextFieldPlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    var placeholderColor: Color

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder).foregroundColor(placeholderColor.opacity(0.6))
            }
            content
                .foregroundColor(placeholderColor)
        }
    }
}
