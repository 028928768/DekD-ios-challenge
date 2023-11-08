//
//  BannerModel.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 8/11/2566 BE.
//

import Foundation

// MARK: - BannerResponse
struct BannerResponse: Codable {
    let pageInfo: PageInfo?
    let list: [BannerList]?
}

// MARK: - List
struct BannerList: Codable, Identifiable {
    let id: String?
    let createdAt, updatedAt, startedAt, endedAt: String?
    let published: Bool?
    let payload: Payload?
}

// MARK: - Payload
struct Payload: Codable {
    let url: String?
    let imageURL: ImageURL?

    enum CodingKeys: String, CodingKey {
        case url
        case imageURL = "imageUrl"
    }
}

// MARK: - ImageURL
struct ImageURL: Codable {
    let mobile, tablet: String?
}

