//
//  AnimatedWidgetController.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 14/1/2024.
//

import Foundation
import SwiftUI

public class AnimatedWidgetController: ObservableObject {
    @Published var isAnimated: Bool = false
}

public class AnimatedWidgetManager {
    static func toggleTheAnimation(controller: AnimatedWidgetController) {
        controller.isAnimated.toggle()
    }
}
