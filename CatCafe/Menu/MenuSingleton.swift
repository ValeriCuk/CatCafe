//
//  MenuSingleton.swift
//  CatCafe
//
//  Created by Lera Cuk on 10.11.2023.
//

import Foundation

class MenuSingleton {
    static let shared = MenuSingleton()
    private init() {
    }
    
    func doSomething() {
        print("Doing something...")
    }
}
