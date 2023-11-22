//
//  DataFetcherService.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import Foundation

protocol DataFetcherServiceProtocol {
    func fetchPaidGames(comletion: @escaping (AppGroup?, Error?) -> Void)
    func fetchFreeGames(comletion: @escaping (AppGroup?, Error?) -> Void)
    func fetchCountry(comletion: @escaping ([Country]?, Error?) -> Void)
}

class DataFetcherService: DataFetcherServiceProtocol {
    var networkDataFetcher: NetworkDataFetcherProtocol
    
    init(networkDataFetcher: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    func fetchPaidGames(comletion: @escaping (AppGroup?, Error?) -> Void) {}
    
    func fetchFreeGames(comletion: @escaping (AppGroup?, Error?) -> Void) {}
    
    func fetchCountry(comletion: @escaping ([Country]?, Error?) -> Void) {}
}
