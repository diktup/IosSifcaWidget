//
//  LocaleManager.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 9/1/2024.
//

import Foundation
import SwiftUI

class LanguageController: ObservableObject {
    @Published var currentLanguage = "en"
    @Published var layoutDirection: LayoutDirection = .leftToRight
}

class Localizer {
    static func setLanguage(_ language: String, controller: LanguageController) {
        controller.currentLanguage = language
        controller.layoutDirection = (language == "ar") ? .rightToLeft : .leftToRight
    }

    static func localizedString(_ key: String, controller: LanguageController) -> String {
        let path = Bundle.main.path(forResource: controller.currentLanguage, ofType: "lproj")
        let bundle = Bundle(path: path!) ?? Bundle.main
        return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
