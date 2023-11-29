//
//  DataFetcherService.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import Foundation

/*
 Модуль высшего уровня
 Модуль верхнего уровня не должен зависеть от модулей нижнего уровня. Все зависят от абстракций.
 */

protocol DataFetcherServiceProtocol {
    func fetchPaidGames(comletion: @escaping (AppGroup?, Error?) -> Void)
    func fetchFreeGames(comletion: @escaping (AppGroup?, Error?) -> Void)
    func fetchCountry(comletion: @escaping ([Country]?, Error?) -> Void)
    func fetchLocalCountry(comletion: @escaping ([Country]?, Error?) -> Void)
}

class DataFetcherService: DataFetcherServiceProtocol {
    
    /*
     наши абстракции
     */
    var networkDataFetcher : NetworkDataFetcherProtocol
    var localDataFetcher   : NetworkDataFetcherProtocol
    
    init(networkDataFetcher : NetworkDataFetcherProtocol = NetworkDataFetcher(),
         localDataFetcher   : NetworkDataFetcherProtocol = LocalDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher   = localDataFetcher
    }
    
    
    func fetchPaidGames(comletion: @escaping (AppGroup?, Error?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(pathURL: Constants.urlPaidGames, comletion: comletion)
    }
    
    func fetchFreeGames(comletion: @escaping (AppGroup?, Error?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(pathURL: Constants.urlFreeGames, comletion: comletion)
    }
    
    func fetchCountry(comletion: @escaping ([Country]?, Error?) -> Void) {
        /// тут теперь даже можем заменить networkDataFetcher на localDataFetcher и все сработает правильно!!!
        localDataFetcher.fetchGenericJSONData(pathURL: Constants.countryURL, comletion: comletion)
    }
    
    func fetchLocalCountry(comletion: @escaping ([Country]?, Error?) -> Void) {
        let localFileName = "usersAPI.txt"
        localDataFetcher.fetchGenericJSONData(pathURL: localFileName, comletion: comletion)
    }
    
}
