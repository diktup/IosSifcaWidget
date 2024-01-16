//
//  AnimatedWidgetController.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 14/1/2024.
//

import Foundation
import SwiftUI

public class AnimatedWidgetController: ObservableObject {
    @Published public var isAnimated: Bool = false
}

public class AnimatedWidgetManager {
    public static func toggleTheAnimation(controller: AnimatedWidgetController) {
        controller.isAnimated.toggle()
    }
}