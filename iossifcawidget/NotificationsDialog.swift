//
//  SifcaWidgetNotificationsDialog.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 10/1/2024.
//

import SwiftUI
import SwiftUIGIF

struct NotificationsDialog: View {
    @Binding var dialogIndex: Int

    let notificationList = [
        ["name": "Welcome to Prime Bulk!", "body": "Thank you for joining us. Enjoy exclusive perks and rewards with every purchase."],
        ["name": "Double Points Weekend!", "body": "Shop this weekend and earn double points on all purchases. Don't miss out on the bonus rewards!"],
        ["name": "Exclusive Offer for Gold Members", "body": "As a Gold member, unlock a special 20% discount on your next purchase. Limited-time offer, redeem now!"],
        ["name": "Your Points Balance", "body": "Check out your current points balance. You're just a few points away from unlocking your next rewards"],
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Notifications")
                        .font(.system(size: 18.0))

                    Spacer()

                    Button(action: {
                        dialogIndex = -1
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.secondary)
                            .frame(height: 50)
                    }
                }

                Divider()

                HStack(alignment: /*@START_MENU_TOKEN@*/ .center /*@END_MENU_TOKEN@*/) {
                    Spacer()
                    GIFImage(name: "lord-icon-walkie-talkie")
                        .frame(width: 100.0, height: 100.0)
                    Spacer()
                }

                ForEach(Array(notificationList.enumerated()), id: \.element) { _, notification in

                    HStack {
                        Image("prime-bulk-app-icon")
                            .resizable()
                            .frame(width: 50.0, height: 50.0)
                            .cornerRadius(16.0)

                        Spacer().frame(width: 8.0)
                        VStack(alignment: .leading) {
                            Text(notification["name"] ?? "No Name")
                                .font(.body)
                            Spacer().frame(height: 4.0)
                            Text(notification["body"] ?? "No Name")
                                .font(.caption)
                        }
                        Spacer()
                    }
                }
            }
            .padding(16.0)
            .background(Color.white)
                .cornerRadius(16.0)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)

                .padding(16.0)
        }
    }
}
