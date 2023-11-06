//
//  NovelListView.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct NovelListView: View {
    @StateObject private var viewModel: NovelListViewModel
    
    // MARK: - Init
    init(viewModel: NovelListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            VStack {
                // header
                Group {
                    VStack {
                        HStack{
                            Text("รายการนิยาย")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        
                        Button(action: {
                            // call api
                            Task {
                                await viewModel.fetchNovels()
                            }
                        }, label: {
                            Text("GET")
                        })
                            
                        }
                    }
                } //: header
                .background(Color.orange)

                
                List {
                    NovelCard()
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            
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
    NovelListView(viewModel: .init())
}
