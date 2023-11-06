//
//  NovelListViewModel.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import Foundation
import Alamofire

protocol NovelServiceProtocol {
    func getNovels(page: Int) async throws
}

class NovelListViewModel: ObservableObject {
    // MARK: - Properties
    @Published var novelResponse: NovelResponse?
    @Published var novelList: [NovelList] = []
        
    func getNovels(page: Int = 1) async  {
        guard let url: URL = .init(string: "\(BaseURL.api)\(Endpoint.getNovels())") else {
            return
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
                        let response = try JSONDecoder().decode(NovelResponse.self, from: data!)
                        self.novelResponse = response
                        if let novels = self.novelResponse?.list {
                            self.novelList = novels
                        }
                    } catch {
                        print(error)
                    }
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }
}
