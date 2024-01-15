//
//  CampaignsDialog.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 10/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct CampaignsDialog: View {
    @Binding var dialogIndex: Int
    @State private var searchText = ""
    @State var isPopUpVisible = false

    let campaignList = [
        [
            "name": "Assessing Products Recommendations and Satisfaction",
            "questions": [
                "In what ways has our wholesaling loyalty app positively impacted your overall business operations and bottom line?",
                "I consistently leverage the loyalty rewards in almost every purchasing decision, finding it a valuable incentive.",
                "Occasionally, I use the loyalty rewards when making substantial purchases through your wholesaling app.",
                "Rarely do I utilize the loyalty rewards, as they haven't strongly influenced my purchasing decisions.",
                "I haven't used the loyalty rewards yet; I might need more information on how they work and their benefits.",
            ],
        ],
        [
            "name": "Wahoo!! it monday reward!",
            "questions": [
                "In what ways has our wholesaling loyalty app positively impacted your overall business operations and bottom line?",
                "I consistently leverage the loyalty rewards in almost every purchasing decision, finding it a valuable incentive.",
                "Occasionally, I use the loyalty rewards when making substantial purchases through your wholesaling app.",
                "Rarely do I utilize the loyalty rewards, as they haven't strongly influenced my purchasing decisions.",
                "I haven't used the loyalty rewards yet; I might need more information on how they work and their benefits.",
            ],
        ],
        [
            "name": "In case you want to increase your level! try this campaign!",
            "questions": [
                "In what ways has our wholesaling loyalty app positively impacted your overall business operations and bottom line?",
                "I consistently leverage the loyalty rewards in almost every purchasing decision, finding it a valuable incentive.",
                "Occasionally, I use the loyalty rewards when making substantial purchases through your wholesaling app.",
                "Rarely do I utilize the loyalty rewards, as they haven't strongly influenced my purchasing decisions.",
                "I haven't used the loyalty rewards yet; I might need more information on how they work and their benefits.",
            ],
        ],
    ]

    public var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16.0) {
                    HStack {
                        Text("Campaigns")
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
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 12.0, height: 12.0)
                                .foregroundColor(.white)
                                .padding(8.0)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.clear)
                                )

                            Spacer()

                            TextField("Search Campaign", text: $searchText)
                                .foregroundColor(.primary)
                                .font(.body)
                                .padding(8.0)
                                .background(Color.clear)
                                .padding(.vertical, 10)

                            Spacer()

                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 8.0, height: 8.0)
                                .foregroundColor(.black)
                                .padding(8.0)
                                .background(Color.gray.opacity(0.4))
                                .clipShape(Circle())
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.clear)
                                )
                        }
                    }
                    .frame(height: 40.0)
                    .padding(8.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                    Text("23 campaings including 4 extra with Gold Level points.")
                        .font(.system(size: 14.0))
                        .foregroundColor(.black.opacity(0.6))
                        .multilineTextAlignment(.center)
                    ForEach(campaignList.indices, id: \.self) { index in

                        HStack(alignment: .top) {
                            Image("prime-bulk-app-icon")
                                .resizable()
                                .frame(width: 50.0, height: 50.0)
                                .cornerRadius(16.0)

                            Spacer().frame(width: 8.0)
                            VStack(alignment: .leading) {
                                Text(campaignList[index]["name"] as? String ?? "")
                                    .font(.body)
                                Spacer().frame(height: 4.0)
                                Text("Campaign ends in 02:21:12")
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
                        }.onTapGesture {
                            isPopUpVisible.toggle()
                        }
                    }
                }
            }
            .padding(16.0)
            .background(Color.white)
            .cornerRadius(16.0)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
            .padding(16.0)
            if(isPopUpVisible){
                CampaignQuestionsDialog(isPopUpVisible: $isPopUpVisible)

            }
        }
        
    }
}
