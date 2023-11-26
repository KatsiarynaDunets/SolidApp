//
//  LocalDataFetcher.swift
//  SolidApp
//
//  Created by Kate on 26/11/2023.
//

import Foundation

/*
 Этот класс берет данные из локального файла и парсит их родительскими методами
 */

final class LocalDataFetcher: NetworkDataFetcher {
    override func fetchGenericJSONData<T>(pathURL: String, comletion: @escaping (T?, Error?) -> Void) where T : Decodable {
        guard let localFileURL = Bundle.main.url(forResource: pathURL, withExtension: nil),
              let data = try? Data(contentsOf: localFileURL) else {
            // тут мы понимаем что такого файла нет
            super.fetchGenericJSONData(pathURL: pathURL, comletion: comletion)
            return
        }
        // декодируем
        let (item, error) = self.decodeJSON(type: T.self, data: data)
        comletion(item, error)
    }
}

