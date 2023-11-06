//
//  NovelModel.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import Foundation

// MARK: - NovelResponse
struct NovelResponse: Codable {
    let pageInfo: PageInfo?
    let list: [NovelList]?
}

// MARK: - List
struct NovelList: Codable {
    let novel: Novel?
}

// MARK: - Novel
struct Novel: Codable {
    let id: Int?
    let updatedAt: String?
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
struct Category: Codable {
    let main, sub: Int?
    let mainTitle, subTitle: String?
}

// MARK: - Engagement
struct Engagement: Codable {
    let view: ViewRecord?
    let comment: Comment?
}

// MARK: - Comment
struct Comment: Codable {
    let primary, overall: Int?
}

// MARK: - View
struct ViewRecord: Codable {
    let month, overall: Int?
}

// MARK: - Owner
struct Owner: Codable {
    let id: Int?
    let username, alias, role: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let normal: String?
    let landscape: String?
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let currentPage, totalItems, itemsPerPage: Int?
    let hasPrevious, hasNext: Bool?
}
