//
//  TestViewModel.swift
//  ModdakirSDK_SwiftUI
//
//  Created by Amin on 10/09/2025.
//

import Foundation
import SwiftUI
import ModdakirSDK

final class TestViewModel {

    func onStart(root: UIViewController) {
        ModdakirService.initiateCall(
            moddakirId: "id",
            moddakirKey: "key",
            userInfo: .init(
                fullName: "Amin",
                gender: .male,
                email: "m.amin@test.com"
            ),
            rootView: root,
            themeMode: .light
        )
    }
}
