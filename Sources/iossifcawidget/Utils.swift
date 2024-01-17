//
//  Utils.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 5/1/2024.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

extension RoundedRectangle {
    init(cornerRadius: CGFloat, corners: UIRectCorner) {
        _ = UIBezierPath(
            roundedRect: CGRect(x: 0, y: 0, width: 1, height: 1),
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        self.init(cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
    }
}

struct RadioButton: View {
    @Binding var selectedIndex: Int?
    let index: Int
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Circle()
                    .stroke(color, lineWidth: 2.0)
                    .frame(width: 22.0, height: 22.0)

                if selectedIndex == index {
                    Circle()
                        .fill(color)
                        .frame(width: 12.0, height: 12.0)
                }
            }
        }
    }
}

public struct GIFImageWithURL: View {
  private let url: URL
  @State private var imageData: Data?

  public init(url: URL) {
    self.url = url
  }

  private func loadData() {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        self.imageData = data
      }
    }
    task.resume()
  }

  public var body: some View {
    Group {
      if let imageData = imageData {
        GIFImage(data: imageData)
      } else {
        Text("")
          .onAppear {
            self.loadData()
          }
      }
    }
  }
}