//
//  ContentView.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NovelListView(viewModel: .init())
        }
    }
}

#Preview {
    ContentView()
}
