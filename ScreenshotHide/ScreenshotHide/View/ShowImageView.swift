//
//  ShowImageView.swift
//  ScreenshotHide
//
//  Created by 민성홍 on 2023/08/08.
//

import SwiftUI

struct ShowImageView: View {
    var body: some View {
        NavigationLink {
            ScreenshotPreventView {
                GeometryReader {
                    let size = $0.size

                    Image("sunny")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 35))
                }
                .padding(15)
            }
            .navigationTitle("Fubao")
        } label: {
            Text("Show Image")
        }
    }
}

