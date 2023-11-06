//
//  NovelListViewModel.swift
//  DekD-ios-challenge
//
//  Created by Simon Siwell on 6/11/2566 BE.
//

import Foundation

protocol NovelServiceProtocol {
    func getNovels(page: Int) async throws
}

class NovelListViewModel: ObservableObject {
    // MARK: - Properties
    private let service: NovelServiceProtocol
    @Published var novelResponse: NovelResponse?
    
    
    // MARK: - init
    init(service: NovelServiceProtocol = NovelService()) {
        self.service = service
    }
    
    func fetchNovels(page: Int = 1) async {
        do {
            try await service.getNovels(page: page)
        } catch {
            // api failed
        }
    }
}
