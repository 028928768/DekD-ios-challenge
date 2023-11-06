//
//  Constant.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import Foundation

enum BaseURL {
    static let api: String = "https://www.dek-d.com/"
}

enum Endpoint {
    static let rest: String = "api/rest/"
    
    // MARK: - Domains
    static func getNovels() -> String {
        return "\(rest)open/quiz/novel/list"
    }
    
    static func getBanners() -> String {
        return ("\(rest)campaign/list")
    }
}


