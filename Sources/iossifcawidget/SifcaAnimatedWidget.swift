//
//  SifcaAnimatedWidget.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 14/1/2024.
//

import SwiftUI

public struct SifcaAnimatedWidget<Content: View>: View {
    let content: () -> Content

    @EnvironmentObject private var animatedWidgetController1: AnimatedWidgetController
    @StateObject public var animatedWidgetController2: AnimatedWidgetController = AnimatedWidgetController()

    @State private var shakeAmount: CGFloat = 0

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        if animatedWidgetController1.isAnimated {
            content()
                .offset(x: shakeAmount, y: shakeAmount * 0.2)
                .animation(Animation.easeInOut(duration: 0.1).repeatForever())
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
                        self.shakeAmount = self.shakeAmount == 4 ? -4 : 4
                    }
                }
                .onDisappear {
                    // Handle any cleanup on disappear
                }
                .environmentObject(animatedWidgetController2)
        } else {
            content().environmentObject(animatedWidgetController2)
        }
    }
}
