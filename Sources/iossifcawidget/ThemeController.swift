//
//  ThemeController.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 12/1/2024.
//
import Foundation
import SwiftUI


public class ThemeManager: ObservableObject {
    @Published public var isDarkMode = true
    @Published public var isSystem = false
    @Published public var isMainApp = false
    @Published public var customFontName: String = "Rubik"
    @Published public var fontSize: CGFloat = 20

 public    var textColor: Color {
        return isDarkMode ? .white : .black
    }

public     var backgroundColor: Color {
        return isDarkMode ? .black : .white
    }
 public    var foreGroundColor: Color {
        return isDarkMode ? .white : .black
    }

  public   var customFont: Font {
        return Font.custom(customFontName, size: fontSize)
    }
  public   var bodyFont: Font {
        return Font.custom(customFontName, size: 14).weight(.medium)
    }
}
