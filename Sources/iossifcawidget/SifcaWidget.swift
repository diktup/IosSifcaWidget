//
//  ContentView.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 4/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct SifcaWidget: View {
    @StateObject public var animatedWidgetController = AnimatedWidgetController()
    @StateObject public var languageController = LanguageController()
    @StateObject public var themeManager = ThemeManager()
    @State public var verticalCenter: CGFloat = 0
    @State public var position = CGPoint(x: 100, y: 100)
    @State public var isRight = false
    @State public var showDots = true
    @State public var dialogIndex = -1

    
    public var body: some View {
        ZStack {
            if showDots {
                WidgetDots(
                    position: $position,
                    isRight: $isRight,
                    showDots: $showDots,
                    dialogIndex: $dialogIndex
                )
            }

            Image("sifca-app-icon")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
                .position(position)
                .gesture(
                    TapGesture()
                        .onEnded {
                            showDots.toggle()
                        }
                )
                .gesture(
                    DragGesture()
                        .onChanged {
                            value in self.position = value.location
                            let maxY = UIScreen.main.bounds.height - (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0)
                            let minY = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
                            let newVerticalCenter = min(max(value.location.y, minY), maxY)
                            verticalCenter = newVerticalCenter
                            let horizontalCenter = UIScreen.main.bounds.width / 2
                            isRight = value.location.x > horizontalCenter
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
        }.environmentObject(languageController)
            .environmentObject(themeManager)
            .environmentObject(animatedWidgetController)
    }
}