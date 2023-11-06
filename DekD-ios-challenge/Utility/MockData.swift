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
                                                     tags: ["tag1","tag2","tag3"],
                                                     owners: [Owner(id: 1, username: "username", alias: "alias", role: "admin")],
                                                     thumbnail: Thumbnail(normal: "http:\\normal-url", landscape: "http:\\landscape-url"),
                                                     engagement: Engagement(view: ViewRecord(month: 20, overall: 100), comment: Comment(primary: 50, overall: 100)),
                                                     order: 1))
}
