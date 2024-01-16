//
//  SifcaWidgetProfileDialog.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 5/1/2024.
//

import SwiftUI

public struct ProfileDialog: View {
    @Binding var dialogIndex: Int
    @State var isPopUpVisible = false

    public init() {} // Add a public initializer if needed

   public  var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Profile")
                            .font(.title2)

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
                        AsyncImage(url: URL(string: "https://res.cloudinary.com/sifca/image/upload/f_auto,h_400/temporary/1679905480_chris-evans-getty")!) { phase in
                            ((phase.image) ?? Image(systemName: ""))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50.0, height: 50.0)
                                .clipShape(Circle())
                        }

                        VStack(
                            alignment: .leading,
                            spacing: 4.0

                        ) {
                            Text("John Doe")
                                .font(.title2)

                            Text("johndoe@primebulk.com")
                                .font(.system(size: 14.0))
                                .fontWeight(.medium)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(16.0)
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(16.0)

                    Button(action: {
                        isPopUpVisible.toggle()
                    }) {
                        Text("Edit profile")
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color(hex: 0x299CDB))
                            .foregroundColor(.white)
                            .cornerRadius(16.0)
                    }
                    VStack(alignment: .leading) {
                        Text("Complete your profile")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer().frame(height: 8.0)
                        Text("Complete your profile to earn reputation points, which helps us recommend the best campaigns, partners, and more for you.")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                    .padding(16.0)
                    .background(Color.yellow)
                    .cornerRadius(16.0)
                    VStack(alignment: .leading) {
                        Text("Profile infos")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.primary)
                        Spacer().frame(height: 16.0)
                        HStack {
                            Text("Full name")

                                .font(.system(size: 16.0))
                                .lineLimit(1)
                                .truncationMode(.tail)

                            Spacer()

                            Text("John doe")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        Spacer().frame(height: 16.0)
                        HStack {
                            Text("Email address")
                                .font(.system(size: 16.0))
                                .lineLimit(1)
                                .truncationMode(.tail)

                            Spacer()

                            Text("johndoe@sifca.app")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        Spacer().frame(height: 16.0)
                        HStack {
                            Text("Phone number")
                                .font(.system(size: 16.0))
                                .lineLimit(1)
                                .truncationMode(.tail)

                            Spacer()

                            Text("+(43) 23 323 422")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        Spacer().frame(height: 16.0)
                        HStack {
                            Text("Location")
                                .font(.system(size: 16.0))
                                .lineLimit(1)
                                .truncationMode(.tail)

                            Spacer()

                            Text("Emeka Street OO x. Austria")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        Spacer().frame(height: 16.0)
                        HStack {
                            Text("Joining date")
                                .font(.system(size: 16.0))
                                .lineLimit(1)
                                .truncationMode(.tail)

                            Spacer()

                            Text("Thu, 1/11/2024")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(16.0)
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(16.0)
                    VStack(alignment: .leading) {
                        Text("Interests")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.primary)

                        HStack {
                            Text("Reading")
                                .font(.body)
                                .padding(8.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 100.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                            Text("Politics")
                                .font(.body)
                                .padding(8.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 100.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                            Text("Space")
                                .font(.body)
                                .padding(8.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 100.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                            Text("Leo")
                                .font(.body)
                                .padding(8.0)

                                .background(
                                    RoundedRectangle(cornerRadius: 100.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                        }
                    }
                    .padding(16.0)
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(16.0)
                    VStack(alignment: .leading) {
                        Text("Hobbies")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.primary)

                        HStack {
                            Text("Tennis")
                                .font(.body)
                                .padding(8.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 100.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                            Text("Jogging")
                                .font(.body)
                                .padding(8.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 100.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                            Text("Football")
                                .font(.body)
                                .padding(8.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 100.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                            Text("Netflix")
                                .font(.body)
                                .padding(8.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 100.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                        }
                    }
                    .padding(16.0)
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(16.0)
                }
            }

            .padding(16.0)
            .background(Color.white)
            .cornerRadius(16.0)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
            .padding(16.0)
        }

        if isPopUpVisible {
            EditProfileDialog(isPopUpVisible: $isPopUpVisible)
        }
    }
}
