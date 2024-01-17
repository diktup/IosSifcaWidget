//
//  LocaleManager.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 9/1/2024.
//

import Foundation
import SwiftUI

public class LanguageController: ObservableObject {
    @Published public var currentLanguage = "en"
    @Published public var layoutDirection: LayoutDirection = .leftToRight
}

public class Localizer {
    private static let bundleIdentifier = "iossifcawidget"  // Replace with your actual bundle identifier

    public static func setLanguage(_ language: String, controller: LanguageController) {
        let bundle = Bundle(identifier: bundleIdentifier)
        controller.currentLanguage = language
        controller.layoutDirection = (language == "ar") ? .rightToLeft : .leftToRight
    }

    public static func localizedString(_ key: String, controller: LanguageController) -> String {
        let bundle = Bundle(identifier: bundleIdentifier)
        return NSLocalizedString(key, tableName: nil, bundle: bundle ?? Bundle.main, value: "", comment: "")
    }
}