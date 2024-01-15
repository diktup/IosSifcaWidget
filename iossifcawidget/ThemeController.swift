//
//  ThemeController.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 12/1/2024.
//
import Foundation
import SwiftUI


class ThemeManager: ObservableObject {
    @Published var isDarkMode = true
    @Published var isSystem = false
    @Published var isMainApp = false
    @Published var customFontName: String = "Rubik"
    @Published var fontSize: CGFloat = 20

    var textColor: Color {
        return isDarkMode ? .white : .black
    }

    var backgroundColor: Color {
        return isDarkMode ? .black : .white
    }
    var foreGroundColor: Color {
        return isDarkMode ? .white : .black
    }

    var customFont: Font {
        return Font.custom(customFontName, size: fontSize)
    }
    var bodyFont: Font {
        return Font.custom(customFontName, size: 14).weight(.medium)
    }
}
