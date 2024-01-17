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
    position = CGPoint(x: left ?? 0, y: top ?? 0)
  }

  public init() {
    verticalCenter = 0
    position = CGPoint(
      x: UIScreen.main.bounds.size.width / 1.3, y: UIScreen.main.bounds.size.height / 1.8)
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
          onEnded: { value in
            let horizontalCenter = UIScreen.main.bounds.width / 2
            opacity = 1.0
            showDots = true
            if !right && (startDx < horizontalCenter) && updateDx < horizontalCenter {
              right = false
              left = 30.0
            } else {
              right = true
              left = UIScreen.main.bounds.width - 80.0
            }
            if updateDy! < 60 {
              top = 60
            }
            if updateDy! > (UIScreen.main.bounds.height - 220) {
              top = UIScreen.main.bounds.height - 220
            }
            position = CGPoint(x: left ?? 0, y: top ?? 0)
          },
          onChanged: { value in
            let horizontalCenter = UIScreen.main.bounds.width / 2
            startDx = value.startLocation.x
            updateDx = value.location.x
            opacity = 1.0
            showDots = true
            top = top! + value.translation.height
            left = left! + value.translation.width
            position = CGPoint(x: left ?? 0, y: top ?? 0)
            updateDy = top

            if (left ?? 0) < horizontalCenter {
              right = false
 
            }
            if (left ?? 0) > horizontalCenter {
              right = true
 
            }
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
  var onEnded: (DragGesture.Value) -> Void
  var onChanged: (DragGesture.Value) -> Void

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
        // .gesture(
        //   TapGesture()
        //     .onEnded {
        //       onTap()
        //     }
        // )
        .gesture(
          DragGesture()
            .onChanged { value in
              onChanged(value)
            }

            .onEnded { value in
              onEnded(value)
            }
        )
        .position(x: left, y: top)

    }
  }
}
