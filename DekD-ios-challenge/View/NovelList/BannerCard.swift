//
//  BannerCard.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct BannerCard: View {
    @EnvironmentObject var viewModel: NovelListViewModel
    let banners: [BannerList]
    @State var selection = 0
    var body: some View {
        VStack {
            switch viewModel.bannerViewState {
            case .normal:
                ScrollView(.init()) {
                    TabView {
                        ForEach(banners) { banner in
                            if let phoneImgUrl = banner.payload?.imageURL?.mobile, let padImgUrl = banner.payload?.imageURL?.tablet {
                                AsyncImage(url: URL(string: UIDevice.current.userInterfaceIdiom == .phone ? phoneImgUrl : padImgUrl)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(12)
                                } placeholder: {
                                    Image("noImage")
                                        .resizable()
                                        .frame(maxHeight: 200)
                                        .cornerRadius(12)
                                }
                            }
                            
                        } //: ForEach
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                } //: ScrollView
            case .error:
                VStack {
                    Text("Someting went wrong...")
                    Button("TRY AGAIN") {
                        Task {
                            await viewModel.getBanners()
                        }
                    }
                    .tint(Color.dekdPrimaryOrange)
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
                }.frame(maxHeight: .infinity)
            }
        } //: Main VStack
    }
}

#Preview {
    BannerCard(banners: [MockData.banner, MockData.banner])
}
