//
//  AnimatedWidgetController.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 14/1/2024.
//

import Foundation
import SwiftUI

class AnimatedWidgetController: ObservableObject {
    @Published var isAnimated: Bool = false
}

class AnimatedWidgetManager {
    static func toggleTheAnimation(controller: AnimatedWidgetController) {
        controller.isAnimated.toggle()
    }
}
