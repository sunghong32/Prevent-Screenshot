//
//  ShowSecurityKeysView.swift
//  ScreenshotHide
//
//  Created by 민성홍 on 2023/08/08.
//

import SwiftUI

struct ShowSecurityKeysView: View {
    var body: some View {
        NavigationLink {
            List {
                Section("API Key") {
                    ScreenshotPreventView {
                        Text("ITU98DHGMmgk812KUGNW")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                Section("APNS Key") {
                    ScreenshotPreventView {
                        Text("enitsuji")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        } label: {
            Text("Show Security Keys")
        }
    }
}
