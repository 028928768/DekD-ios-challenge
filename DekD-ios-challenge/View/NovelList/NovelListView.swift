//
//  NovelListView.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct NovelListView: View {
    var body: some View {
        ZStack {
            
            VStack {
                // header
                Group {
                    VStack {
                        HStack{
                            Text("รายการนิยาย")
                                .padding()
                            Spacer()
                        }
                        .padding(.top, 30)
                    }
                } //: header
                .background(.orange)
                
                
                Text("Hello, List of top 100 Novel!")
                Spacer()
            } //: Main VStack
        } //: ZStack
        .ignoresSafeArea()
    }
}

#Preview {
    NovelListView()
}
