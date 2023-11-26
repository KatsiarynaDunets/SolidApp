//
//  NetworkService.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import Foundation

/*
 NetworkServiceProtocol - модуль нижнего уровня для NetworkDataFetcherProtocol (NetworkDataFetcher)
 NetworkServiceProtocol - модуль нижнего уровня для NetworkDataFetcherProtocol (LocalDataFetcher)
 */

protocol NetworkServiceProtocol {
    func request(pathURL: String, comletion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
        
    func request(pathURL: String, comletion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: pathURL) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, comletion: comletion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, comletion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                comletion(data, error)
            }
        }
    }
    
}
