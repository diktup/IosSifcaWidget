//
//  WidgetDots.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 11/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct WidgetDots: View {
    @Binding var position: CGPoint
    @Binding var isRight: Bool
    @Binding var showDots: Bool
    @Binding var dialogIndex: Int

    @EnvironmentObject private var animatedWidgetController: AnimatedWidgetController
    @State private var isShowingDialog = false

    let imageList = [
        "lord-icon-money",
        "lord-icon-profile",
        "lord-icon-walkie-talkie",
        "lord-icon-chat",
        "lord-icon-joystick",
        "lord-icon-eye",
        "lord-icon-link",
    ]
  public   var body: some View {
        ZStack {
            ForEach(imageList.indices, id: \.self) { index in
                let angle = Double(index) * (Double.pi / 6) * 1.1 - 1.75
                let x = position.x + 80 * (isRight ? -cos(angle) : cos(angle))
                let y = position.y + 80 * sin(angle)
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 34.0, height: 34.0)
                        .shadow(color: Color.black.opacity(0.8), radius: 4, x: 0, y: 0)
                    GIFImage(name: imageList[index])
                        .frame(width: 34.0, height: 34.0)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.8), radius: 4, x: 0, y: 0)
                }
                .position(x: CGFloat(x), y: CGFloat(y))
                .gesture(
                    TapGesture()
                        .onEnded {
                            dialogIndex = index
                            if index == 5 {
                                 AnimatedWidgetManager.toggleTheAnimation(controller: animatedWidgetController)
                            }
                        })
            }
        }
    }
}
