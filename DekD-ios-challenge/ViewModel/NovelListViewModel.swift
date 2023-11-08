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

@MainActor
class NovelListViewModel: ObservableObject {
    // MARK: - Properties
    @Published var novelResponse: NovelResponse?
    @Published var novelList: [NovelList] = []
    @Published var isLoadMore: Bool = false
    @Published var bannerList: [BannerList] = []
        
    func getNovels(page: Int = 1) async  {
        if novelList.isEmpty {
            // loading animation
        }
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
                            var tempNovels: [NovelList] = []
                            if page > 1 {
                                tempNovels = self.novelList
                            }
                            tempNovels += novels
                            self.novelList = tempNovels
                            // normal state - load succesfully
                        }
                    } catch {
                        print(error.localizedDescription)
                        // error state - load failed
                    }
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func loadMore(novel: NovelList) async {
        if novel.novel?.id == novelList.last?.novel?.id, novelResponse?.pageInfo?.hasNext != false, let nextPage = getNextPage() {
            Task {
                    print("next page: \(nextPage)")
                    isLoadMore.toggle()
                    await getNovels(page: nextPage)
                    isLoadMore.toggle()
                
            }
        }
    }
    
    func getNextPage() -> Int? {
        guard let currentPage = novelResponse?.pageInfo?.currentPage else { return nil }
        let nextPage = currentPage + 1
        return Int(nextPage)
    }
    
    func getBanners() async  {
        if novelList.isEmpty {
            // loading animation
        }
        guard let url: URL = .init(string: "\(BaseURL.api)\(Endpoint.getBanners())") else {
            return
        }

        print("BaseURL: \(url)")

        // create request
        AF.request(url, method: .get, encoding: URLEncoding.default).validate()
            .response { resp in
                switch resp.result {
                case let .success(data):
                    do {
                        let response = try JSONDecoder().decode(BannerResponse.self, from: data!)
                        //self.bannerResponse = response
                        guard let bannersResp = response.list else {
                            return
                        }
                        self.bannerList = bannersResp
                        print(self.bannerList)
    
                    } catch {
                        print(error)
                        // error state - load failed
                    }
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }
}
