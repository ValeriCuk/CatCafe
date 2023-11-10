//
//  UIImageView+CatCafe.swift
//  CatCafe
//
//  Created by Lera Cuk on 10.11.2023.
//

import UIKit

extension UIImageView {
    
    func loadImage(with name: String) {
        guard let imageURL = URL(string: name) else {
            return
        }
        
        Task {
            let image = await URLSession.shared.loadImage(imageURL)
            self.image = image
        }
    }
}
