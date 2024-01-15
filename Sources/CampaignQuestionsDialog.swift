//
//  CampaignQuestionsDialog.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 11/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct CampaignQuestionsDialog: View {
    @Binding var isPopUpVisible: Bool

    @State public var searchText = ""
    @State public var widgetIndex = 0
    @State public var question2 = 0
    @State public var question1: Int? = nil

    let questionList = [
        "Poor",
        "Fair",
        "Average",
        "Good",
        "Excellent",
    ]
    let campaignList = [
        [
            "name": "Assessing Products Recommendations and Satisfaction",
            "questions": [
                "I consistently leverage the loyalty rewards in almost every purchasing decision, finding it a valuable incentive.",
                "Occasionally, I use the loyalty rewards when making substantial purchases through your wholesaling app.",
                "Rarely do I utilize the loyalty rewards, as they haven't strongly influenced my purchasing decisions.",
                "I haven't used the loyalty rewards yet; I might need more information on how they work and their benefits.",
            ],
        ],
        [
            "name": "Wahoo!! it's monday reward!",
            "questions": [
                "I haven't used the loyalty rewards yet; I might need more information on how they work and their benefits.",
                "Rarely do I utilize the loyalty rewards, as they haven't strongly influenced my purchasing decisions.",
                "I consistently leverage the loyalty rewards in almost every purchasing decision, finding it a valuable incentive.",
                "Occasionally, I use the loyalty rewards when making substantial purchases through your wholesaling app.",

            ],
        ],
        [
            "name": "In case you want to increase your level! try this campaign!",
            "questions": [
                "Occasionally, I use the loyalty rewards when making substantial purchases through your wholesaling app.",
                "I consistently leverage the loyalty rewards in almost every purchasing decision, finding it a valuable incentive.",
                "I haven't used the loyalty rewards yet; I might need more information on how they work and their benefits.",
                "Rarely do I utilize the loyalty rewards, as they haven't strongly influenced my purchasing decisions.",
            ],
        ],
    ]
        public init() {} // Add a public initializer if needed


   public  var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("\(widgetIndex + 1)/3")
                        .font(.body)
                        .fontWeight(.medium)
                        .padding(8)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
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

                Text(campaignList[widgetIndex]["name"] as! String)
                    .font(.system(size: 30.0))
                    .fontWeight( /*@START_MENU_TOKEN@*/ .bold /*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)

                if widgetIndex == 0 {
                    widget1()
                }
                if widgetIndex == 1 {
                    widget2()
                }
                if widgetIndex == 2 {
                    widget3()
                }
            }
        }
        .padding(16.0)
        .background(Color.white)
        .cornerRadius(16.0)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .padding(16.0)
    }

    func widget1() -> some View {
        VStack(alignment: .center, spacing: 16) {
            ForEach(
                Array(campaignList[widgetIndex]["questions"] as? [String] ?? []).enumerated().map { $0 },
                id: \.element
            ) { index, question in

                HStack(alignment: .top) {
                    RadioButton(selectedIndex: $question1, index: index, color: Color.blue) {
                        question1 = index
                    }

                    Spacer().frame(width: 8.0)
                    Text(question).font(.body)
                }
            }
            HStack {
                Button(action: {
                    isPopUpVisible.toggle()
                }) {
                    Text("Quit")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .foregroundColor(Color(hex: 0x299CDB))
                        .cornerRadius(16.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(Color(hex: 0x299CDB), lineWidth: 1.0))
                }
                Button(action: {
                    widgetIndex = 1
                }) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color(hex: 0x299CDB))
                        .foregroundColor(.white)
                        .cornerRadius(16.0)
                }
            }
        }
    }

    func widget2() -> some View {
        GeometryReader { geometry in

            var width = CGFloat.zero
            var height = CGFloat.zero
            VStack(alignment: .center, spacing: 16) {
                ZStack(alignment: .topLeading) {
                    ForEach(Array(self.questionList.enumerated()), id: \.element) { index, question in

                        Button(action: {
                            question2 = index
                        }) {
                            Text(questionList[index])
                                .font(.system(size: question2 == index ? 30.0 : 20.0))
                                .fontWeight(question2 == index ? .bold : .medium)
                                .padding(16.0)
                                .background(Color.blue.opacity(0.08))
                                .cornerRadius(100)
                                .foregroundColor( /*@START_MENU_TOKEN@*/ .blue /*@END_MENU_TOKEN@*/)
                        }
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if abs(width - d.width) > geometry.size.width {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if question == self.questionList.last! {
                                width = 0
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: { _ in
                            let result = height
                            if question == self.questionList.last! {
                                height = 0
                            }
                            return result
                        })
                    }
                }
                
                HStack {
                    Button(action: {
                        widgetIndex = 0
                    }) {
                        Text("Previous")
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .foregroundColor(Color(hex: 0x299CDB))
                            .cornerRadius(16.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(Color(hex: 0x299CDB), lineWidth: 1.0))
                    }
                    Button(action: {
                        widgetIndex = 2
                    }) {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color(hex: 0x299CDB))
                            .foregroundColor(.white)
                            .cornerRadius(16.0)
                    }
                }
            }
        }
    }

    func widget3() -> some View {
        VStack(alignment: .center, spacing: 16) {
            TextField("Type your message ..", text: $searchText)
                .padding()
                .frame(minHeight: 100.0)
                .background(
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(
                            searchText.isEmpty
                                ? Color.gray
                                : searchText.count < 4
                                ? Color.red
                                : searchText.count < 8
                                ? Color.yellow : searchText.count < 10 ? Color.orange : Color.green,
                            lineWidth: 2.0)
                )
                .foregroundColor(.black)
            HStack(alignment: .lastTextBaseline) {
                Text("Your score is")
                    .font(.body)
                    .fontWeight( /*@START_MENU_TOKEN@*/ .bold /*@END_MENU_TOKEN@*/)
                    .foregroundColor(
                        searchText.isEmpty
                            ? Color.gray
                            : searchText.count < 4
                            ? Color.red
                            : searchText.count < 8
                            ? Color.yellow : searchText.count < 10 ? Color.orange : Color.green
                    )
                Text(
                    searchText.isEmpty
                        ? "1 / 5"
                        : searchText.count < 4
                        ? "2 / 5"
                        : searchText.count < 8
                        ? "3 / 5"
                        : searchText.count < 10
                        ? "4 / 5"
                        : "5 / 5"
                )
                .font(.system(size: 30.0))
                .fontWeight( /*@START_MENU_TOKEN@*/ .bold /*@END_MENU_TOKEN@*/)
                .foregroundColor(
                    searchText.isEmpty
                        ? Color.gray
                        : searchText.count < 4
                        ? Color.red
                        : searchText.count < 8
                        ? Color.yellow : searchText.count < 10 ? Color.orange : Color.green
                )
            }
            HStack {
                Button(action: {
                    widgetIndex = 1
                }) {
                    Text("Previous")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)

                        .foregroundColor(Color(hex: 0x299CDB))
                        .cornerRadius(16.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(Color(hex: 0x299CDB), lineWidth: 1.0))
                }
                Button(action: {
                    isPopUpVisible.toggle()
                }) {
                    Text("Confirm")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color(hex: 0x299CDB))
                        .foregroundColor(.white)
                        .cornerRadius(16.0)
                }
            }
        }
    }
}
