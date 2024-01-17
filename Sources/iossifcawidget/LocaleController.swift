//
//  LocaleManager.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 9/1/2024.
//

import Foundation
import SwiftUI

public class LanguageController: ObservableObject {
  @Published var currentLanguage = "en"
  @Published var layoutDirection: LayoutDirection = .leftToRight
}

public class Localizer {

  public static func setLanguage(_ language: String, controller: LanguageController) {
    controller.currentLanguage = language
    controller.layoutDirection = (language == "ar") ? .rightToLeft : .leftToRight
  }

  public static func localizedString(_ key: String, controller: LanguageController) -> String {
    let path = Bundle.module.path(forResource: controller.currentLanguage, ofType: "lproj")
    let bundle = Bundle(path: path ?? "") ?? Bundle.main
    return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "", comment: "")
  }
}
