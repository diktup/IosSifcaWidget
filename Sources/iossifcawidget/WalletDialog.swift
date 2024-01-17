//
//  SifcaWidgetWalletDialog.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 5/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct WalletDialog: View {
    @Binding var dialogIndex: Int

    let subTabList = ["Activities", "Redeem", "Transactions"]
    let tabList = ["Wallet", "Reputation"]
    @State public var subTabIndex = 0
    @State public var tabIndex = 0

    let activitiesList = [
        ["name": "Share Facebok Product", "body": "Remaining time 09:03:32"],
        ["name": "Product Review", "body": "One time"],
        ["name": "Share Blog On Facebook", "body": "Every 10 Hours"],
    ]

    let transactionList = [
        ["name": "Reputation lost", "body": "Tue, 12/26/2023"],
        ["name": "Reward points", "body": "Mond, 01/01/2024"],
        ["name": "Reputation lost", "body": "Tue, 12/26/2023"],
        ["name": "Reward points", "body": "Mond, 01/01/2024"],
        ["name": "Reputation lost", "body": "Tue, 12/26/2023"],
        ["name": "Reward points", "body": "Mond, 01/01/2024"],
    ]

    let redeemList = [
        "🌐 Exclusive Access and Membership Levels: Level up your loyalty experience! Unlock exclusive perks, early access to sales, and more by reaching higher membership tiers.",
        "🎁 Free Products or Services: Treat yourself! Redeem your points for complimentary products or services. Choose from a selection of items or experiences on us.",
        "🌟 Discounts on Future Purchases: Enjoy exclusive discounts on your next shopping spree. Your loyalty points can be redeemed for instant savings at checkout.",
        "💳 Gift Cards or Vouchers: Convert your loyalty points into gift cards or vouchers, giving you the flexibility to use them whenever you'd like.",
    ]
       


   public  var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(tabList[tabIndex])
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

                HStack(spacing: 8.0) {
                    Button(action: {
                        tabIndex = 0
                    }) {
                        Text("Wallet")
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .background(tabIndex == 0 ? Color(hex: 0x299CDB) : .gray)
                            .foregroundColor(.white)
                            .cornerRadius(16.0)
                    }
                    Button(action: {
                        tabIndex = 1
                    }) {
                        Text("Reputation")
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .background(tabIndex == 1 ? Color(hex: 0x299CDB) : .gray)
                            .foregroundColor(.white)
                            .cornerRadius(16.0)
                    }
                }

                HStack(alignment: /*@START_MENU_TOKEN@*/ .center /*@END_MENU_TOKEN@*/) {
                    Spacer()
                    Text("3224")
                        .font(.title)

                 GIFImageWithURL(url: URL(string: "https://res.cloudinary.com/sifca/image/upload/v1703254271/flutter-mobile-widget/lord-icon-coin.gif")!)
                
     .frame(width: 30, height: 30)
                    Spacer()
                }
                Text("Let's explore how you can earn the coins and where to spend them!")

                    .font(.body)

                    .multilineTextAlignment(.center)
                HStack(spacing: 8.0) {
                    Button(action: {
                        subTabIndex = 0
                    }) {
                        Text("Activities")
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .background(subTabIndex == 0 ? .gray.opacity(0.6) : .white.opacity(0))
                            .foregroundColor(.black)
                            .cornerRadius(16.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16.0)
                                    .stroke(Color.gray, lineWidth: 1.0))
                    }
                    Button(action: {
                        subTabIndex = 1
                    }) {
                        Text("Redeem")
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .background(subTabIndex == 1 ? .gray.opacity(0.6) : .white.opacity(0))
                            .foregroundColor(.black)
                            .cornerRadius(16.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16.0)
                                    .stroke(Color.gray, lineWidth: 1.0))
                    }
                    Button(action: {
                        subTabIndex = 2
                    }) {
                        Text("Transactions")
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .background(subTabIndex == 2 ? .gray.opacity(0.6) : .white.opacity(0))
                            .foregroundColor(.black)
                            .cornerRadius(16.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16.0)
                                    .stroke(Color.gray, lineWidth: 1.0))
                    }
                }

                if subTabIndex == 0 {
                    widget1()
                }
                if subTabIndex == 1 {
                    widget2()
                }
                if subTabIndex == 2 {
                    widget3()
                }

                // .padding(.vertical, -16)
            }
        }
        .padding(16.0)
        .background(Color.white)
            .cornerRadius(16.0)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)

            .padding(16.0)
    }

    func widget1() -> some View {
        ForEach(Array(activitiesList.enumerated()), id: \.element) { index, activity in

            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16.0)
                        .fill(Color(index == 0 ? .yellow : index == 1 ? .green : .red).opacity(0.1))
                        .frame(width: 50.0, height: 50.0)

                    Image(systemName: index == 0 ? "clock" : index == 1 ? "checkmark" : "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(
                            index == 0 ? .yellow : index == 1 ? .green : .red
                        )
                        .frame(width: 18.0, height: 18.0)
                }

                Spacer().frame(width: 8.0)
                VStack(alignment: .leading) {
                    Text(activity["name"] ?? "No Name")
                        .font(.body)
                    Spacer().frame(height: 4.0)
                    Text(activity["body"] ?? "No Name")
                        .font(.caption)
                }
                Spacer()
            }
        }
    }

    func widget2() -> some View {
        ForEach(0 ..< redeemList.count) { index in

            HStack(alignment: .top) {
                ZStack {
                    RoundedRectangle(cornerRadius: 100.0)
                        .fill(.green)
                        .frame(width: 26.0, height: 26.0)

                    Image(systemName: "checkmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 18.0, height: 16.0)
                }

                Spacer().frame(width: 8.0)
                Text(redeemList[index]).font(.body)

                Spacer()
            }
        }
    }

    func widget3() -> some View {
        ForEach(Array(transactionList.enumerated()), id: \.element) { index, transaction in

            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16.0)
                        .fill(Color(index.isMultiple(of: 2) ? .red : .green).opacity(0.1))
                        .frame(width: 50.0, height: 50.0)

                    Image(systemName: index.isMultiple(of: 2) ? "arrow.down" : "arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(
                            index.isMultiple(of: 2) ? .red : .green
                        )
                        .frame(width: 18.0, height: 18.0)
                }

                Spacer().frame(width: 8.0)
                VStack(alignment: .leading) {
                    Text(transaction["name"] ?? "No Name")
                        .font(.body)
                    Spacer().frame(height: 4.0)
                    Text(transaction["body"] ?? "No Name")
                        .font(.caption)
                }

                Spacer()
                HStack {
                    Text("\(Int.random(in: 0 ..< 999))")
                        .font(.headline)
                    Image("lord-icon-reputation")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                Spacer().frame(width: 8.0)
                HStack {
                    Text("\(Int.random(in: 0 ..< 999))")
                        .font(.headline)
                    GIFImage(name: "lord-icon-coin")
                        .frame(width: 30, height: 30)
                }
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            }
        }
    }
}
 
