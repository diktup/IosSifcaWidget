//
//  SifcaWidgetEditProfileDialog.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 8/1/2024.
//

import SwiftUI
import SwiftUIGIF

public struct EditProfileDialog: View {
    
    @Binding var isPopUpVisible: Bool

    
    @StateObject public var languageController = LanguageController()
    @StateObject public var themeManager = ThemeManager()
    @State public var localeRadioIndex: Int? = nil
    @State public var themeRadioIndex: Int? = nil
    @State public var genderRadioIndex: Int? = 0
    @Environment(\.colorScheme) var colorScheme
    @State public var checkFirstname = ""
    @State public var checkLastname = ""
    @State public var tabIndex = 0
    let appColor = Color.blue
    var themeList = ["dark", "light", "system", "sameAsTheMainApp"]
    var localeList = ["english", "french", "arabic"]
   
   

   public  var body: some View {
        GeometryReader { geometry in

            var width = CGFloat.zero
            var height = CGFloat.zero

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(Localizer.localizedString("editProfile", controller: languageController))
                            .font(themeManager.bodyFont)
                            .foregroundColor(themeManager.textColor)

                        Spacer()

                        Button(action: {
                            isPopUpVisible.toggle()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(themeManager.textColor)
                                .frame(height: 50)
                        }
                    }

                    Divider()

                    HStack(spacing: 8.0) {
                        Button(action: {
                            tabIndex = 0
                        }) {
                            Text(Localizer.localizedString("informations", controller: languageController))
                                .padding(8.0)
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(tabIndex == 0 ? Color(hex: 0x299CDB) : .gray)
                                .foregroundColor(.white)
                                .cornerRadius(16.0)
                        }
                        Button(action: {
                            tabIndex = 1
                        }) {
                            Text(Localizer.localizedString("emailAddress", controller: languageController))
                                .padding(8.0)
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(tabIndex == 1 ? Color(hex: 0x299CDB) : .gray)
                                .foregroundColor(.white)
                                .cornerRadius(16.0)
                        }
                        Button(action: {
                            tabIndex = 2
                        }) {
                            Text(Localizer.localizedString("password", controller: languageController))
                                .padding(8.0)
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(tabIndex == 2 ? Color(hex: 0x299CDB) : .gray)
                                .foregroundColor(.white)
                                .cornerRadius(16.0)
                        }
                    }
                    HStack {
                        Spacer()

                        AsyncImage(
                            url: URL(
                                string:
                                "https://res.cloudinary.com/sifca/image/upload/f_auto,h_400/temporary/1679905480_chris-evans-getty"
                            )!
                        ) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case let .success(image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80.0, height: 80.0)
                                    .clipShape(Circle())
                            case .failure:
                                Image(systemName: "exclamationmark.triangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80.0, height: 80.0) // Set your desired size
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text(Localizer.localizedString("addPhoto", controller: languageController))
                            .multilineTextAlignment(.center)
                            .font(themeManager.bodyFont)
                            .foregroundColor(appColor)

                        Spacer()
                    }

                    Text(Localizer.localizedString("firstname", controller: languageController))
                        .font(themeManager.bodyFont)
                        .foregroundColor(themeManager.textColor)

                    TextField("", text: $checkFirstname)
                        .modifier(
                            TextFieldPlaceholderStyle(
                                showPlaceHolder: checkFirstname.isEmpty,
                                placeholder: Localizer.localizedString("firstname", controller: languageController), placeholderColor: themeManager.textColor)
                        )
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke(Color.gray, lineWidth: 0.4)
                        )

                        .font(themeManager.bodyFont)
                        .foregroundColor(themeManager.textColor)

                    Text(Localizer.localizedString("lastname", controller: languageController))

                        .font(themeManager.bodyFont)
                        .foregroundColor(themeManager.textColor)

                    TextField("", text: $checkLastname)
                        .modifier(
                            TextFieldPlaceholderStyle(
                                showPlaceHolder: checkLastname.isEmpty,
                                placeholder: Localizer.localizedString("lastname", controller: languageController), placeholderColor: themeManager.textColor)
                        )
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke(Color.gray, lineWidth: 0.4)
                        )
                        .font(themeManager.bodyFont)
                        .foregroundColor(themeManager.textColor)
                    Text(Localizer.localizedString("dateOfBirth", controller: languageController))

                        .font(themeManager.bodyFont)
                        .foregroundColor(themeManager.textColor)
                    Button(action: {}) {
                        HStack {
                            Text("Tue, 1/9/2024")
                                .font(themeManager.bodyFont)
                                .foregroundColor(themeManager.textColor)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.secondary)
                                .imageScale(.small)
                        }
                        .padding(.horizontal, 16.0)
                        .frame(height: 46.0)
                        .background(
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke(Color.gray, lineWidth: 0.4)
                        )
                    }

                    Text(Localizer.localizedString("gender", controller: languageController))
                        .font(themeManager.bodyFont)
                        .foregroundColor(themeManager.textColor)

                    HStack(spacing: 16.0) {
                        RadioButton(selectedIndex: $genderRadioIndex, index: 0, color: appColor) {
                            genderRadioIndex = 0
                        }
                        Text(Localizer.localizedString("male", controller: languageController))
                            .font(themeManager.bodyFont)
                            .foregroundColor(themeManager.textColor)
                            .font(.body)
                        RadioButton(selectedIndex: $genderRadioIndex, index: 1, color: appColor) {
                            genderRadioIndex = 1
                        }
                        Text(Localizer.localizedString("female", controller: languageController))
                            .font(.body)
                            .font(themeManager.bodyFont)
                            .foregroundColor(themeManager.textColor)
                    }
                    Text(Localizer.localizedString("theme", controller: languageController))
                        .font(themeManager.bodyFont)
                        .foregroundColor(themeManager.textColor)

                    ZStack(alignment: .topLeading) {
                        ForEach(Array(self.themeList.enumerated()), id: \.element) { index, theme in

                            HStack(spacing: 16.0) {
                                RadioButton(selectedIndex: $themeRadioIndex, index: index, color: appColor) {
                                    if index == 0 {
                                        themeManager.isDarkMode = true
                                        themeManager.isSystem = false
                                        themeManager.isMainApp = false
                                    }
                                    if index == 1 {
                                        themeManager.isDarkMode = false
                                        themeManager.isSystem = false
                                        themeManager.isMainApp = false
                                    }
                                    if index == 2 {
                                        themeManager.isDarkMode = colorScheme == .dark
                                        themeManager.isSystem = false
                                        themeManager.isMainApp = true
                                    }
                                    if index == 3 {
                                        themeManager.isDarkMode = colorScheme == .dark
                                        themeManager.isSystem = false
                                        themeManager.isMainApp = true
                                    }
                                    themeRadioIndex = index
                                }
                                Text(Localizer.localizedString(theme, controller: languageController))
                                    .font(themeManager.bodyFont)
                                    .foregroundColor(themeManager.textColor)
                            }
                            .padding([.horizontal, .vertical], 4)
                            .alignmentGuide(.leading, computeValue: { d in
                                if abs(width - d.width) > geometry.size.width {
                                    width = 0
                                    height -= d.height
                                }
                                let result = width
                                if theme == self.themeList.last! {
                                    width = 0
                                } else {
                                    width -= d.width
                                }
                                return result
                            })
                            .alignmentGuide(.top, computeValue: { _ in
                                let result = height
                                if theme == self.themeList.last! {
                                    height = 0
                                }
                                return result
                            })
                        }
                    }

                    Text(Localizer.localizedString("languages", controller: languageController))
                        .font(themeManager.bodyFont)
                        .foregroundColor(themeManager.textColor)

                    ZStack(alignment: .topLeading) {
                        ForEach(Array(self.localeList.enumerated()), id: \.element) { index, locale in

                            HStack(spacing: 16.0) {
                                RadioButton(selectedIndex: $localeRadioIndex, index: index, color: appColor) {
                                    if index == 0 {
                                        Localizer.setLanguage("en", controller: languageController)
                                    }
                                    if index == 1 {
                                        Localizer.setLanguage("fr", controller: languageController)
                                    }
                                    if index == 2 {
                                        Localizer.setLanguage("ar", controller: languageController)
                                    }
                                    localeRadioIndex = index
                                }
                                Text(Localizer.localizedString(locale, controller: languageController))
                                    .font(themeManager.bodyFont)
                                    .foregroundColor(themeManager.textColor)
                            }
                            .padding([.horizontal, .vertical], 4)
                            .alignmentGuide(.leading, computeValue: { d in
                                if abs(width - d.width) > geometry.size.width {
                                    width = 0
                                    height -= d.height
                                }
                                let result = width
                                if locale == self.localeList.last! {
                                    width = 0
                                } else {
                                    width -= d.width
                                }
                                return result
                            })
                            .alignmentGuide(.top, computeValue: { _ in
                                let result = height
                                if locale == self.localeList.last! {
                                    height = 0
                                }
                                return result
                            })
                        }
                    }

                    Button(action: {
                    }) {
                        Text(Localizer.localizedString("save", controller: languageController))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color(hex: 0x299CDB))
                            .foregroundColor(.white)
                            .cornerRadius(16.0)
                    }
                }
            }
            .padding(16.0)
            .background(themeManager.backgroundColor)
            .cornerRadius(16.0)
            .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 0)
            .padding(16.0)
            .environment(\.layoutDirection, languageController.layoutDirection)
            .onAppear {
                themeRadioIndex = themeManager.isDarkMode ? 0 : 1
                localeRadioIndex = languageController.currentLanguage == "en" ? 0 : languageController.currentLanguage == "fr" ? 1 : 2
            }
        }
    }
}
