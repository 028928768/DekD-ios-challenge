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
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                    }
                } //: header
                .background(Color.orange)

                
                List {
                    NovelCard()
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
               // .padding(.horizontal, -24)
               
            
                Spacer()
            } //: Main VStack
    
            GeometryReader { reader in
                Color.orange
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        } //: ZStack
    }
}

#Preview {
    NovelListView()
}
