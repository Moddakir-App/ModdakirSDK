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
    private var viewModel = TestViewModel()

    var body: some View {
        VStack {
            Button(action: startSDK) {
                Text("Start SDK")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(.black)
                    .clipShape(.capsule)
            }
            .disabled(hostVC == nil)
        }
        .background(
            ViewControllerResolver { vc in
                if hostVC == nil {
                    hostVC = vc
                }
            }
        )
    }
}

private extension TestView {
    func startSDK() {
        guard let hostVC else { return }
        viewModel.onStart(root: hostVC)
    }
}


#Preview {
    TestView()
}
