//
//  SifcaAnimatedWidget.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 14/1/2024.
//

import SwiftUI

public struct SifcaAnimatedWidget<Content: View>: View {
    let content: () -> Content

    @EnvironmentObject private var animatedWidgetController: AnimatedWidgetController
    @State private var shakeAmount: CGFloat = 0

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        content()
            .modifier(ConditionalAnimationModifier(isAnimated: animatedWidgetController.isAnimated))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
                    self.shakeAmount = self.shakeAmount == 4 ? -4 : 4
                }
            }
            .onDisappear {
                // Handle any cleanup on disappear
            }
    }
}

struct ConditionalAnimationModifier: ViewModifier {
    let isAnimated: Bool

    func body(content: Content) -> some View {
        if isAnimated {
            return content
                .offset(x: shakeAmount, y: shakeAmount * 0.2)
                .animation(Animation.easeInOut(duration: 0.1).repeatForever())
                .transition(.opacity)
        } else {
            return content
        }
    }
}