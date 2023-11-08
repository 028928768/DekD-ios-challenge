//
//  MockData.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import Foundation

enum MockData {
    static let novel: NovelList = .init(novel: Novel(id: 1,
                                                     updatedAt: "updatedAt",
                                                     title: "Novel title",
                                                     type: "long",
                                                     description: "novel description",
                                                     totalChapter: 12,
                                                     category: Category(main: 1, sub: 1, mainTitle: "main title", subTitle: "sub title"),
                                                     tags: ["tag1", "tag2", "tag3"],
                                                     owners: [Owner(id: 1, username: "username", alias: "alias", role: "admin")],
                                                     thumbnail: Thumbnail(normal: "http:\\normal-url", landscape: "http:\\landscape-url"),
                                                     engagement: Engagement(view: ViewRecord(month: 20, overall: 100), comment: Comment(primary: 50, overall: 100)),
                                                     order: 1))

    static let banner: BannerList = .init(id: "1",
                                          createdAt: "createdAt",
                                          updatedAt: "updatedAt",
                                          startedAt: "startedAt",
                                          endedAt: "endedAt",
                                          published: true,
                                          payload: Payload(url: "https://novel.dek-d.com/article/writer/63386/?utm_source=featured-banner&utm_medium=publisher&utm_campaign=inktree-ebook&utm_id=featured-banner-publisher-231108",
                                                           imageURL: ImageURL(mobile: "https://image.dek-d.com/contentimg/2023/Art/publisher-ebook/it11_8/pr_publisher_inktree_850x400.png",
                                                                              tablet: "https://image.dek-d.com/contentimg/2023/Art/publisher-ebook/it11_8/pr_publisher_inktree_1456x400.png")))
}
