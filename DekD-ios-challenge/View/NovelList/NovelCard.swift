//
//  NovelCard.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct NovelCard: View {
    let novel: NovelList
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: novel.novel?.thumbnail?.normal ?? "https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 125)
                        .cornerRadius(12)
                } placeholder: {
                    Image("noImage")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .cornerRadius(12)
                }

                VStack(alignment: .leading) {
                    // order
                    if let order = novel.novel?.order {
                        Text("order: \(order)")
                    }

                    // title
                    if let title = novel.novel?.title {
                        Text(title)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2, reservesSpace: true)
                    }

                    // sub title
                    if let subTitle = novel.novel?.category?.subTitle {
                        Text(subTitle)
                    }

                    // owner
                    if let owner = novel.novel?.owners?[0].alias {
                        Text(owner)
                    }
                }
                .padding(.vertical)
                Spacer()
            } //: HStack

            // engangeView
            EngageView(list: 6000, view: 200, comment: 1000)
                .padding(.vertical, 2)

            if let description = novel.novel?.description {
                Text(description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
            }
            
            // tag
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if let tags = novel.novel?.tags {
                        ForEach(tags, id: \.self) { tag in
                            Text("#\(tag)")
                                .font(.body)
                                .padding(.all, 6)
                                .border(.gray)
                        }
                    }
                }
            } //: tag

            if let updatedAt = novel.novel?.updatedAt {
                Text(updatedAt)
            }
            
        } //: Main VStack
        .padding()
        .background(.white)
        .cornerRadius(4)
        .shadow(radius: 2)
    }
}

#Preview {
    NovelCard(novel: MockData.novel)
}
