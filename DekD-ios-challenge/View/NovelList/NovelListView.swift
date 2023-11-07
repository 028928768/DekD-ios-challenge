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
        
        Task {
            await viewModel.getNovels()
        }
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
                            
                            Text("Novels: \(viewModel.novelResponse?.pageInfo?.currentPage ?? 0)")
                                .padding()
                        }
                    }
                } //: header
                .background(Color(hex: "#fe7003"))

                
                List {
                    ForEach(viewModel.novelList) { novel in
                        NovelCard(novel: novel)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .padding(.top, -12)
                
                .refreshable {
                    Task {
                        await viewModel.getNovels()
                    }
                }
            
                Spacer()
            } //: Main VStack
    
            GeometryReader { reader in
                Color(hex: "#fe7003")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        } //: ZStack
    }
}

#Preview {
    NovelListView(viewModel: .init())
}

// extension for color(hex: initialiser)
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
