//
//  SifcaAnimatedWidget.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 14/1/2024.
//

import SwiftUI

public struct SifcaAnimatedWidget<Content: View>: View {
    let content: () -> Content

    @StateObject public var animatedWidgetController: AnimatedWidgetController = AnimatedWidgetController()

    @State private var shakeAmount: CGFloat = 0

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        content()
            .modifier(ConditionalAnimationModifier( shakeAmount: shakeAmount))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
                    self.shakeAmount = self.shakeAmount == 4 ? -4 : 4
                }
            }
            .onDisappear {
                // Handle any cleanup on disappear
            }
            .environmentObject(animatedWidgetController)
    }
}

struct ConditionalAnimationModifier: ViewModifier {
    
     let shakeAmount: CGFloat

    @EnvironmentObject var animatedWidgetController: AnimatedWidgetController

    func body(content: Content) -> some View {
        if animatedWidgetController.isAnimated {
            return AnyView(content
                .offset(x: shakeAmount, y: shakeAmount * 0.2)
                .animation(Animation.easeInOut(duration: 0.1).repeatForever())
                .transition(.opacity))
        } else {
            return AnyView(content)
        }
    }
}