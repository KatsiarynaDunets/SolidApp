//
//  NetworkDataFetcher.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import Foundation

/*
 NetworkDataFetcherProtocol - модуль нижнего уровня для DataFetcherServiceProtocol
 NetworkDataFetcherProtocol - модуль высшего уровня для NetworkServiceProtocol
 */

protocol NetworkDataFetcherProtocol {
    func fetchGenericJSONData<T: Decodable>(pathURL: String, comletion: @escaping (T?, Error?) -> Void)
}

class NetworkDataFetcher: NetworkDataFetcherProtocol {
    
    /// наши абстракции
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchGenericJSONData<T: Decodable>(pathURL: String, comletion: @escaping (T?, Error?) -> Void) {
        //print("fetchGenericJSONData T: \(T.self)")
        networkService.request(pathURL: pathURL) { [weak self] data, error in
            guard let self else { return }
            if let error {
                comletion(nil, error)
            } else if let data {
                let (item, error) = self.decodeJSON(type: T.self, data: data)
                comletion(item, error)
            }
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, data: Data) -> (T?, Error?) {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return (decodedData, nil)
        } catch {
            return (nil, error)
        }
    }
    
    /*
    func fetchPaidGames(pathURL: String, comletion: @escaping (AppGroup?, Error?) -> Void)  {
        networkService.request(pathURL: pathURL) { data, error in
            let decoder = JSONDecoder()
            guard let data else { return }
            let appGroup = try? decoder.decode(AppGroup.self, from: data)
            comletion(appGroup, error)
        }
    }
    
    func fetchFreeGames(pathURL: String, comletion: @escaping (AppGroup?, Error?) -> Void)  {
        networkService.request(pathURL: pathURL) { data, error in
            let decoder = JSONDecoder()
            guard let data else { return }
            let appGroup = try? decoder.decode(AppGroup.self, from: data)
            comletion(appGroup, error)
        }
    }
    
    func fetchCountry(pathURL: String, comletion: @escaping ([Country]?, Error?) -> Void)  {
        networkService.request(pathURL: pathURL) { data, error in
            let decoder = JSONDecoder()
            guard let data else { return }
            let countries = try? decoder.decode([Country].self, from: data)
            comletion(countries, error)
        }
    }
     */
}
