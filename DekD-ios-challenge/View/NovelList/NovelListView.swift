//
//  NovelListView.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct NovelListView: View {
    @StateObject private var viewModel: NovelListViewModel
    @State private var isScrollToTopVisible = false

    // MARK: - Init

    init(viewModel: NovelListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)

        Task {
            await viewModel.getNovels()
            await viewModel.getBanners()
        }
    }

    var body: some View {
        ZStack {
            VStack {
                // header
                Group {
                    VStack {
                        HStack {
                            Text("รายการนิยาย")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .padding()
        
                            if UIDevice.current.userInterfaceIdiom == .phone {
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                } //: header
                .background(Color(hex: "#fe7003"))
                

                switch viewModel.viewState {
                case .normal:
                    ScrollViewReader { proxy in
                        ZStack(alignment: .bottom) {
                            List {
                                EmptyView()
                                    .hidden()
                                    .id(0)
                                ForEach(viewModel.novelList) { novel in
                                    if novel.novel != nil {
                                        NovelCard(novel: novel)
                                            .listRowSeparator(.hidden)
                                            .onAppear {
                                                Task {
                                                    checkVisibility(firstId: viewModel.novelList.first?.novel?.order, currentId: novel.novel?.order)
                                                    await viewModel.loadMore(novel: novel)
                                                }
                                            }
                                    } else {
                                        BannerCard(banners: viewModel.bannerList)
                                            .frame(minHeight: 225)
                                            .frame(maxWidth: .infinity)
                                            .cornerRadius(12)
                                            .padding(.vertical)
                                    }
                                }
                                
                                // load more animation
                                if viewModel.isLoadMore {
                                    ProgressView()
                                        .listRowSeparator(.hidden)
                                        .frame(idealWidth: .infinity, maxWidth: .infinity, minHeight: 40, alignment: .center)
                                        .padding(.top, -100)
                                }
                            } //: List
                            .listStyle(.plain)
                            .padding(.top, -12)
                            .ignoresSafeArea()
                            .padding(.bottom, -12)
                            .refreshable {
                                Task {
                                    await viewModel.getNovels()
                                }
                            }
                            
                            if isScrollToTopVisible {
                                Button(action: {
                                    withAnimation {
                                        proxy.scrollTo(0)
                                    }
                                }, label: {
                                    HStack {
                                        Image(systemName: "chevron.up")
                                            .foregroundStyle(Color.white)
                                        Text("กลับขึ้นไปด้านบน")
                                            .font(.system(size: 12))
                                    }
                                })
                                .tint(Color(hex: "fe7003"))
                                .controlSize(.large)
                                .buttonStyle(.borderedProminent)
                                .clipShape(Capsule())
                                .padding(.top, 8)
                                .shadow(radius: 7)
                                .padding()
                            }
                        }
                    }
                case .error:
                    VStack {
                        Image("DekD_Logo")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .aspectRatio(contentMode: .fit)

                        Text("Sorry, there is something wrong with connection please try again")
                            .multilineTextAlignment(.center)
                            .padding()

                        Button("TRY AGAIN") {
                            Task {
                                viewModel.viewState = .loading
                                await viewModel.getNovels()
                            }
                        }
                        .tint(Color(hex: "fe7003"))
                        .controlSize(.large)
                        .buttonStyle(.borderedProminent)
                        .clipShape(Capsule())
                        .padding(.top, 8)
                        .shadow(radius: 7)
                        .padding()
                    }
                    .frame(maxHeight: .infinity)

                case .loading:
                    VStack {
                        ProgressView()
                    }
                    .frame(maxHeight: .infinity)
                }

                Spacer()
            } //: Main VStack

            GeometryReader { reader in
                Color(hex: "#fe7003")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        }.environmentObject(viewModel)
    }
    
    func checkVisibility(firstId: Int?, currentId: Int?) {
        if currentId != firstId {
            withAnimation {
                isScrollToTopVisible = true
            }
        } else {
            withAnimation {
                isScrollToTopVisible = false
            }
        }
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
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
