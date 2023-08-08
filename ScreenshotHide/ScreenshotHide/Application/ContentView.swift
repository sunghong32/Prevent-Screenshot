//
//  ContentView.swift
//  ScreenshotHide
//
//  Created by 민성홍 on 2023/08/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ShowImageView()

                ShowSecurityKeysView()
            }
            .navigationTitle("My List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
