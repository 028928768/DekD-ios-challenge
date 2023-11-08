//
//  BannerCard.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct BannerCard: View {
    let banners: [BannerList]
    var body: some View {
            ScrollView(.init()) {
                TabView {
                    ForEach(banners) { banner in
                        AsyncImage(url: URL(string: banner.payload?.imageURL?.mobile ?? "https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg")) { image in
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
                        
                    } //: ForEach
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            } //: ScrollView
        
    }
}

#Preview {
    BannerCard(banners: [MockData.banner, MockData.banner])
}
