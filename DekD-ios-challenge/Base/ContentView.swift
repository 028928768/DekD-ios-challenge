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
            TabView {
                NovelListView(viewModel: .init())
                    .tabItem {
                        Label("Novels", systemImage: "list.dash")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle.fill")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
