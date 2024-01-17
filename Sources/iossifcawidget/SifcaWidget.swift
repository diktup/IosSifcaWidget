//
//  ContentView.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 4/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct SifcaWidget: View {
  @StateObject public var animatedWidgetController: AnimatedWidgetController =
    AnimatedWidgetController()
  @StateObject public var languageController: LanguageController = LanguageController()
  @StateObject public var themeManager: ThemeManager = ThemeManager()

  @State public var verticalCenter: CGFloat = 0
  @State public var position = CGPoint(x: 0, y: 0)
  @State public var showDots = true
  @State public var dialogIndex = -1

  @State private var updateDx: CGFloat = 0.0
  @State private var opacity: Double = 1.0
  @State private var startDx: CGFloat = 0.0
  @State private var right = true
  @State private var updateDy: CGFloat? = 0.0
  @State private var left: CGFloat? = 0.0
  @State private var top: CGFloat? = 0.0

  private func initState() {
    top = UIScreen.main.bounds.size.height / 1.8
    left = UIScreen.main.bounds.size.width / 1.3
    position = CGPoint(x: left, y: top)
  }

  public init() {
    verticalCenter = 0
    position = CGPoint(x: UIScreen.main.bounds.size.width / 1.3, y: UIScreen.main.bounds.size.height / 1.8)
    right = false
    showDots = true
    dialogIndex = -1
  }

  public var body: some View {
    GeometryReader { geometry in
      ZStack {
        if showDots {
          WidgetDots(
            position: $position,
            right: $right,
            showDots: $showDots,
            dialogIndex: $dialogIndex
          ).environmentObject(animatedWidgetController)
        }
        AnimatedView(
          left: left ?? 0.0,
          top: top ?? 0.0,
          opacity: opacity,
          showDots: showDots,
          onTap: {
            showDots.toggle()
            opacity = 1.0
          },
          onPanStart: { value in
            startDx = right ? value.location.x : value.location.x
            opacity = 1.0
            showDots = true
          },
          onPanEnd: { value in
            let size = geometry.size
            if !right && (startDx < size.width / 2.0) && updateDx < size.width / 2.0 {
              right = false
              left = 30.0
            } else {
              right = true
              left = size.width / 1.3
            }
            if updateDy! < 60 {
              top = 60
            }
            if updateDy! > (size.height - 220) {
              top = size.height - 220
            }
               position = CGPoint(x: left, y: top)
 
          },
          onPanUpdate: { value in
            let size = geometry.size
            updateDx = right ? value.location.x : value.location.x
            opacity = 1.0
            showDots = true
            top = top! + value.translation.height
            left = left! + value.translation.width
            updateDy = top
            if value.location.x < size.width / 2.0 {
              right = false
            }
            if value.location.x > size.width / 2.0 {
              right = true
            }
                position = CGPoint(x: left, y: top)

          }
        )

        if dialogIndex == 0 && showDots {
          WalletDialog(dialogIndex: $dialogIndex)
        }
        if dialogIndex == 1 && showDots {
          ProfileDialog(dialogIndex: $dialogIndex)
        }
        if dialogIndex == 2 && showDots {
          NotificationsDialog(dialogIndex: $dialogIndex)
        }
        if dialogIndex == 3 && showDots {
          MessageGroupDialog(dialogIndex: $dialogIndex)
        }
        if dialogIndex == 4 && showDots {
          CampaignsDialog(dialogIndex: $dialogIndex)
        }
        if dialogIndex == 5 && showDots {
        }
        if dialogIndex == 6 && showDots {
          SignOutDialog(dialogIndex: $dialogIndex)
        }
      }.onAppear {
        initState()
      }
      .environmentObject(languageController)
      .environmentObject(themeManager)
      .environmentObject(animatedWidgetController)
    }
  }
}
struct AnimatedView: View {
  var left: CGFloat
  var top: CGFloat
  var opacity: Double
  var showDots: Bool
  var onTap: () -> Void
  var onPanStart: (DragGesture.Value) -> Void
  var onPanEnd: (DragGesture.Value) -> Void
  var onPanUpdate: (DragGesture.Value) -> Void

  var body: some View {
    AsyncImage(
      url: URL(
        string:
          "https://res.cloudinary.com/sifca/image/upload/v1703254271/flutter-mobile-widget/sifca-app-icon.png"
      )!
    ) { phase in
      ((phase.image) ?? Image(systemName: ""))
        .resizable()
        .frame(width: 80, height: 80)
        .clipShape(Circle())
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .gesture(
          TapGesture()
            .onEnded {
              onTap()
            }
        )
        .gesture(
          DragGesture()
            .onChanged { value in
              onPanUpdate(value)
            }
            .onEnded { value in
              onPanEnd(value)
            }
            .onEnded { value in
              onPanEnd(value)
            }
        )
        .position(x: left, y: top)

    }
  }
}
