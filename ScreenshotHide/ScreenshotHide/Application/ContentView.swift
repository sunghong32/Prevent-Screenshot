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
            .navigationTitle("My List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
