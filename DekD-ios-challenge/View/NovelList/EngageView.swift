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
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "list.bullet")
                        .padding(.trailing, -2)
                    Text("\(list)")
                }
            })
            
            // view
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "eye.fill")
                        .padding(.trailing, -2)
                    Text("\(view)")
                }
            })

            // comment
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "bubble.fill")
                        .padding(.trailing, -2)
                    Text("\(comment)")
                }
            })
            
        }
        .foregroundStyle(.black.opacity(0.5))
        .font(.system(size: 14))
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    EngageView(list: 6000, view: 200, comment: 1000)
}
