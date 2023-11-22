//
//  AppGroup.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import Foundation

struct  AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let id: String
}

