//
//  NovelService.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import Alamofire
import Foundation

class NovelService: NovelServiceProtocol {
    // MARK: - Methods

    func getNovels(page: Int = 1) async throws  {
        guard let url: URL = .init(string: "\(BaseURL.api)\(Endpoint.getNovels())") else {
            throw RespError.declaration
        }

        print("BaseURL: \(url)")
        // create parameters
        let parameters: [String: Any] = ["page": page]
        let headers: HTTPHeaders = ["SECRET": "DrVDKp2ancYmyW2b3wRVU6yssBcjiyJ4"]

        // create request
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate()
            .response { resp in
                switch resp.result {
                case let .success(data):
                    do {
                
                        let jsonData = try JSONDecoder().decode(NovelResponse.self, from: data!)
                        print(jsonData)
                    } catch {
                        print(error)
                    }
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }
}

