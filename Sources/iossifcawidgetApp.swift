//
//  iossifcawidgetApp.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 4/1/2024.
//

import SwiftUI

@main
struct iossifcawidgetApp: App {
    @StateObject private var animatedWidgetController = AnimatedWidgetController()
    @StateObject private var languageController = LanguageController()
    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(languageController)
                .environmentObject(themeManager)
                .environmentObject(animatedWidgetController)
        }
    }
}

struct ContentView: View {
    @StateObject private var animatedWidgetController = AnimatedWidgetController()

    var body: some View {
        SifcaWidget().environmentObject(animatedWidgetController)
    }
}

#Preview {
    ContentView()
}
