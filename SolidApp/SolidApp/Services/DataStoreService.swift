//
//  DataStoreService.swift
//  SolidApp
//
//  Created by Kate on 22/11/2023.
//

import Foundation

final class DataStoreService {
    
    static var shared = DataStoreService()
    private init() {}
    
    func saveEmail(email: String) {
        print("Your email: \(email) is saved")
    }
    
    func getEmail() -> String {
        "Your email"
    }
    
}
