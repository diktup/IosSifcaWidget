//
//  WidgetDots.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 11/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct WidgetDots: View {
  @Binding public var position: CGPoint
  @Binding public var right: Bool
  @Binding public var showDots: Bool
  @Binding public var dialogIndex: Int

  @EnvironmentObject public var animatedWidgetController: AnimatedWidgetController
  @State public var isShowingDialog = false

  let imageList = [
    "https://res.cloudinary.com/sifca/image/upload/v1703254268/flutter-mobile-widget/lord-icon-money.gif",
    "https://res.cloudinary.com/sifca/image/upload/v1703254270/flutter-mobile-widget/lord-icon-profile.gif",
    "https://res.cloudinary.com/sifca/image/upload/v1703254272/flutter-mobile-widget/lord-icon-walkie-talkie.gif",
    "https://res.cloudinary.com/sifca/image/upload/v1703254263/flutter-mobile-widget/lord-icon-chat.gif",
    "https://res.cloudinary.com/sifca/image/upload/v1703254268/flutter-mobile-widget/lord-icon-joystick.gif",
    "https://res.cloudinary.com/sifca/image/upload/v1703254263/flutter-mobile-widget/lord-icon-eye.gif",
    "https://res.cloudinary.com/sifca/image/upload/v1703254270/flutter-mobile-widget/lord-icon-link.gif",
  ]

  public var body: some View {
    ZStack {
      ForEach(imageList.indices, id: \.self) { index in
        let angle = Double(index) * (Double.pi / 6) * 1.1 - 1.75
        let x = position.x + 80 * (right ? -cos(angle) : cos(angle))
        let y = position.y + 80 * sin(angle)
        ZStack {

          Circle()
            .fill(Color.white)
            .frame(width: 38.0, height: 38.0)
            .shadow(color: Color.black.opacity(0.8), radius: 4, x: 0, y: 0)

          GIFImageWithURL(url: URL(string: imageList[index])!)
                
            .frame(width: 34.0, height: 34.0)
            .clipShape(Circle())

        }
        .position(x: CGFloat(x), y: CGFloat(y))
        .gesture(
          TapGesture()
            .onEnded {
              dialogIndex = index
              if index == 5 {
                AnimatedWidgetManager.toggleTheAnimation(controller: animatedWidgetController)
                // Load image data asynchronously

              }
            }
        )
      }
    }
  }
}
