//
//  SifcaAnimatedWidget.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 14/1/2024.
//

import SwiftUI

struct SifcaAnimatedWidget<Content: View>: View {
    @EnvironmentObject private var animatedWidgetController: AnimatedWidgetController
    @State private var shakeAmount: CGFloat = 0
 
    private func getOffset(controller: AnimatedWidgetController) -> CGSize {
        if animatedWidgetController.isAnimated {
            let randomX = CGFloat.random(in: 0.0 ... 1.0) * 6 - 1
            let randomY = CGFloat.random(in: 0.0 ... 1.0) * 6 - 1
            return CGSize(width: randomX, height: randomY)
        } else {
            return CGSize.zero
        }
    }

    let content: () -> Content

    var body: some View {
        if animatedWidgetController.isAnimated {
            content()
                .offset(x: shakeAmount, y: shakeAmount * 0.2)
                .animation(Animation.easeInOut(duration: 0.1).repeatForever())
                .onAppear {
                     Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
                        self.shakeAmount = self.shakeAmount == 4 ? -4 : 4
                    }
                }
                .onDisappear {
                 }
        } else {
            content()
        }
    }
}
