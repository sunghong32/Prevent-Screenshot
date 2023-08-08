//
//  ScreenshotPreventView.swift
//  ScreenshotHide
//
//  Created by 민성홍 on 2023/08/07.
//

import SwiftUI

struct ScreenshotPreventView<Content: View>: View {
    var content: Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    // View Properties
    @State private var hostingController: UIHostingController<Content>?

    var body: some View {
        _ScreenshotPreventHelper(hostingController: $hostingController)
            .overlay {
                GeometryReader {
                    let size = $0.size

                    Color.clear
                        .preference(key: SizeKey.self, value: size)
                        .onPreferenceChange(SizeKey.self) { value in
                            if value != .zero {
                                /// Creating Hosting Controller with the Size
                                if hostingController == nil {
                                    hostingController = UIHostingController(rootView: content)
                                    hostingController?.view.backgroundColor = .clear
                                    hostingController?.view.tag = 1009
                                    hostingController?.view.frame = .init(origin: .zero, size: value)
                                } else {
                                    /// Somtimes the View size may updated, In that case updating the UIView Size
                                    hostingController?.view.frame = .init(origin: .zero, size: value)
                                }
                            }
                        }
                }
            }
    }
}

fileprivate struct SizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

fileprivate struct _ScreenshotPreventHelper<Content: View>: UIViewRepresentable {
    @Binding var hostingController: UIHostingController<Content>?

    func makeUIView(context: Context) -> some UIView {
        let secureField = UITextField()
        secureField.isSecureTextEntry = true

        if let textLayoutView = secureField.subviews.first {
            return textLayoutView
        }

        return UIView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        /// Adding Hosting View as a Subview to the TextLayout View
        if let hostingController, !uiView.subviews.contains(where: { $0.tag == 1009 }) {
            /// Adding Hosting Controller for One Time
            uiView.addSubview(hostingController.view)
        }
    }
}

struct ScreenshotPreventView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
