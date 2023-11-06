//
//  EngageView.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 7/11/2566 BE.
//

import SwiftUI

struct EngageView: View {
    let list: Int
    let view: Int
    let comment: Int
    var body: some View {
        HStack {
            //list
            Image(systemName: "list.bullet")
            Text("6,000")
            
            // view
            Image(systemName: "eye.fill")
            Text("512K")
            
            // comment
            Image(systemName: "bubble.fill")
            Text("111.2K")
        }
    }
}

#Preview {
    EngageView(list: 6000, view: 200, comment: 1000)
}
