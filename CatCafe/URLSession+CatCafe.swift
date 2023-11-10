//
//  URLSession+CatCafe.swift
//  CatCafe
//
//  Created by Lera Cuk on 10.11.2023.
//

import UIKit

extension URLSession {
    
    @MainActor
    func loadImage(_ url: URL) async -> UIImage? {
        guard let (data, _) = try? await data(from: url) else {
            return nil
        }
        return UIImage(data: data)
    }
}
