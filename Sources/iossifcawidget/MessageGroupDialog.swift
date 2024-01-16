//
//  WidgetMessageGroupDialog.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 10/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct MessageGroupDialog: View {
    @Binding var dialogIndex: Int
 
    @State public var checkMessage = ""
    @State public var messageList: [String] = [
        "Hi there! I'm excited about your loyalty program. How does it work?",
        "Welcome! Our loyalty program rewards you for every purchase. Earn points and redeem them for discounts or exclusive offers.",
        "Sounds great! How do I sign up?",
        "Simply download our App create an account, and start shopping. Your points will automatically accumulate with each purchase.",
        "Awesome! Any special perks for longtime members?",
        "Absolutely! Longtime members enjoy exclusive discounts, early access to sales, and special birthday rewards.",
        "That's fantastic! I made a purchase yesterday but didn't see any points added. Can you help?",
        "Of course! Could you provide your order number? I'll check your account and ensure you get your points.",
        "Sure, my order number is #123456.",
        "Thank you. I've credited your account with the points. They should reflect shortly. Anything else I can assist you with?",
        "Thanks for the quick help! One more thing – how can I track my points?",
        "You can view your points balance in the App's loyalty section. It's updated in real-time, so you always know your current rewards.",
        "Got it, thanks! Looking forward to more shopping and rewards.",
        "We're thrilled to have you as part of our loyalty program! Happy shopping, and feel free to reach out if you have any more questions.",
    ]
   

   public  var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Chat")
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

            HStack {
                Image("prime-bulk-app-icon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .padding(.trailing, 8.0)

                VStack(alignment: .leading, spacing: 4.0) {
                    Text("Prime Bulk")
                        .font(.body)
                        .fontWeight(.medium)
                        .lineLimit(1)
                    Text("Online")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }

            ScrollView { ForEach(Array(messageList.enumerated()), id: \.element) { index, message in
                let isLeading = index % 2 != 0

                HStack {
                    Spacer()
                    Text(message)
                        .padding(8.0)
                        .foregroundColor(isLeading ? .white : Color.black)
                        .background(
                            RoundedRectangle(cornerRadius: 8.0, corners: isLeading ? [.topRight, .bottomRight] : [.topLeft, .bottomLeft])
                                .fill(isLeading ? Color.blue : Color.gray.opacity(0.1))
                        )
                        .frame(maxWidth: .infinity, alignment: isLeading ? .leading : .trailing)
                    Spacer()
                }
            }}.frame(maxHeight: .infinity)

            HStack {
                Button(action: {
                }) {
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                .padding(.trailing, 8.0)

                TextField("Type your message", text: $checkMessage)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(16.0)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.gray, lineWidth: 0.8)
                    )

                Button(action: {
                    messageList.append(checkMessage)
                    checkMessage = ""
                }) {
                    Image(systemName: "location.fill")
                        .frame(width: 30, height: 30)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
        .padding(16.0)
        .background(Color.white)
        .cornerRadius(16.0)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        
        .frame(maxHeight: UIScreen.main.bounds.height / 1.4)
        .padding(16.0)
    }
}
