//
//  NetworkDataFetcher.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import Foundation

protocol NetworkDataFetcherProtocol {
    // тут уже удет работа с дженериками
}

class NetworkDataFetcher: NetworkDataFetcherProtocol {
    var networkService: NetworkService

    static var shared = NetworkDataFetcher()
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    func fetchPaidGames(pathURL: String, comletion: @escaping (AppGroup?, Error?) -> Void) {
        networkService.request(pathURL: pathURL) { data, error in
            let decoder = JSONDecoder()
            guard let data else { return }
            let appGroup = try? decoder.decode(AppGroup.self, from: data)
            comletion(appGroup, error)
        }
    }

    func fetchFreeGames(pathURL: String, comletion: @escaping (AppGroup?, Error?) -> Void) {
        networkService.request(pathURL: pathURL) { data, error in
            let decoder = JSONDecoder()
            guard let data else { return }
            let appGroup = try? decoder.decode(AppGroup.self, from: data)
            comletion(appGroup, error)
        }
    }

    func fetchCountry(pathURL: String, comletion: @escaping ([Country]?, Error?) -> Void) {
        networkService.request(pathURL: pathURL) { data, error in
            let decoder = JSONDecoder()
            guard let data else { return }
            let countries = try? decoder.decode([Country].self, from: data)
            comletion(countries, error)
        }
    }
}
