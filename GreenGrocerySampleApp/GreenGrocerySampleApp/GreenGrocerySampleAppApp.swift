//
//  GreenGrocerySampleAppApp.swift
//  GreenGrocerySampleApp
//
//  Created by Talha Asif on 11/05/2024.
//

import SwiftUI

@main
struct GreenGrocerySampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            let model = SignupViewModel()
            SignupView(model: model)
        }
    }
}
