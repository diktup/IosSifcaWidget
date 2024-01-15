//
//  SifcaWidgetSignOutDialog.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 4/1/2024.
//

import SwiftUI
import SwiftUIGIF

struct SignOutDialog: View {
    @Binding var dialogIndex: Int
 
    var body: some View {
        VStack {
            HStack {
                Text("Sign out")
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
            Spacer().frame(height: 16.0)
            Divider()
            Spacer().frame(height: 16.0)
            GIFImage(name: "lord-icon-link")
                .frame(width: 100, height: 100)
            Spacer().frame(height: 16.0)
            Text("Leaving So Soon?")
                .font(.title)
                .multilineTextAlignment(.center)

            Spacer().frame(height: 16.0)
            Text("Wait, don't go! Our buttons are giving away free virtual cookies. Activate one to receive your tasty treat and come back for more exciting updates!")
                .font(.body).multilineTextAlignment(.center)

            Spacer().frame(height: 16.0)

            Button(action: {
             }) {
                Text("Save")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16.0)
            }
        }
        .padding(16.0)
        .background(Color.white)
        .cornerRadius(16.0)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .padding(16.0)

        
    }
}
