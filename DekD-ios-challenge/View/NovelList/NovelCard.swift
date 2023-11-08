//
//  NovelCard.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import SwiftUI

struct NovelCard: View {
    @EnvironmentObject var viewModel: NovelListViewModel
    let novel: NovelList
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: novel.novel?.thumbnail?.normal ?? "https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 150)
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
                        if (1...3).contains(order) {
                            HStack {
                                if order == 1 {
                                    Image(systemName: "crown.fill")
                                        .resizable()
                                        .foregroundStyle(.yellow)
                                        .frame(width: 15, height: 15)
                                } else if order == 2 {
                                    Image(systemName: "crown.fill")
                                        .resizable()
                                        .foregroundStyle(.gray)
                                        .frame(width: 15, height: 15)
                                } else if order == 3 {
                                    Image(systemName: "crown.fill")
                                        .resizable()
                                        .foregroundStyle(.brown)
                                        .frame(width: 15, height: 15)
                                }
                                Text("\(order)")
                                    .padding(.leading, -2)
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color(hex: "#fe7003"))
                            }
                            .overlay(
                                      RoundedRectangle(cornerRadius: 20)
                                          .stroke(Color(hex: "#fe7003"), lineWidth: 1)
                                          .frame(width: 45)
                                          .padding(.leading, 4)
                                  )
                        } else {
                            Text("\(order)")
                                .padding(.leading, 12)
                                .foregroundStyle(Color(hex: "#fe7003"))
                                .font(.system(size: 16))
                                .overlay(
                                          RoundedRectangle(cornerRadius: 20)
                                              .stroke(Color(hex: "#fe7003"), lineWidth: 1)
                                              .frame(width: 36)
                                              .padding(.leading, 12)
                                      )
                        }
                    }

                    // title
                    if let title = novel.novel?.title {
                        Text(title)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(maxHeight: .infinity)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    // sub title
                    if let subTitle = novel.novel?.category?.subTitle {
                        Text(subTitle)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(hex: "#fe7003"))
                            .padding(.vertical, 2)
                    }

                    // owner
                    if let owner = novel.novel?.owners?[0].alias {
                        Text(owner)
                            .font(.system(size: 14))
                    }
                }
                .padding(.vertical)
                .frame(maxHeight: 150)
                Spacer()
            } //: HStack

            // engangeView
            HStack {
                EngageView(list: 6000, view: novel.novel?.engagement?.view?.overall ?? 0, comment: novel.novel?.engagement?.comment?.overall ?? 0)
                    .padding(.top, 2)
                if let updatedAt = novel.novel?.updatedAt, UIDevice.current.userInterfaceIdiom == .pad {
                    Spacer()
                    Text(viewModel.dateFormatter(rawDateTime: updatedAt))
                        .font(.system(size: 12))
                        .padding(.top, 2)
                        .foregroundStyle(Color.black.opacity(0.5))
                }
            }

            if let description = novel.novel?.description {
                Text(description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                    .font(.system(size: 14))
                    .lineSpacing(6)
                    .padding(.vertical, 4)
            }
            
            // tag
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if let tags = novel.novel?.tags {
                        ForEach(tags, id: \.self) { tag in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("#\(tag)")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.black.opacity(0.5))
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 6)
                                    .border(.gray.opacity(0.25))
                            })
                        }
                    }
                }
            } //: tag

            if let updatedAt = novel.novel?.updatedAt, UIDevice.current.userInterfaceIdiom == .phone {
                Text("อัพเดทล่าสุด \(viewModel.dateFormatter(rawDateTime: updatedAt))")
                    .font(.system(size: 12))
                    .padding(.top, 2)
                    .foregroundStyle(Color.black.opacity(0.5))
            }
            
        } //: Main VStack
        .padding()
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 2)
    }
}

#Preview {
    NovelCard(novel: MockData.novel)
}
