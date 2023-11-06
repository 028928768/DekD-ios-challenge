//
//  NovelModel.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import Foundation

// MARK: - NovelResponse
struct NovelResponse {
    let pageInfo: PageInfo?
    let list: [List]?
}

// MARK: - List
struct List {
    let novel: Novel?
    let section: NSNull?
}

// MARK: - Novel
struct Novel {
    let id: Int?
    let updatedAt: Date?
    let title, type, description: String?
    let totalChapter: Int?
    let category: Category?
    let tags: [String]?
    let owners: [Owner]?
    let thumbnail: Thumbnail?
    let engagement: Engagement?
    let order: Int?
}

// MARK: - Category
struct Category {
    let main, sub: Int?
    let mainTitle, subTitle: String?
}

// MARK: - Engagement
struct Engagement {
    let view: View?
    let comment: Comment?
}

// MARK: - Comment
struct Comment {
    let primary, overall: Int?
}

// MARK: - View
struct View {
    let month, overall: Int?
}

// MARK: - Owner
struct Owner {
    let id: Int?
    let username, alias, role: String?
}

// MARK: - Thumbnail
struct Thumbnail {
    let normal: String?
    let landscape: String?
}

// MARK: - PageInfo
struct PageInfo {
    let currentPage, totalItems, itemsPerPage: Int?
    let hasPrevious, hasNext: Bool?
}
