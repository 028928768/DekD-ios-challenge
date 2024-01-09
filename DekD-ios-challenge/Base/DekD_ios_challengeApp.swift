//
//  DekD_ios_challengeApp.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI
import Mixpanel

@main
struct DekD_ios_challengeApp: App {
    init() {
        // initlialise Mixpanel SDK
        Mixpanel.initialize(token: "b51a8f52680dec1ce9d57ffd7557d10b", trackAutomaticEvents: true)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

