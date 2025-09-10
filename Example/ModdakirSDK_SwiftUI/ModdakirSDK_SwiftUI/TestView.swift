//
//  ContentView.swift
//  ModdakirSDK_SwiftUI
//
//  Created by Amin on 10/09/2025.
//

import SwiftUI
import ModdakirSDK

struct TestView: View {

    @State private var hostVC: UIViewController?
    private var viewModel: TestViewModel = .init()

    var body: some View {
        VStack {
            Button {
                if let hostVC {
                    viewModel.onStart(root: hostVC)
                }
            } label: {
                Text("Start SDK")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(.black)
                    .clipShape(.capsule)
            }

        }
        .background(
            ViewControllerResolver { vc in
                self.hostVC = vc
            }.frame(width: 0, height: 0)
        )
    }
}

#Preview {
    TestView()
}
