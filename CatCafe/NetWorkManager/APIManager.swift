//
//  APIManager.swift
//  CatCafe
//
//  Created by Lera Cuk on 09.11.2023.
//

import Foundation

class APIManager{
    static let shared = APIManager()
    let urlString = "https://0e628d4d-33ed-43b0-80e7-0b863987b119.mock.pstmn.io"
    
    func getData(completion: @escaping (Menu) -> Void){
        guard let url = URL(string: urlString) else {
            print("ERROR")
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            guard let data else {return}
            if let catCafe = try? JSONDecoder().decode(CatCafe.self, from: data){
                completion(catCafe.menu)
                print(catCafe.menu.burgers)
            } else {
                print("FAIL")
            }
        }
        task.resume()
    }
}
